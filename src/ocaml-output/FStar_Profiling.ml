open Prims
type counter =
  {
  cid: Prims.string ;
  total_time: Prims.int FStar_ST.ref ;
  running: Prims.bool FStar_ST.ref ;
  undercount: Prims.bool FStar_ST.ref }
let (__proj__Mkcounter__item__cid : counter -> Prims.string) =
  fun projectee ->
    match projectee with | { cid; total_time; running; undercount;_} -> cid
let (__proj__Mkcounter__item__total_time : counter -> Prims.int FStar_ST.ref)
  =
  fun projectee ->
    match projectee with
    | { cid; total_time; running; undercount;_} -> total_time
let (__proj__Mkcounter__item__running : counter -> Prims.bool FStar_ST.ref) =
  fun projectee ->
    match projectee with
    | { cid; total_time; running; undercount;_} -> running
let (__proj__Mkcounter__item__undercount :
  counter -> Prims.bool FStar_ST.ref) =
  fun projectee ->
    match projectee with
    | { cid; total_time; running; undercount;_} -> undercount
let (new_counter : Prims.string -> counter) =
  fun cid ->
    let uu____147 = FStar_Util.mk_ref Prims.int_zero in
    let uu____153 = FStar_Util.mk_ref false in
    let uu____159 = FStar_Util.mk_ref false in
    {
      cid;
      total_time = uu____147;
      running = uu____153;
      undercount = uu____159
    }
let (all_counters : counter FStar_Util.smap) =
  FStar_Util.smap_create (Prims.of_int (20))
let (create_or_lookup_counter : Prims.string -> counter) =
  fun cid ->
    let uu____177 = FStar_Util.smap_try_find all_counters cid in
    match uu____177 with
    | FStar_Pervasives_Native.Some c -> c
    | FStar_Pervasives_Native.None ->
        let c = new_counter cid in
        (FStar_Util.smap_add all_counters cid c; c)
let profile :
  'a .
    (unit -> 'a) ->
      Prims.string FStar_Pervasives_Native.option -> Prims.string -> 'a
  =
  fun f ->
    fun module_name ->
      fun cid ->
        let uu____221 = FStar_Options.profile_enabled module_name cid in
        if uu____221
        then
          let c = create_or_lookup_counter cid in
          let uu____225 = FStar_ST.op_Bang c.running in
          (if uu____225
           then f ()
           else
             (try
                (fun uu___31_258 ->
                   match () with
                   | () ->
                       (FStar_ST.op_Colon_Equals c.running true;
                        (let uu____282 = FStar_Util.record_time f in
                         match uu____282 with
                         | (res, elapsed) ->
                             ((let uu____293 =
                                 let uu____295 =
                                   FStar_ST.op_Bang c.total_time in
                                 uu____295 + elapsed in
                               FStar_ST.op_Colon_Equals c.total_time
                                 uu____293);
                              FStar_ST.op_Colon_Equals c.running false;
                              res)))) ()
              with
              | uu___30_365 ->
                  (FStar_ST.op_Colon_Equals c.running false;
                   FStar_ST.op_Colon_Equals c.undercount true;
                   FStar_Exn.raise uu___30_365)))
        else f ()
let (report_and_clear : Prims.string -> unit) =
  fun tag ->
    let ctrs =
      FStar_Util.smap_fold all_counters
        (fun uu____430 -> fun v -> fun l -> v :: l) [] in
    FStar_Util.smap_clear all_counters;
    (let ctrs1 =
       FStar_Util.sort_with
         (fun c1 ->
            fun c2 ->
              let uu____446 = FStar_ST.op_Bang c2.total_time in
              let uu____469 = FStar_ST.op_Bang c1.total_time in
              uu____446 - uu____469) ctrs in
     FStar_All.pipe_right ctrs1
       (FStar_List.iter
          (fun c ->
             let warn =
               let uu____500 = FStar_ST.op_Bang c.running in
               if uu____500
               then " (Warning, this counter is still running)"
               else
                 (let uu____528 = FStar_ST.op_Bang c.undercount in
                  if uu____528
                  then
                    " (Warning, some operations raised exceptions and we not accounted for)"
                  else "") in
             let uu____557 =
               let uu____559 = FStar_ST.op_Bang c.total_time in
               FStar_Util.string_of_int uu____559 in
             FStar_Util.print4 "%s, profiled %s:\t %s ms%s\n" tag c.cid
               uu____557 warn)))