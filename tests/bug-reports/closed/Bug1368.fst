(*
   Copyright 2008-2018 Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)
module Bug1368

assume val g : unit -> GTot bool

val test1 : unit -> Tot int
let test1 () =
    let x = (let y = g () in ()) in 42

val test2 : unit -> Tot int
[@@expect_failure [34]]
let test2 () =
    let y = g () in
    let x = () in
    42
