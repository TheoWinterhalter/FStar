module SL.ExamplesLocks2

open SL.Base
open SL.AutoTactic

(* Double locks... hey, if it works for 1 and 2, it works for n *)

let test17 (r s : ref int) : ST unit (fun p m -> exists v u. m == (r |> v <*> s |> u) /\ p () emp) [] by (sl_auto ()) =
  let l = mklock #(fun m -> True) [ii r; ii s] in
  ()

(* Same thing with the list backwards... should be robust *)
let test17' (r s : ref int) : ST unit (fun p m -> exists v u. m == (r |> v <*> s |> u) /\ p () emp) [] by (sl_auto ()) =
  let l = mklock #(fun m -> True) [ii s; ii r] in
  ()

let test18 () : ST unit (fun p m -> m == emp /\ p () emp) [] by (sl_auto ()) =
  let r = alloc 0 in
  let s = alloc 1 in
  let l = mklock #(fun m -> True) [ii r; ii s] in
  ()

(* Coupled references *)
let test19 () : ST unit (fun p m -> m == emp /\ p () emp) [] by (sl_auto ()) =
  let r = alloc 1 in
  let s = alloc 1 in
  let l = mklock #(fun m -> exists v u. m == (r |> u <*> s |> v) /\ v == u)  [ii r; ii s] in
  ()
  
let test20 () : ST unit (fun p m -> m == emp /\ (forall m'. p () m')) [] by (sl_auto ()) =
  let r = alloc 1 in
  let s = alloc 1 in
  let l = mklock #(fun m -> exists v u. m == (r |> u <*> s |> v) /\ v == u)  [ii r; ii s] in
  acquire l;
  ()

let test21 () : ST unit (fun p m -> m == emp /\ (forall m'. p () m')) [] by (sl_auto ()) =
  let r = alloc 1 in
  let s = alloc 1 in
  let l = mklock #(fun m -> exists v u. m == (r |> u <*> s |> v) /\ v == u)  [ii r; ii s] in
  acquire l;
  let v = !r in
  let u = !s in
  ()

let test22 () : ST unit (fun p m -> m == emp /\ (forall m'. p () m')) [] by (sl_auto ()) =
  let r = alloc 1 in
  let s = alloc 1 in
  let l = mklock #(fun m -> exists v u. mem_eq (m == (r |> u <*> s |> v)) /\ v == u)  [ii r; ii s] in
  acquire l;
  let v = !r in
  let u = !s in
  assert (v == u); (* Requires destructing a heap equality in the context *)
  ()

(* Calling an unknown procedure, can still conclude the invariant *)
assume val kinda_havoc : unit -> ST unit (fun p m -> m == emp /\ p () emp) []
let test23 () : ST unit (fun p m -> m == emp /\ (forall m'. p () m')) [] by (sl_auto ()) =
  let r = alloc 1 in
  let s = alloc 1 in
  let l = mklock #(fun m -> exists v u. mem_eq (m == (r |> u <*> s |> v)) /\ v == u)  [ii r; ii s] in
  kinda_havoc ();
  acquire l;
  let v = !r in
  let u = !s in
  assert (v == u); (* Requires destructing a heap equality in the context *)
  ()
