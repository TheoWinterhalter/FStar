open Prims
let cases :
  'Auu____10 'Auu____11 .
    ('Auu____10 -> 'Auu____11) ->
      'Auu____11 -> 'Auu____10 FStar_Pervasives_Native.option -> 'Auu____11
  =
  fun f  ->
    fun d  ->
      fun uu___0_31  ->
        match uu___0_31 with
        | FStar_Pervasives_Native.Some x -> f x
        | FStar_Pervasives_Native.None  -> d
  
type closure =
  | Clos of ((FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option *
  closure) Prims.list * FStar_Syntax_Syntax.term *
  ((FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option * closure)
  Prims.list * FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo *
  Prims.bool) 
  | Univ of FStar_Syntax_Syntax.universe 
  | Dummy 
let (uu___is_Clos : closure -> Prims.bool) =
  fun projectee  ->
    match projectee with | Clos _0 -> true | uu____129 -> false
  
let (__proj__Clos__item___0 :
  closure ->
    ((FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option * closure)
      Prims.list * FStar_Syntax_Syntax.term * ((FStar_Syntax_Syntax.binder
      FStar_Pervasives_Native.option * closure) Prims.list *
      FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo * Prims.bool))
  = fun projectee  -> match projectee with | Clos _0 -> _0 
let (uu___is_Univ : closure -> Prims.bool) =
  fun projectee  ->
    match projectee with | Univ _0 -> true | uu____241 -> false
  
let (__proj__Univ__item___0 : closure -> FStar_Syntax_Syntax.universe) =
  fun projectee  -> match projectee with | Univ _0 -> _0 
let (uu___is_Dummy : closure -> Prims.bool) =
  fun projectee  ->
    match projectee with | Dummy  -> true | uu____259 -> false
  
type env =
  (FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option * closure)
    Prims.list
let (dummy :
  (FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option * closure)) =
  (FStar_Pervasives_Native.None, Dummy) 
type branches =
  (FStar_Syntax_Syntax.pat * FStar_Syntax_Syntax.term
    FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term) Prims.list
type stack_elt =
  | Arg of (closure * FStar_Syntax_Syntax.aqual * FStar_Range.range) 
  | UnivArgs of (FStar_Syntax_Syntax.universe Prims.list * FStar_Range.range)
  
  | MemoLazy of (env * FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo 
  | Match of (env * branches * FStar_TypeChecker_Cfg.cfg * FStar_Range.range)
  
  | Abs of (env * FStar_Syntax_Syntax.binders * env *
  FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option *
  FStar_Range.range) 
  | App of (env * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.aqual *
  FStar_Range.range) 
  | Meta of (env * FStar_Syntax_Syntax.metadata * FStar_Range.range) 
  | Let of (env * FStar_Syntax_Syntax.binders *
  FStar_Syntax_Syntax.letbinding * FStar_Range.range) 
  | Cfg of FStar_TypeChecker_Cfg.cfg 
  | Debug of (FStar_Syntax_Syntax.term * FStar_Util.time) 
let (uu___is_Arg : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Arg _0 -> true | uu____428 -> false
  
let (__proj__Arg__item___0 :
  stack_elt -> (closure * FStar_Syntax_Syntax.aqual * FStar_Range.range)) =
  fun projectee  -> match projectee with | Arg _0 -> _0 
let (uu___is_UnivArgs : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | UnivArgs _0 -> true | uu____471 -> false
  
let (__proj__UnivArgs__item___0 :
  stack_elt -> (FStar_Syntax_Syntax.universe Prims.list * FStar_Range.range))
  = fun projectee  -> match projectee with | UnivArgs _0 -> _0 
let (uu___is_MemoLazy : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | MemoLazy _0 -> true | uu____514 -> false
  
let (__proj__MemoLazy__item___0 :
  stack_elt -> (env * FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo) =
  fun projectee  -> match projectee with | MemoLazy _0 -> _0 
let (uu___is_Match : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Match _0 -> true | uu____559 -> false
  
let (__proj__Match__item___0 :
  stack_elt ->
    (env * branches * FStar_TypeChecker_Cfg.cfg * FStar_Range.range))
  = fun projectee  -> match projectee with | Match _0 -> _0 
let (uu___is_Abs : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Abs _0 -> true | uu____614 -> false
  
let (__proj__Abs__item___0 :
  stack_elt ->
    (env * FStar_Syntax_Syntax.binders * env *
      FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option *
      FStar_Range.range))
  = fun projectee  -> match projectee with | Abs _0 -> _0 
let (uu___is_App : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | App _0 -> true | uu____677 -> false
  
let (__proj__App__item___0 :
  stack_elt ->
    (env * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.aqual *
      FStar_Range.range))
  = fun projectee  -> match projectee with | App _0 -> _0 
let (uu___is_Meta : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Meta _0 -> true | uu____726 -> false
  
let (__proj__Meta__item___0 :
  stack_elt -> (env * FStar_Syntax_Syntax.metadata * FStar_Range.range)) =
  fun projectee  -> match projectee with | Meta _0 -> _0 
let (uu___is_Let : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Let _0 -> true | uu____771 -> false
  
let (__proj__Let__item___0 :
  stack_elt ->
    (env * FStar_Syntax_Syntax.binders * FStar_Syntax_Syntax.letbinding *
      FStar_Range.range))
  = fun projectee  -> match projectee with | Let _0 -> _0 
let (uu___is_Cfg : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Cfg _0 -> true | uu____814 -> false
  
let (__proj__Cfg__item___0 : stack_elt -> FStar_TypeChecker_Cfg.cfg) =
  fun projectee  -> match projectee with | Cfg _0 -> _0 
let (uu___is_Debug : stack_elt -> Prims.bool) =
  fun projectee  ->
    match projectee with | Debug _0 -> true | uu____837 -> false
  
let (__proj__Debug__item___0 :
  stack_elt -> (FStar_Syntax_Syntax.term * FStar_Util.time)) =
  fun projectee  -> match projectee with | Debug _0 -> _0 
type stack = stack_elt Prims.list
let (head_of : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t  ->
    let uu____866 = FStar_Syntax_Util.head_and_args' t  in
    match uu____866 with | (hd1,uu____882) -> hd1
  
let mk :
  'Auu____910 .
    'Auu____910 ->
      FStar_Range.range -> 'Auu____910 FStar_Syntax_Syntax.syntax
  =
  fun t  -> fun r  -> FStar_Syntax_Syntax.mk t FStar_Pervasives_Native.None r 
let set_memo :
  'a . FStar_TypeChecker_Cfg.cfg -> 'a FStar_Syntax_Syntax.memo -> 'a -> unit
  =
  fun cfg  ->
    fun r  ->
      fun t  ->
        if cfg.FStar_TypeChecker_Cfg.memoize_lazy
        then
          let uu____953 = FStar_ST.op_Bang r  in
          match uu____953 with
          | FStar_Pervasives_Native.Some uu____979 ->
              failwith "Unexpected set_memo: thunk already evaluated"
          | FStar_Pervasives_Native.None  ->
              FStar_ST.op_Colon_Equals r (FStar_Pervasives_Native.Some t)
        else ()
  
let rec (env_to_string :
  (FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option * closure)
    Prims.list -> Prims.string)
  =
  fun env  ->
    let uu____1034 =
      FStar_List.map
        (fun uu____1050  ->
           match uu____1050 with
           | (bopt,c) ->
               let uu____1064 =
                 match bopt with
                 | FStar_Pervasives_Native.None  -> "."
                 | FStar_Pervasives_Native.Some x ->
                     FStar_Syntax_Print.binder_to_string x
                  in
               let uu____1069 = closure_to_string c  in
               FStar_Util.format2 "(%s, %s)" uu____1064 uu____1069) env
       in
    FStar_All.pipe_right uu____1034 (FStar_String.concat "; ")

and (closure_to_string : closure -> Prims.string) =
  fun uu___1_1077  ->
    match uu___1_1077 with
    | Clos (env,t,uu____1081,uu____1082) ->
        let uu____1129 =
          FStar_All.pipe_right (FStar_List.length env)
            FStar_Util.string_of_int
           in
        let uu____1139 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.format2 "(env=%s elts; %s)" uu____1129 uu____1139
    | Univ uu____1142 -> "Univ"
    | Dummy  -> "dummy"

let (stack_elt_to_string : stack_elt -> Prims.string) =
  fun uu___2_1151  ->
    match uu___2_1151 with
    | Arg (c,uu____1154,uu____1155) ->
        let uu____1156 = closure_to_string c  in
        FStar_Util.format1 "Closure %s" uu____1156
    | MemoLazy uu____1159 -> "MemoLazy"
    | Abs (uu____1167,bs,uu____1169,uu____1170,uu____1171) ->
        let uu____1176 =
          FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length bs)
           in
        FStar_Util.format1 "Abs %s" uu____1176
    | UnivArgs uu____1187 -> "UnivArgs"
    | Match uu____1195 -> "Match"
    | App (uu____1205,t,uu____1207,uu____1208) ->
        let uu____1209 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.format1 "App %s" uu____1209
    | Meta (uu____1212,m,uu____1214) -> "Meta"
    | Let uu____1216 -> "Let"
    | Cfg uu____1226 -> "Cfg"
    | Debug (t,uu____1229) ->
        let uu____1230 = FStar_Syntax_Print.term_to_string t  in
        FStar_Util.format1 "Debug %s" uu____1230
  
let (stack_to_string : stack_elt Prims.list -> Prims.string) =
  fun s  ->
    let uu____1244 = FStar_List.map stack_elt_to_string s  in
    FStar_All.pipe_right uu____1244 (FStar_String.concat "; ")
  
let is_empty : 'Auu____1259 . 'Auu____1259 Prims.list -> Prims.bool =
  fun uu___3_1267  ->
    match uu___3_1267 with | [] -> true | uu____1271 -> false
  
let (lookup_bvar :
  (FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option * closure)
    Prims.list -> FStar_Syntax_Syntax.bv -> closure)
  =
  fun env  ->
    fun x  ->
      try
        (fun uu___115_1304  ->
           match () with
           | () ->
               let uu____1305 =
                 FStar_List.nth env x.FStar_Syntax_Syntax.index  in
               FStar_Pervasives_Native.snd uu____1305) ()
      with
      | uu___114_1322 ->
          let uu____1323 =
            let uu____1325 = FStar_Syntax_Print.db_to_string x  in
            let uu____1327 = env_to_string env  in
            FStar_Util.format2 "Failed to find %s\nEnv is %s\n" uu____1325
              uu____1327
             in
          failwith uu____1323
  
let (downgrade_ghost_effect_name :
  FStar_Ident.lident -> FStar_Ident.lident FStar_Pervasives_Native.option) =
  fun l  ->
    let uu____1338 =
      FStar_Ident.lid_equals l FStar_Parser_Const.effect_Ghost_lid  in
    if uu____1338
    then FStar_Pervasives_Native.Some FStar_Parser_Const.effect_Pure_lid
    else
      (let uu____1345 =
         FStar_Ident.lid_equals l FStar_Parser_Const.effect_GTot_lid  in
       if uu____1345
       then FStar_Pervasives_Native.Some FStar_Parser_Const.effect_Tot_lid
       else
         (let uu____1352 =
            FStar_Ident.lid_equals l FStar_Parser_Const.effect_GHOST_lid  in
          if uu____1352
          then
            FStar_Pervasives_Native.Some FStar_Parser_Const.effect_PURE_lid
          else FStar_Pervasives_Native.None))
  
let (norm_universe :
  FStar_TypeChecker_Cfg.cfg ->
    env -> FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe)
  =
  fun cfg  ->
    fun env  ->
      fun u  ->
        let norm_univs us =
          let us1 = FStar_Util.sort_with FStar_Syntax_Util.compare_univs us
             in
          let uu____1390 =
            FStar_List.fold_left
              (fun uu____1416  ->
                 fun u1  ->
                   match uu____1416 with
                   | (cur_kernel,cur_max,out) ->
                       let uu____1441 = FStar_Syntax_Util.univ_kernel u1  in
                       (match uu____1441 with
                        | (k_u,n1) ->
                            let uu____1459 =
                              FStar_Syntax_Util.eq_univs cur_kernel k_u  in
                            if uu____1459
                            then (cur_kernel, u1, out)
                            else (k_u, u1, (cur_max :: out))))
              (FStar_Syntax_Syntax.U_zero, FStar_Syntax_Syntax.U_zero, [])
              us1
             in
          match uu____1390 with
          | (uu____1480,u1,out) -> FStar_List.rev (u1 :: out)  in
        let rec aux u1 =
          let u2 = FStar_Syntax_Subst.compress_univ u1  in
          match u2 with
          | FStar_Syntax_Syntax.U_bvar x ->
              (try
                 (fun uu___149_1506  ->
                    match () with
                    | () ->
                        let uu____1509 =
                          let uu____1510 = FStar_List.nth env x  in
                          FStar_Pervasives_Native.snd uu____1510  in
                        (match uu____1509 with
                         | Univ u3 ->
                             ((let uu____1529 =
                                 FStar_All.pipe_left
                                   (FStar_TypeChecker_Env.debug
                                      cfg.FStar_TypeChecker_Cfg.tcenv)
                                   (FStar_Options.Other "univ_norm")
                                  in
                               if uu____1529
                               then
                                 let uu____1534 =
                                   FStar_Syntax_Print.univ_to_string u3  in
                                 FStar_Util.print1
                                   "Univ (in norm_universe): %s\n" uu____1534
                               else ());
                              aux u3)
                         | Dummy  -> [u2]
                         | uu____1539 ->
                             let uu____1540 =
                               let uu____1542 = FStar_Util.string_of_int x
                                  in
                               FStar_Util.format1
                                 "Impossible: universe variable u@%s bound to a term"
                                 uu____1542
                                in
                             failwith uu____1540)) ()
               with
               | uu____1552 ->
                   if
                     (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.allow_unbound_universes
                   then [FStar_Syntax_Syntax.U_unknown]
                   else
                     (let uu____1558 =
                        let uu____1560 = FStar_Util.string_of_int x  in
                        FStar_String.op_Hat "Universe variable not found: u@"
                          uu____1560
                         in
                      failwith uu____1558))
          | FStar_Syntax_Syntax.U_unif uu____1565 when
              (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.check_no_uvars
              -> [FStar_Syntax_Syntax.U_zero]
          | FStar_Syntax_Syntax.U_zero  -> [u2]
          | FStar_Syntax_Syntax.U_unif uu____1574 -> [u2]
          | FStar_Syntax_Syntax.U_name uu____1583 -> [u2]
          | FStar_Syntax_Syntax.U_unknown  -> [u2]
          | FStar_Syntax_Syntax.U_max [] -> [FStar_Syntax_Syntax.U_zero]
          | FStar_Syntax_Syntax.U_max us ->
              let us1 =
                let uu____1590 = FStar_List.collect aux us  in
                FStar_All.pipe_right uu____1590 norm_univs  in
              (match us1 with
               | u_k::hd1::rest ->
                   let rest1 = hd1 :: rest  in
                   let uu____1607 = FStar_Syntax_Util.univ_kernel u_k  in
                   (match uu____1607 with
                    | (FStar_Syntax_Syntax.U_zero ,n1) ->
                        let uu____1618 =
                          FStar_All.pipe_right rest1
                            (FStar_List.for_all
                               (fun u3  ->
                                  let uu____1628 =
                                    FStar_Syntax_Util.univ_kernel u3  in
                                  match uu____1628 with
                                  | (uu____1635,m) -> n1 <= m))
                           in
                        if uu____1618 then rest1 else us1
                    | uu____1644 -> us1)
               | uu____1650 -> us1)
          | FStar_Syntax_Syntax.U_succ u3 ->
              let uu____1654 = aux u3  in
              FStar_List.map (fun _1657  -> FStar_Syntax_Syntax.U_succ _1657)
                uu____1654
           in
        if
          (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.erase_universes
        then FStar_Syntax_Syntax.U_unknown
        else
          (let uu____1661 = aux u  in
           match uu____1661 with
           | [] -> FStar_Syntax_Syntax.U_zero
           | (FStar_Syntax_Syntax.U_zero )::[] -> FStar_Syntax_Syntax.U_zero
           | (FStar_Syntax_Syntax.U_zero )::u1::[] -> u1
           | (FStar_Syntax_Syntax.U_zero )::us ->
               FStar_Syntax_Syntax.U_max us
           | u1::[] -> u1
           | us -> FStar_Syntax_Syntax.U_max us)
  
let rec (inline_closure_env :
  FStar_TypeChecker_Cfg.cfg ->
    env ->
      stack_elt Prims.list ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t  ->
          FStar_TypeChecker_Cfg.log cfg
            (fun uu____1830  ->
               let uu____1831 = FStar_Syntax_Print.tag_of_term t  in
               let uu____1833 = env_to_string env  in
               let uu____1835 = FStar_Syntax_Print.term_to_string t  in
               FStar_Util.print3 "\n>>> %s (env=%s) Closure_as_term %s\n"
                 uu____1831 uu____1833 uu____1835);
          (match env with
           | [] when
               FStar_All.pipe_left Prims.op_Negation
                 (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.compress_uvars
               -> rebuild_closure cfg env stack t
           | uu____1848 ->
               (match t.FStar_Syntax_Syntax.n with
                | FStar_Syntax_Syntax.Tm_delayed uu____1851 ->
                    let uu____1874 = FStar_Syntax_Subst.compress t  in
                    inline_closure_env cfg env stack uu____1874
                | FStar_Syntax_Syntax.Tm_unknown  ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_constant uu____1875 ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_name uu____1876 ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_lazy uu____1877 ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_fvar uu____1878 ->
                    rebuild_closure cfg env stack t
                | FStar_Syntax_Syntax.Tm_uvar (uv,s) ->
                    if
                      (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.check_no_uvars
                    then
                      let t1 = FStar_Syntax_Subst.compress t  in
                      (match t1.FStar_Syntax_Syntax.n with
                       | FStar_Syntax_Syntax.Tm_uvar uu____1903 ->
                           let uu____1916 =
                             let uu____1918 =
                               FStar_Range.string_of_range
                                 t1.FStar_Syntax_Syntax.pos
                                in
                             let uu____1920 =
                               FStar_Syntax_Print.term_to_string t1  in
                             FStar_Util.format2
                               "(%s): CheckNoUvars: Unexpected unification variable remains: %s"
                               uu____1918 uu____1920
                              in
                           failwith uu____1916
                       | uu____1925 -> inline_closure_env cfg env stack t1)
                    else
                      (let s' =
                         FStar_All.pipe_right (FStar_Pervasives_Native.fst s)
                           (FStar_List.map
                              (fun s1  ->
                                 FStar_All.pipe_right s1
                                   (FStar_List.map
                                      (fun uu___4_1961  ->
                                         match uu___4_1961 with
                                         | FStar_Syntax_Syntax.NT (x,t1) ->
                                             let uu____1968 =
                                               let uu____1975 =
                                                 inline_closure_env cfg env
                                                   [] t1
                                                  in
                                               (x, uu____1975)  in
                                             FStar_Syntax_Syntax.NT
                                               uu____1968
                                         | FStar_Syntax_Syntax.NM (x,i) ->
                                             let x_i =
                                               FStar_Syntax_Syntax.bv_to_tm
                                                 (let uu___243_1987 = x  in
                                                  {
                                                    FStar_Syntax_Syntax.ppname
                                                      =
                                                      (uu___243_1987.FStar_Syntax_Syntax.ppname);
                                                    FStar_Syntax_Syntax.index
                                                      = i;
                                                    FStar_Syntax_Syntax.sort
                                                      =
                                                      (uu___243_1987.FStar_Syntax_Syntax.sort)
                                                  })
                                                in
                                             let t1 =
                                               inline_closure_env cfg env []
                                                 x_i
                                                in
                                             (match t1.FStar_Syntax_Syntax.n
                                              with
                                              | FStar_Syntax_Syntax.Tm_bvar
                                                  x_j ->
                                                  FStar_Syntax_Syntax.NM
                                                    (x,
                                                      (x_j.FStar_Syntax_Syntax.index))
                                              | uu____1993 ->
                                                  FStar_Syntax_Syntax.NT
                                                    (x, t1))
                                         | uu____1996 ->
                                             failwith
                                               "Impossible: subst invariant of uvar nodes"))))
                          in
                       let t1 =
                         let uu___252_2001 = t  in
                         {
                           FStar_Syntax_Syntax.n =
                             (FStar_Syntax_Syntax.Tm_uvar
                                (uv, (s', (FStar_Pervasives_Native.snd s))));
                           FStar_Syntax_Syntax.pos =
                             (uu___252_2001.FStar_Syntax_Syntax.pos);
                           FStar_Syntax_Syntax.vars =
                             (uu___252_2001.FStar_Syntax_Syntax.vars)
                         }  in
                       rebuild_closure cfg env stack t1)
                | FStar_Syntax_Syntax.Tm_type u ->
                    let t1 =
                      let uu____2022 =
                        let uu____2023 = norm_universe cfg env u  in
                        FStar_Syntax_Syntax.Tm_type uu____2023  in
                      mk uu____2022 t.FStar_Syntax_Syntax.pos  in
                    rebuild_closure cfg env stack t1
                | FStar_Syntax_Syntax.Tm_uinst (t',us) ->
                    let t1 =
                      let uu____2031 =
                        FStar_List.map (norm_universe cfg env) us  in
                      FStar_Syntax_Syntax.mk_Tm_uinst t' uu____2031  in
                    rebuild_closure cfg env stack t1
                | FStar_Syntax_Syntax.Tm_bvar x ->
                    let uu____2033 = lookup_bvar env x  in
                    (match uu____2033 with
                     | Univ uu____2036 ->
                         failwith
                           "Impossible: term variable is bound to a universe"
                     | Dummy  ->
                         let x1 =
                           let uu___268_2041 = x  in
                           {
                             FStar_Syntax_Syntax.ppname =
                               (uu___268_2041.FStar_Syntax_Syntax.ppname);
                             FStar_Syntax_Syntax.index =
                               (uu___268_2041.FStar_Syntax_Syntax.index);
                             FStar_Syntax_Syntax.sort =
                               FStar_Syntax_Syntax.tun
                           }  in
                         let t1 =
                           mk (FStar_Syntax_Syntax.Tm_bvar x1)
                             t.FStar_Syntax_Syntax.pos
                            in
                         rebuild_closure cfg env stack t1
                     | Clos (env1,t0,uu____2047,uu____2048) ->
                         inline_closure_env cfg env1 stack t0)
                | FStar_Syntax_Syntax.Tm_app (head1,args) ->
                    let stack1 =
                      FStar_All.pipe_right stack
                        (FStar_List.fold_right
                           (fun uu____2139  ->
                              fun stack1  ->
                                match uu____2139 with
                                | (a,aq) ->
                                    let uu____2151 =
                                      let uu____2152 =
                                        let uu____2159 =
                                          let uu____2160 =
                                            let uu____2192 =
                                              FStar_Util.mk_ref
                                                FStar_Pervasives_Native.None
                                               in
                                            (env, a, uu____2192, false)  in
                                          Clos uu____2160  in
                                        (uu____2159, aq,
                                          (t.FStar_Syntax_Syntax.pos))
                                         in
                                      Arg uu____2152  in
                                    uu____2151 :: stack1) args)
                       in
                    inline_closure_env cfg env stack1 head1
                | FStar_Syntax_Syntax.Tm_abs (bs,body,lopt) ->
                    let env' =
                      FStar_All.pipe_right env
                        (FStar_List.fold_right
                           (fun _b  ->
                              fun env1  ->
                                (FStar_Pervasives_Native.None, Dummy) :: env1)
                           bs)
                       in
                    let stack1 =
                      (Abs (env, bs, env', lopt, (t.FStar_Syntax_Syntax.pos)))
                      :: stack  in
                    inline_closure_env cfg env' stack1 body
                | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                    let uu____2360 = close_binders cfg env bs  in
                    (match uu____2360 with
                     | (bs1,env') ->
                         let c1 = close_comp cfg env' c  in
                         let t1 =
                           mk (FStar_Syntax_Syntax.Tm_arrow (bs1, c1))
                             t.FStar_Syntax_Syntax.pos
                            in
                         rebuild_closure cfg env stack t1)
                | FStar_Syntax_Syntax.Tm_refine (x,uu____2410) when
                    (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.for_extraction
                    ->
                    inline_closure_env cfg env stack
                      x.FStar_Syntax_Syntax.sort
                | FStar_Syntax_Syntax.Tm_refine (x,phi) ->
                    let uu____2421 =
                      let uu____2434 =
                        let uu____2443 = FStar_Syntax_Syntax.mk_binder x  in
                        [uu____2443]  in
                      close_binders cfg env uu____2434  in
                    (match uu____2421 with
                     | (x1,env1) ->
                         let phi1 = non_tail_inline_closure_env cfg env1 phi
                            in
                         let t1 =
                           let uu____2488 =
                             let uu____2489 =
                               let uu____2496 =
                                 let uu____2497 = FStar_List.hd x1  in
                                 FStar_All.pipe_right uu____2497
                                   FStar_Pervasives_Native.fst
                                  in
                               (uu____2496, phi1)  in
                             FStar_Syntax_Syntax.Tm_refine uu____2489  in
                           mk uu____2488 t.FStar_Syntax_Syntax.pos  in
                         rebuild_closure cfg env1 stack t1)
                | FStar_Syntax_Syntax.Tm_ascribed (t1,(annot,tacopt),lopt) ->
                    let annot1 =
                      match annot with
                      | FStar_Util.Inl t2 ->
                          let uu____2596 =
                            non_tail_inline_closure_env cfg env t2  in
                          FStar_Util.Inl uu____2596
                      | FStar_Util.Inr c ->
                          let uu____2610 = close_comp cfg env c  in
                          FStar_Util.Inr uu____2610
                       in
                    let tacopt1 =
                      FStar_Util.map_opt tacopt
                        (non_tail_inline_closure_env cfg env)
                       in
                    let t2 =
                      let uu____2629 =
                        let uu____2630 =
                          let uu____2657 =
                            non_tail_inline_closure_env cfg env t1  in
                          (uu____2657, (annot1, tacopt1), lopt)  in
                        FStar_Syntax_Syntax.Tm_ascribed uu____2630  in
                      mk uu____2629 t.FStar_Syntax_Syntax.pos  in
                    rebuild_closure cfg env stack t2
                | FStar_Syntax_Syntax.Tm_quoted (t',qi) ->
                    let t1 =
                      match qi.FStar_Syntax_Syntax.qkind with
                      | FStar_Syntax_Syntax.Quote_dynamic  ->
                          let uu____2703 =
                            let uu____2704 =
                              let uu____2711 =
                                non_tail_inline_closure_env cfg env t'  in
                              (uu____2711, qi)  in
                            FStar_Syntax_Syntax.Tm_quoted uu____2704  in
                          mk uu____2703 t.FStar_Syntax_Syntax.pos
                      | FStar_Syntax_Syntax.Quote_static  ->
                          let qi1 =
                            FStar_Syntax_Syntax.on_antiquoted
                              (non_tail_inline_closure_env cfg env) qi
                             in
                          mk (FStar_Syntax_Syntax.Tm_quoted (t', qi1))
                            t.FStar_Syntax_Syntax.pos
                       in
                    rebuild_closure cfg env stack t1
                | FStar_Syntax_Syntax.Tm_meta (t',m) ->
                    let stack1 = (Meta (env, m, (t.FStar_Syntax_Syntax.pos)))
                      :: stack  in
                    inline_closure_env cfg env stack1 t'
                | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
                    let env0 = env  in
                    let env1 =
                      FStar_List.fold_left
                        (fun env1  -> fun uu____2766  -> dummy :: env1) env
                        lb.FStar_Syntax_Syntax.lbunivs
                       in
                    let typ =
                      non_tail_inline_closure_env cfg env1
                        lb.FStar_Syntax_Syntax.lbtyp
                       in
                    let def =
                      non_tail_inline_closure_env cfg env1
                        lb.FStar_Syntax_Syntax.lbdef
                       in
                    let uu____2787 =
                      let uu____2798 = FStar_Syntax_Syntax.is_top_level [lb]
                         in
                      if uu____2798
                      then ((lb.FStar_Syntax_Syntax.lbname), body)
                      else
                        (let x =
                           FStar_Util.left lb.FStar_Syntax_Syntax.lbname  in
                         let uu____2820 =
                           non_tail_inline_closure_env cfg (dummy :: env0)
                             body
                            in
                         ((FStar_Util.Inl
                             (let uu___360_2836 = x  in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___360_2836.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index =
                                  (uu___360_2836.FStar_Syntax_Syntax.index);
                                FStar_Syntax_Syntax.sort = typ
                              })), uu____2820))
                       in
                    (match uu____2787 with
                     | (nm,body1) ->
                         let lb1 =
                           let uu___365_2854 = lb  in
                           {
                             FStar_Syntax_Syntax.lbname = nm;
                             FStar_Syntax_Syntax.lbunivs =
                               (uu___365_2854.FStar_Syntax_Syntax.lbunivs);
                             FStar_Syntax_Syntax.lbtyp = typ;
                             FStar_Syntax_Syntax.lbeff =
                               (uu___365_2854.FStar_Syntax_Syntax.lbeff);
                             FStar_Syntax_Syntax.lbdef = def;
                             FStar_Syntax_Syntax.lbattrs =
                               (uu___365_2854.FStar_Syntax_Syntax.lbattrs);
                             FStar_Syntax_Syntax.lbpos =
                               (uu___365_2854.FStar_Syntax_Syntax.lbpos)
                           }  in
                         let t1 =
                           mk
                             (FStar_Syntax_Syntax.Tm_let
                                ((false, [lb1]), body1))
                             t.FStar_Syntax_Syntax.pos
                            in
                         rebuild_closure cfg env0 stack t1)
                | FStar_Syntax_Syntax.Tm_let ((uu____2871,lbs),body) ->
                    let norm_one_lb env1 lb =
                      let env_univs =
                        FStar_List.fold_right
                          (fun uu____2937  -> fun env2  -> dummy :: env2)
                          lb.FStar_Syntax_Syntax.lbunivs env1
                         in
                      let env2 =
                        let uu____2954 = FStar_Syntax_Syntax.is_top_level lbs
                           in
                        if uu____2954
                        then env_univs
                        else
                          FStar_List.fold_right
                            (fun uu____2969  -> fun env2  -> dummy :: env2)
                            lbs env_univs
                         in
                      let ty =
                        non_tail_inline_closure_env cfg env_univs
                          lb.FStar_Syntax_Syntax.lbtyp
                         in
                      let nm =
                        let uu____2993 = FStar_Syntax_Syntax.is_top_level lbs
                           in
                        if uu____2993
                        then lb.FStar_Syntax_Syntax.lbname
                        else
                          (let x =
                             FStar_Util.left lb.FStar_Syntax_Syntax.lbname
                              in
                           FStar_Util.Inl
                             (let uu___388_3004 = x  in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___388_3004.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index =
                                  (uu___388_3004.FStar_Syntax_Syntax.index);
                                FStar_Syntax_Syntax.sort = ty
                              }))
                         in
                      let uu___391_3005 = lb  in
                      let uu____3006 =
                        non_tail_inline_closure_env cfg env2
                          lb.FStar_Syntax_Syntax.lbdef
                         in
                      {
                        FStar_Syntax_Syntax.lbname = nm;
                        FStar_Syntax_Syntax.lbunivs =
                          (uu___391_3005.FStar_Syntax_Syntax.lbunivs);
                        FStar_Syntax_Syntax.lbtyp = ty;
                        FStar_Syntax_Syntax.lbeff =
                          (uu___391_3005.FStar_Syntax_Syntax.lbeff);
                        FStar_Syntax_Syntax.lbdef = uu____3006;
                        FStar_Syntax_Syntax.lbattrs =
                          (uu___391_3005.FStar_Syntax_Syntax.lbattrs);
                        FStar_Syntax_Syntax.lbpos =
                          (uu___391_3005.FStar_Syntax_Syntax.lbpos)
                      }  in
                    let lbs1 =
                      FStar_All.pipe_right lbs
                        (FStar_List.map (norm_one_lb env))
                       in
                    let body1 =
                      let body_env =
                        FStar_List.fold_right
                          (fun uu____3038  -> fun env1  -> dummy :: env1)
                          lbs1 env
                         in
                      non_tail_inline_closure_env cfg body_env body  in
                    let t1 =
                      mk (FStar_Syntax_Syntax.Tm_let ((true, lbs1), body1))
                        t.FStar_Syntax_Syntax.pos
                       in
                    rebuild_closure cfg env stack t1
                | FStar_Syntax_Syntax.Tm_match (head1,branches) ->
                    let stack1 =
                      (Match
                         (env, branches, cfg, (t.FStar_Syntax_Syntax.pos)))
                      :: stack  in
                    inline_closure_env cfg env stack1 head1))

and (non_tail_inline_closure_env :
  FStar_TypeChecker_Cfg.cfg ->
    env ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  = fun cfg  -> fun env  -> fun t  -> inline_closure_env cfg env [] t

and (rebuild_closure :
  FStar_TypeChecker_Cfg.cfg ->
    env ->
      stack_elt Prims.list ->
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t  ->
          FStar_TypeChecker_Cfg.log cfg
            (fun uu____3130  ->
               let uu____3131 = FStar_Syntax_Print.tag_of_term t  in
               let uu____3133 = env_to_string env  in
               let uu____3135 = stack_to_string stack  in
               let uu____3137 = FStar_Syntax_Print.term_to_string t  in
               FStar_Util.print4
                 "\n>>> %s (env=%s, stack=%s) Rebuild closure_as_term %s\n"
                 uu____3131 uu____3133 uu____3135 uu____3137);
          (match stack with
           | [] -> t
           | (Arg (Clos (env_arg,tm,uu____3144,uu____3145),aq,r))::stack1 ->
               let stack2 = (App (env, t, aq, r)) :: stack1  in
               inline_closure_env cfg env_arg stack2 tm
           | (App (env1,head1,aq,r))::stack1 ->
               let t1 =
                 FStar_Syntax_Syntax.extend_app head1 (t, aq)
                   FStar_Pervasives_Native.None r
                  in
               rebuild_closure cfg env1 stack1 t1
           | (Abs (env',bs,env'',lopt,r))::stack1 ->
               let uu____3226 = close_binders cfg env' bs  in
               (match uu____3226 with
                | (bs1,uu____3242) ->
                    let lopt1 = close_lcomp_opt cfg env'' lopt  in
                    let uu____3262 =
                      let uu___449_3265 = FStar_Syntax_Util.abs bs1 t lopt1
                         in
                      {
                        FStar_Syntax_Syntax.n =
                          (uu___449_3265.FStar_Syntax_Syntax.n);
                        FStar_Syntax_Syntax.pos = r;
                        FStar_Syntax_Syntax.vars =
                          (uu___449_3265.FStar_Syntax_Syntax.vars)
                      }  in
                    rebuild_closure cfg env stack1 uu____3262)
           | (Match (env1,branches,cfg1,r))::stack1 ->
               let close_one_branch env2 uu____3321 =
                 match uu____3321 with
                 | (pat,w_opt,tm) ->
                     let rec norm_pat env3 p =
                       match p.FStar_Syntax_Syntax.v with
                       | FStar_Syntax_Syntax.Pat_constant uu____3436 ->
                           (p, env3)
                       | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
                           let uu____3467 =
                             FStar_All.pipe_right pats
                               (FStar_List.fold_left
                                  (fun uu____3556  ->
                                     fun uu____3557  ->
                                       match (uu____3556, uu____3557) with
                                       | ((pats1,env4),(p1,b)) ->
                                           let uu____3707 = norm_pat env4 p1
                                              in
                                           (match uu____3707 with
                                            | (p2,env5) ->
                                                (((p2, b) :: pats1), env5)))
                                  ([], env3))
                              in
                           (match uu____3467 with
                            | (pats1,env4) ->
                                ((let uu___486_3877 = p  in
                                  {
                                    FStar_Syntax_Syntax.v =
                                      (FStar_Syntax_Syntax.Pat_cons
                                         (fv, (FStar_List.rev pats1)));
                                    FStar_Syntax_Syntax.p =
                                      (uu___486_3877.FStar_Syntax_Syntax.p)
                                  }), env4))
                       | FStar_Syntax_Syntax.Pat_var x ->
                           let x1 =
                             let uu___490_3898 = x  in
                             let uu____3899 =
                               non_tail_inline_closure_env cfg1 env3
                                 x.FStar_Syntax_Syntax.sort
                                in
                             {
                               FStar_Syntax_Syntax.ppname =
                                 (uu___490_3898.FStar_Syntax_Syntax.ppname);
                               FStar_Syntax_Syntax.index =
                                 (uu___490_3898.FStar_Syntax_Syntax.index);
                               FStar_Syntax_Syntax.sort = uu____3899
                             }  in
                           ((let uu___493_3913 = p  in
                             {
                               FStar_Syntax_Syntax.v =
                                 (FStar_Syntax_Syntax.Pat_var x1);
                               FStar_Syntax_Syntax.p =
                                 (uu___493_3913.FStar_Syntax_Syntax.p)
                             }), (dummy :: env3))
                       | FStar_Syntax_Syntax.Pat_wild x ->
                           let x1 =
                             let uu___497_3924 = x  in
                             let uu____3925 =
                               non_tail_inline_closure_env cfg1 env3
                                 x.FStar_Syntax_Syntax.sort
                                in
                             {
                               FStar_Syntax_Syntax.ppname =
                                 (uu___497_3924.FStar_Syntax_Syntax.ppname);
                               FStar_Syntax_Syntax.index =
                                 (uu___497_3924.FStar_Syntax_Syntax.index);
                               FStar_Syntax_Syntax.sort = uu____3925
                             }  in
                           ((let uu___500_3939 = p  in
                             {
                               FStar_Syntax_Syntax.v =
                                 (FStar_Syntax_Syntax.Pat_wild x1);
                               FStar_Syntax_Syntax.p =
                                 (uu___500_3939.FStar_Syntax_Syntax.p)
                             }), (dummy :: env3))
                       | FStar_Syntax_Syntax.Pat_dot_term (x,t1) ->
                           let x1 =
                             let uu___506_3955 = x  in
                             let uu____3956 =
                               non_tail_inline_closure_env cfg1 env3
                                 x.FStar_Syntax_Syntax.sort
                                in
                             {
                               FStar_Syntax_Syntax.ppname =
                                 (uu___506_3955.FStar_Syntax_Syntax.ppname);
                               FStar_Syntax_Syntax.index =
                                 (uu___506_3955.FStar_Syntax_Syntax.index);
                               FStar_Syntax_Syntax.sort = uu____3956
                             }  in
                           let t2 = non_tail_inline_closure_env cfg1 env3 t1
                              in
                           ((let uu___510_3973 = p  in
                             {
                               FStar_Syntax_Syntax.v =
                                 (FStar_Syntax_Syntax.Pat_dot_term (x1, t2));
                               FStar_Syntax_Syntax.p =
                                 (uu___510_3973.FStar_Syntax_Syntax.p)
                             }), env3)
                        in
                     let uu____3978 = norm_pat env2 pat  in
                     (match uu____3978 with
                      | (pat1,env3) ->
                          let w_opt1 =
                            match w_opt with
                            | FStar_Pervasives_Native.None  ->
                                FStar_Pervasives_Native.None
                            | FStar_Pervasives_Native.Some w ->
                                let uu____4047 =
                                  non_tail_inline_closure_env cfg1 env3 w  in
                                FStar_Pervasives_Native.Some uu____4047
                             in
                          let tm1 = non_tail_inline_closure_env cfg1 env3 tm
                             in
                          (pat1, w_opt1, tm1))
                  in
               let t1 =
                 let uu____4066 =
                   let uu____4067 =
                     let uu____4090 =
                       FStar_All.pipe_right branches
                         (FStar_List.map (close_one_branch env1))
                        in
                     (t, uu____4090)  in
                   FStar_Syntax_Syntax.Tm_match uu____4067  in
                 mk uu____4066 t.FStar_Syntax_Syntax.pos  in
               rebuild_closure cfg1 env1 stack1 t1
           | (Meta (env_m,m,r))::stack1 ->
               let m1 =
                 match m with
                 | FStar_Syntax_Syntax.Meta_pattern (names1,args) ->
                     let uu____4226 =
                       let uu____4247 =
                         FStar_All.pipe_right names1
                           (FStar_List.map
                              (non_tail_inline_closure_env cfg env_m))
                          in
                       let uu____4264 =
                         FStar_All.pipe_right args
                           (FStar_List.map
                              (fun args1  ->
                                 FStar_All.pipe_right args1
                                   (FStar_List.map
                                      (fun uu____4373  ->
                                         match uu____4373 with
                                         | (a,q) ->
                                             let uu____4400 =
                                               non_tail_inline_closure_env
                                                 cfg env_m a
                                                in
                                             (uu____4400, q)))))
                          in
                       (uu____4247, uu____4264)  in
                     FStar_Syntax_Syntax.Meta_pattern uu____4226
                 | FStar_Syntax_Syntax.Meta_monadic (m1,tbody) ->
                     let uu____4429 =
                       let uu____4436 =
                         non_tail_inline_closure_env cfg env_m tbody  in
                       (m1, uu____4436)  in
                     FStar_Syntax_Syntax.Meta_monadic uu____4429
                 | FStar_Syntax_Syntax.Meta_monadic_lift (m1,m2,tbody) ->
                     let uu____4448 =
                       let uu____4457 =
                         non_tail_inline_closure_env cfg env_m tbody  in
                       (m1, m2, uu____4457)  in
                     FStar_Syntax_Syntax.Meta_monadic_lift uu____4448
                 | uu____4462 -> m  in
               let t1 = mk (FStar_Syntax_Syntax.Tm_meta (t, m1)) r  in
               rebuild_closure cfg env stack1 t1
           | uu____4468 -> failwith "Impossible: unexpected stack element")

and (close_imp :
  FStar_TypeChecker_Cfg.cfg ->
    env ->
      FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)
  =
  fun cfg  ->
    fun env  ->
      fun imp  ->
        match imp with
        | FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Meta t) ->
            let uu____4484 =
              let uu____4485 = inline_closure_env cfg env [] t  in
              FStar_Syntax_Syntax.Meta uu____4485  in
            FStar_Pervasives_Native.Some uu____4484
        | i -> i

and (close_binders :
  FStar_TypeChecker_Cfg.cfg ->
    env ->
      (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier
        FStar_Pervasives_Native.option) Prims.list ->
        ((FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier
          FStar_Pervasives_Native.option) Prims.list * env))
  =
  fun cfg  ->
    fun env  ->
      fun bs  ->
        let uu____4502 =
          FStar_All.pipe_right bs
            (FStar_List.fold_left
               (fun uu____4586  ->
                  fun uu____4587  ->
                    match (uu____4586, uu____4587) with
                    | ((env1,out),(b,imp)) ->
                        let b1 =
                          let uu___565_4727 = b  in
                          let uu____4728 =
                            inline_closure_env cfg env1 []
                              b.FStar_Syntax_Syntax.sort
                             in
                          {
                            FStar_Syntax_Syntax.ppname =
                              (uu___565_4727.FStar_Syntax_Syntax.ppname);
                            FStar_Syntax_Syntax.index =
                              (uu___565_4727.FStar_Syntax_Syntax.index);
                            FStar_Syntax_Syntax.sort = uu____4728
                          }  in
                        let imp1 = close_imp cfg env1 imp  in
                        let env2 = dummy :: env1  in
                        (env2, ((b1, imp1) :: out))) (env, []))
           in
        match uu____4502 with | (env1,bs1) -> ((FStar_List.rev bs1), env1)

and (close_comp :
  FStar_TypeChecker_Cfg.cfg ->
    env ->
      FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax)
  =
  fun cfg  ->
    fun env  ->
      fun c  ->
        match env with
        | [] when
            FStar_All.pipe_left Prims.op_Negation
              (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.compress_uvars
            -> c
        | uu____4870 ->
            (match c.FStar_Syntax_Syntax.n with
             | FStar_Syntax_Syntax.Total (t,uopt) ->
                 let uu____4883 = inline_closure_env cfg env [] t  in
                 let uu____4884 =
                   FStar_Option.map (norm_universe cfg env) uopt  in
                 FStar_Syntax_Syntax.mk_Total' uu____4883 uu____4884
             | FStar_Syntax_Syntax.GTotal (t,uopt) ->
                 let uu____4897 = inline_closure_env cfg env [] t  in
                 let uu____4898 =
                   FStar_Option.map (norm_universe cfg env) uopt  in
                 FStar_Syntax_Syntax.mk_GTotal' uu____4897 uu____4898
             | FStar_Syntax_Syntax.Comp c1 ->
                 let rt =
                   inline_closure_env cfg env []
                     c1.FStar_Syntax_Syntax.result_typ
                    in
                 let args =
                   FStar_All.pipe_right c1.FStar_Syntax_Syntax.effect_args
                     (FStar_List.map
                        (fun uu____4952  ->
                           match uu____4952 with
                           | (a,q) ->
                               let uu____4973 =
                                 inline_closure_env cfg env [] a  in
                               (uu____4973, q)))
                    in
                 let flags =
                   FStar_All.pipe_right c1.FStar_Syntax_Syntax.flags
                     (FStar_List.map
                        (fun uu___5_4990  ->
                           match uu___5_4990 with
                           | FStar_Syntax_Syntax.DECREASES t ->
                               let uu____4994 =
                                 inline_closure_env cfg env [] t  in
                               FStar_Syntax_Syntax.DECREASES uu____4994
                           | f -> f))
                    in
                 let uu____4998 =
                   let uu___598_4999 = c1  in
                   let uu____5000 =
                     FStar_List.map (norm_universe cfg env)
                       c1.FStar_Syntax_Syntax.comp_univs
                      in
                   {
                     FStar_Syntax_Syntax.comp_univs = uu____5000;
                     FStar_Syntax_Syntax.effect_name =
                       (uu___598_4999.FStar_Syntax_Syntax.effect_name);
                     FStar_Syntax_Syntax.result_typ = rt;
                     FStar_Syntax_Syntax.effect_args = args;
                     FStar_Syntax_Syntax.flags = flags
                   }  in
                 FStar_Syntax_Syntax.mk_Comp uu____4998)

and (filter_out_lcomp_cflags :
  FStar_Syntax_Syntax.cflag Prims.list ->
    FStar_Syntax_Syntax.cflag Prims.list)
  =
  fun flags  ->
    FStar_All.pipe_right flags
      (FStar_List.filter
         (fun uu___6_5010  ->
            match uu___6_5010 with
            | FStar_Syntax_Syntax.DECREASES uu____5012 -> false
            | uu____5016 -> true))

and (close_lcomp_opt :
  FStar_TypeChecker_Cfg.cfg ->
    env ->
      FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option)
  =
  fun cfg  ->
    fun env  ->
      fun lopt  ->
        match lopt with
        | FStar_Pervasives_Native.Some rc ->
            let flags =
              FStar_All.pipe_right rc.FStar_Syntax_Syntax.residual_flags
                (FStar_List.filter
                   (fun uu___7_5035  ->
                      match uu___7_5035 with
                      | FStar_Syntax_Syntax.DECREASES uu____5037 -> false
                      | uu____5041 -> true))
               in
            let rc1 =
              let uu___615_5044 = rc  in
              let uu____5045 =
                FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
                  (inline_closure_env cfg env [])
                 in
              {
                FStar_Syntax_Syntax.residual_effect =
                  (uu___615_5044.FStar_Syntax_Syntax.residual_effect);
                FStar_Syntax_Syntax.residual_typ = uu____5045;
                FStar_Syntax_Syntax.residual_flags = flags
              }  in
            FStar_Pervasives_Native.Some rc1
        | uu____5054 -> lopt

let (closure_as_term :
  FStar_TypeChecker_Cfg.cfg ->
    env -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun cfg  -> fun env  -> fun t  -> non_tail_inline_closure_env cfg env t 
let (unembed_binder_knot :
  FStar_Syntax_Syntax.binder FStar_Syntax_Embeddings.embedding
    FStar_Pervasives_Native.option FStar_ST.ref)
  = FStar_Util.mk_ref FStar_Pervasives_Native.None 
let (unembed_binder :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.binder FStar_Pervasives_Native.option)
  =
  fun t  ->
    let uu____5102 = FStar_ST.op_Bang unembed_binder_knot  in
    match uu____5102 with
    | FStar_Pervasives_Native.Some e ->
        let uu____5141 = FStar_Syntax_Embeddings.unembed e t  in
        uu____5141 true FStar_Syntax_Embeddings.id_norm_cb
    | FStar_Pervasives_Native.None  ->
        (FStar_Errors.log_issue t.FStar_Syntax_Syntax.pos
           (FStar_Errors.Warning_UnembedBinderKnot,
             "unembed_binder_knot is unset!");
         FStar_Pervasives_Native.None)
  
let mk_psc_subst :
  'Auu____5161 .
    FStar_TypeChecker_Cfg.cfg ->
      ((FStar_Syntax_Syntax.bv * 'Auu____5161) FStar_Pervasives_Native.option
        * closure) Prims.list -> FStar_Syntax_Syntax.subst_elt Prims.list
  =
  fun cfg  ->
    fun env  ->
      FStar_List.fold_right
        (fun uu____5223  ->
           fun subst1  ->
             match uu____5223 with
             | (binder_opt,closure) ->
                 (match (binder_opt, closure) with
                  | (FStar_Pervasives_Native.Some b,Clos
                     (env1,term,uu____5264,uu____5265)) ->
                      let uu____5326 = b  in
                      (match uu____5326 with
                       | (bv,uu____5334) ->
                           let uu____5335 =
                             let uu____5337 =
                               FStar_Syntax_Util.is_constructed_typ
                                 bv.FStar_Syntax_Syntax.sort
                                 FStar_Parser_Const.binder_lid
                                in
                             Prims.op_Negation uu____5337  in
                           if uu____5335
                           then subst1
                           else
                             (let term1 = closure_as_term cfg env1 term  in
                              let uu____5345 = unembed_binder term1  in
                              match uu____5345 with
                              | FStar_Pervasives_Native.None  -> subst1
                              | FStar_Pervasives_Native.Some x ->
                                  let b1 =
                                    let uu____5352 =
                                      let uu___650_5353 = bv  in
                                      let uu____5354 =
                                        FStar_Syntax_Subst.subst subst1
                                          (FStar_Pervasives_Native.fst x).FStar_Syntax_Syntax.sort
                                         in
                                      {
                                        FStar_Syntax_Syntax.ppname =
                                          (uu___650_5353.FStar_Syntax_Syntax.ppname);
                                        FStar_Syntax_Syntax.index =
                                          (uu___650_5353.FStar_Syntax_Syntax.index);
                                        FStar_Syntax_Syntax.sort = uu____5354
                                      }  in
                                    FStar_Syntax_Syntax.freshen_bv uu____5352
                                     in
                                  let b_for_x =
                                    let uu____5360 =
                                      let uu____5367 =
                                        FStar_Syntax_Syntax.bv_to_name b1  in
                                      ((FStar_Pervasives_Native.fst x),
                                        uu____5367)
                                       in
                                    FStar_Syntax_Syntax.NT uu____5360  in
                                  let subst2 =
                                    FStar_List.filter
                                      (fun uu___8_5383  ->
                                         match uu___8_5383 with
                                         | FStar_Syntax_Syntax.NT
                                             (uu____5385,{
                                                           FStar_Syntax_Syntax.n
                                                             =
                                                             FStar_Syntax_Syntax.Tm_name
                                                             b';
                                                           FStar_Syntax_Syntax.pos
                                                             = uu____5387;
                                                           FStar_Syntax_Syntax.vars
                                                             = uu____5388;_})
                                             ->
                                             let uu____5393 =
                                               FStar_Ident.ident_equals
                                                 b1.FStar_Syntax_Syntax.ppname
                                                 b'.FStar_Syntax_Syntax.ppname
                                                in
                                             Prims.op_Negation uu____5393
                                         | uu____5395 -> true) subst1
                                     in
                                  b_for_x :: subst2))
                  | uu____5397 -> subst1)) env []
  
let reduce_primops :
  'Auu____5419 .
    FStar_Syntax_Embeddings.norm_cb ->
      FStar_TypeChecker_Cfg.cfg ->
        ((FStar_Syntax_Syntax.bv * 'Auu____5419)
          FStar_Pervasives_Native.option * closure) Prims.list ->
          FStar_Syntax_Syntax.term ->
            FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax
  =
  fun norm_cb  ->
    fun cfg  ->
      fun env  ->
        fun tm  ->
          if
            Prims.op_Negation
              (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.primops
          then tm
          else
            (let uu____5471 = FStar_Syntax_Util.head_and_args tm  in
             match uu____5471 with
             | (head1,args) ->
                 let uu____5516 =
                   let uu____5517 = FStar_Syntax_Util.un_uinst head1  in
                   uu____5517.FStar_Syntax_Syntax.n  in
                 (match uu____5516 with
                  | FStar_Syntax_Syntax.Tm_fvar fv ->
                      let uu____5523 =
                        FStar_TypeChecker_Cfg.find_prim_step cfg fv  in
                      (match uu____5523 with
                       | FStar_Pervasives_Native.Some prim_step when
                           prim_step.FStar_TypeChecker_Cfg.strong_reduction_ok
                             ||
                             (Prims.op_Negation
                                cfg.FStar_TypeChecker_Cfg.strong)
                           ->
                           let l = FStar_List.length args  in
                           if l < prim_step.FStar_TypeChecker_Cfg.arity
                           then
                             (FStar_TypeChecker_Cfg.log_primops cfg
                                (fun uu____5546  ->
                                   let uu____5547 =
                                     FStar_Syntax_Print.lid_to_string
                                       prim_step.FStar_TypeChecker_Cfg.name
                                      in
                                   let uu____5549 =
                                     FStar_Util.string_of_int l  in
                                   let uu____5551 =
                                     FStar_Util.string_of_int
                                       prim_step.FStar_TypeChecker_Cfg.arity
                                      in
                                   FStar_Util.print3
                                     "primop: found partially applied %s (%s/%s args)\n"
                                     uu____5547 uu____5549 uu____5551);
                              tm)
                           else
                             (let uu____5556 =
                                if l = prim_step.FStar_TypeChecker_Cfg.arity
                                then (args, [])
                                else
                                  FStar_List.splitAt
                                    prim_step.FStar_TypeChecker_Cfg.arity
                                    args
                                 in
                              match uu____5556 with
                              | (args_1,args_2) ->
                                  (FStar_TypeChecker_Cfg.log_primops cfg
                                     (fun uu____5642  ->
                                        let uu____5643 =
                                          FStar_Syntax_Print.term_to_string
                                            tm
                                           in
                                        FStar_Util.print1
                                          "primop: trying to reduce <%s>\n"
                                          uu____5643);
                                   (let psc =
                                      {
                                        FStar_TypeChecker_Cfg.psc_range =
                                          (head1.FStar_Syntax_Syntax.pos);
                                        FStar_TypeChecker_Cfg.psc_subst =
                                          (fun uu____5648  ->
                                             if
                                               prim_step.FStar_TypeChecker_Cfg.requires_binder_substitution
                                             then mk_psc_subst cfg env
                                             else [])
                                      }  in
                                    let r =
                                      prim_step.FStar_TypeChecker_Cfg.interpretation
                                        psc norm_cb args_1
                                       in
                                    match r with
                                    | FStar_Pervasives_Native.None  ->
                                        (FStar_TypeChecker_Cfg.log_primops
                                           cfg
                                           (fun uu____5662  ->
                                              let uu____5663 =
                                                FStar_Syntax_Print.term_to_string
                                                  tm
                                                 in
                                              FStar_Util.print1
                                                "primop: <%s> did not reduce\n"
                                                uu____5663);
                                         tm)
                                    | FStar_Pervasives_Native.Some reduced ->
                                        (FStar_TypeChecker_Cfg.log_primops
                                           cfg
                                           (fun uu____5671  ->
                                              let uu____5672 =
                                                FStar_Syntax_Print.term_to_string
                                                  tm
                                                 in
                                              let uu____5674 =
                                                FStar_Syntax_Print.term_to_string
                                                  reduced
                                                 in
                                              FStar_Util.print2
                                                "primop: <%s> reduced to <%s>\n"
                                                uu____5672 uu____5674);
                                         FStar_Syntax_Util.mk_app reduced
                                           args_2))))
                       | FStar_Pervasives_Native.Some uu____5677 ->
                           (FStar_TypeChecker_Cfg.log_primops cfg
                              (fun uu____5681  ->
                                 let uu____5682 =
                                   FStar_Syntax_Print.term_to_string tm  in
                                 FStar_Util.print1
                                   "primop: not reducing <%s> since we're doing strong reduction\n"
                                   uu____5682);
                            tm)
                       | FStar_Pervasives_Native.None  -> tm)
                  | FStar_Syntax_Syntax.Tm_constant
                      (FStar_Const.Const_range_of ) when
                      Prims.op_Negation cfg.FStar_TypeChecker_Cfg.strong ->
                      (FStar_TypeChecker_Cfg.log_primops cfg
                         (fun uu____5688  ->
                            let uu____5689 =
                              FStar_Syntax_Print.term_to_string tm  in
                            FStar_Util.print1 "primop: reducing <%s>\n"
                              uu____5689);
                       (match args with
                        | (a1,uu____5695)::[] ->
                            FStar_TypeChecker_Cfg.embed_simple
                              FStar_Syntax_Embeddings.e_range
                              a1.FStar_Syntax_Syntax.pos
                              tm.FStar_Syntax_Syntax.pos
                        | uu____5720 -> tm))
                  | FStar_Syntax_Syntax.Tm_constant
                      (FStar_Const.Const_set_range_of ) when
                      Prims.op_Negation cfg.FStar_TypeChecker_Cfg.strong ->
                      (FStar_TypeChecker_Cfg.log_primops cfg
                         (fun uu____5734  ->
                            let uu____5735 =
                              FStar_Syntax_Print.term_to_string tm  in
                            FStar_Util.print1 "primop: reducing <%s>\n"
                              uu____5735);
                       (match args with
                        | (t,uu____5741)::(r,uu____5743)::[] ->
                            let uu____5784 =
                              FStar_TypeChecker_Cfg.try_unembed_simple
                                FStar_Syntax_Embeddings.e_range r
                               in
                            (match uu____5784 with
                             | FStar_Pervasives_Native.Some rng ->
                                 FStar_Syntax_Subst.set_use_range rng t
                             | FStar_Pervasives_Native.None  -> tm)
                        | uu____5790 -> tm))
                  | uu____5801 -> tm))
  
let reduce_equality :
  'Auu____5812 .
    FStar_Syntax_Embeddings.norm_cb ->
      FStar_TypeChecker_Cfg.cfg ->
        ((FStar_Syntax_Syntax.bv * 'Auu____5812)
          FStar_Pervasives_Native.option * closure) Prims.list ->
          FStar_Syntax_Syntax.term ->
            FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax
  =
  fun norm_cb  ->
    fun cfg  ->
      fun tm  ->
        reduce_primops norm_cb
          (let uu___738_5861 = cfg  in
           {
             FStar_TypeChecker_Cfg.steps =
               (let uu___740_5864 = FStar_TypeChecker_Cfg.default_steps  in
                {
                  FStar_TypeChecker_Cfg.beta =
                    (uu___740_5864.FStar_TypeChecker_Cfg.beta);
                  FStar_TypeChecker_Cfg.iota =
                    (uu___740_5864.FStar_TypeChecker_Cfg.iota);
                  FStar_TypeChecker_Cfg.zeta =
                    (uu___740_5864.FStar_TypeChecker_Cfg.zeta);
                  FStar_TypeChecker_Cfg.weak =
                    (uu___740_5864.FStar_TypeChecker_Cfg.weak);
                  FStar_TypeChecker_Cfg.hnf =
                    (uu___740_5864.FStar_TypeChecker_Cfg.hnf);
                  FStar_TypeChecker_Cfg.primops = true;
                  FStar_TypeChecker_Cfg.do_not_unfold_pure_lets =
                    (uu___740_5864.FStar_TypeChecker_Cfg.do_not_unfold_pure_lets);
                  FStar_TypeChecker_Cfg.unfold_until =
                    (uu___740_5864.FStar_TypeChecker_Cfg.unfold_until);
                  FStar_TypeChecker_Cfg.unfold_only =
                    (uu___740_5864.FStar_TypeChecker_Cfg.unfold_only);
                  FStar_TypeChecker_Cfg.unfold_fully =
                    (uu___740_5864.FStar_TypeChecker_Cfg.unfold_fully);
                  FStar_TypeChecker_Cfg.unfold_attr =
                    (uu___740_5864.FStar_TypeChecker_Cfg.unfold_attr);
                  FStar_TypeChecker_Cfg.unfold_tac =
                    (uu___740_5864.FStar_TypeChecker_Cfg.unfold_tac);
                  FStar_TypeChecker_Cfg.pure_subterms_within_computations =
                    (uu___740_5864.FStar_TypeChecker_Cfg.pure_subterms_within_computations);
                  FStar_TypeChecker_Cfg.simplify =
                    (uu___740_5864.FStar_TypeChecker_Cfg.simplify);
                  FStar_TypeChecker_Cfg.erase_universes =
                    (uu___740_5864.FStar_TypeChecker_Cfg.erase_universes);
                  FStar_TypeChecker_Cfg.allow_unbound_universes =
                    (uu___740_5864.FStar_TypeChecker_Cfg.allow_unbound_universes);
                  FStar_TypeChecker_Cfg.reify_ =
                    (uu___740_5864.FStar_TypeChecker_Cfg.reify_);
                  FStar_TypeChecker_Cfg.compress_uvars =
                    (uu___740_5864.FStar_TypeChecker_Cfg.compress_uvars);
                  FStar_TypeChecker_Cfg.no_full_norm =
                    (uu___740_5864.FStar_TypeChecker_Cfg.no_full_norm);
                  FStar_TypeChecker_Cfg.check_no_uvars =
                    (uu___740_5864.FStar_TypeChecker_Cfg.check_no_uvars);
                  FStar_TypeChecker_Cfg.unmeta =
                    (uu___740_5864.FStar_TypeChecker_Cfg.unmeta);
                  FStar_TypeChecker_Cfg.unascribe =
                    (uu___740_5864.FStar_TypeChecker_Cfg.unascribe);
                  FStar_TypeChecker_Cfg.in_full_norm_request =
                    (uu___740_5864.FStar_TypeChecker_Cfg.in_full_norm_request);
                  FStar_TypeChecker_Cfg.weakly_reduce_scrutinee =
                    (uu___740_5864.FStar_TypeChecker_Cfg.weakly_reduce_scrutinee);
                  FStar_TypeChecker_Cfg.nbe_step =
                    (uu___740_5864.FStar_TypeChecker_Cfg.nbe_step);
                  FStar_TypeChecker_Cfg.for_extraction =
                    (uu___740_5864.FStar_TypeChecker_Cfg.for_extraction)
                });
             FStar_TypeChecker_Cfg.tcenv =
               (uu___738_5861.FStar_TypeChecker_Cfg.tcenv);
             FStar_TypeChecker_Cfg.debug =
               (uu___738_5861.FStar_TypeChecker_Cfg.debug);
             FStar_TypeChecker_Cfg.delta_level =
               (uu___738_5861.FStar_TypeChecker_Cfg.delta_level);
             FStar_TypeChecker_Cfg.primitive_steps =
               FStar_TypeChecker_Cfg.equality_ops;
             FStar_TypeChecker_Cfg.strong =
               (uu___738_5861.FStar_TypeChecker_Cfg.strong);
             FStar_TypeChecker_Cfg.memoize_lazy =
               (uu___738_5861.FStar_TypeChecker_Cfg.memoize_lazy);
             FStar_TypeChecker_Cfg.normalize_pure_lets =
               (uu___738_5861.FStar_TypeChecker_Cfg.normalize_pure_lets);
             FStar_TypeChecker_Cfg.reifying =
               (uu___738_5861.FStar_TypeChecker_Cfg.reifying)
           }) tm
  
type norm_request_t =
  | Norm_request_none 
  | Norm_request_ready 
  | Norm_request_requires_rejig 
let (uu___is_Norm_request_none : norm_request_t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Norm_request_none  -> true | uu____5875 -> false
  
let (uu___is_Norm_request_ready : norm_request_t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Norm_request_ready  -> true | uu____5886 -> false
  
let (uu___is_Norm_request_requires_rejig : norm_request_t -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | Norm_request_requires_rejig  -> true
    | uu____5897 -> false
  
let (is_norm_request :
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.args -> norm_request_t) =
  fun hd1  ->
    fun args  ->
      let aux min_args =
        let uu____5918 = FStar_All.pipe_right args FStar_List.length  in
        FStar_All.pipe_right uu____5918
          (fun n1  ->
             if n1 < min_args
             then Norm_request_none
             else
               if n1 = min_args
               then Norm_request_ready
               else Norm_request_requires_rejig)
         in
      let uu____5950 =
        let uu____5951 = FStar_Syntax_Util.un_uinst hd1  in
        uu____5951.FStar_Syntax_Syntax.n  in
      match uu____5950 with
      | FStar_Syntax_Syntax.Tm_fvar fv when
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.normalize_term
          -> aux (Prims.parse_int "2")
      | FStar_Syntax_Syntax.Tm_fvar fv when
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.normalize ->
          aux (Prims.parse_int "1")
      | FStar_Syntax_Syntax.Tm_fvar fv when
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.norm ->
          aux (Prims.parse_int "3")
      | uu____5960 -> Norm_request_none
  
let (should_consider_norm_requests : FStar_TypeChecker_Cfg.cfg -> Prims.bool)
  =
  fun cfg  ->
    (Prims.op_Negation
       (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.no_full_norm)
      &&
      (let uu____5969 =
         FStar_Ident.lid_equals
           (cfg.FStar_TypeChecker_Cfg.tcenv).FStar_TypeChecker_Env.curmodule
           FStar_Parser_Const.prims_lid
          in
       Prims.op_Negation uu____5969)
  
let (rejig_norm_request :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.args -> FStar_Syntax_Syntax.term)
  =
  fun hd1  ->
    fun args  ->
      let uu____5982 =
        let uu____5983 = FStar_Syntax_Util.un_uinst hd1  in
        uu____5983.FStar_Syntax_Syntax.n  in
      match uu____5982 with
      | FStar_Syntax_Syntax.Tm_fvar fv when
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.normalize_term
          ->
          (match args with
           | t1::t2::rest when
               (FStar_List.length rest) > (Prims.parse_int "0") ->
               let uu____6041 = FStar_Syntax_Util.mk_app hd1 [t1; t2]  in
               FStar_Syntax_Util.mk_app uu____6041 rest
           | uu____6068 ->
               failwith
                 "Impossible! invalid rejig_norm_request for normalize_term")
      | FStar_Syntax_Syntax.Tm_fvar fv when
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.normalize ->
          (match args with
           | t::rest when (FStar_List.length rest) > (Prims.parse_int "0") ->
               let uu____6108 = FStar_Syntax_Util.mk_app hd1 [t]  in
               FStar_Syntax_Util.mk_app uu____6108 rest
           | uu____6127 ->
               failwith
                 "Impossible! invalid rejig_norm_request for normalize")
      | FStar_Syntax_Syntax.Tm_fvar fv when
          FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.norm ->
          (match args with
           | t1::t2::t3::rest when
               (FStar_List.length rest) > (Prims.parse_int "0") ->
               let uu____6201 = FStar_Syntax_Util.mk_app hd1 [t1; t2; t3]  in
               FStar_Syntax_Util.mk_app uu____6201 rest
           | uu____6236 ->
               failwith "Impossible! invalid rejig_norm_request for norm")
      | uu____6238 ->
          let uu____6239 =
            let uu____6241 = FStar_Syntax_Print.term_to_string hd1  in
            FStar_String.op_Hat
              "Impossible! invalid rejig_norm_request for: %s" uu____6241
             in
          failwith uu____6239
  
let (is_nbe_request : FStar_TypeChecker_Env.step Prims.list -> Prims.bool) =
  fun s  ->
    FStar_Util.for_some
      (FStar_TypeChecker_Env.eq_step FStar_TypeChecker_Env.NBE) s
  
let (tr_norm_step :
  FStar_Syntax_Embeddings.norm_step -> FStar_TypeChecker_Env.step Prims.list)
  =
  fun uu___9_6262  ->
    match uu___9_6262 with
    | FStar_Syntax_Embeddings.Zeta  -> [FStar_TypeChecker_Env.Zeta]
    | FStar_Syntax_Embeddings.Iota  -> [FStar_TypeChecker_Env.Iota]
    | FStar_Syntax_Embeddings.Delta  ->
        [FStar_TypeChecker_Env.UnfoldUntil FStar_Syntax_Syntax.delta_constant]
    | FStar_Syntax_Embeddings.Simpl  -> [FStar_TypeChecker_Env.Simplify]
    | FStar_Syntax_Embeddings.Weak  -> [FStar_TypeChecker_Env.Weak]
    | FStar_Syntax_Embeddings.HNF  -> [FStar_TypeChecker_Env.HNF]
    | FStar_Syntax_Embeddings.Primops  -> [FStar_TypeChecker_Env.Primops]
    | FStar_Syntax_Embeddings.Reify  -> [FStar_TypeChecker_Env.Reify]
    | FStar_Syntax_Embeddings.UnfoldOnly names1 ->
        let uu____6269 =
          let uu____6272 =
            let uu____6273 = FStar_List.map FStar_Ident.lid_of_str names1  in
            FStar_TypeChecker_Env.UnfoldOnly uu____6273  in
          [uu____6272]  in
        (FStar_TypeChecker_Env.UnfoldUntil FStar_Syntax_Syntax.delta_constant)
          :: uu____6269
    | FStar_Syntax_Embeddings.UnfoldFully names1 ->
        let uu____6281 =
          let uu____6284 =
            let uu____6285 = FStar_List.map FStar_Ident.lid_of_str names1  in
            FStar_TypeChecker_Env.UnfoldFully uu____6285  in
          [uu____6284]  in
        (FStar_TypeChecker_Env.UnfoldUntil FStar_Syntax_Syntax.delta_constant)
          :: uu____6281
    | FStar_Syntax_Embeddings.UnfoldAttr names1 ->
        let uu____6293 =
          let uu____6296 =
            let uu____6297 = FStar_List.map FStar_Ident.lid_of_str names1  in
            FStar_TypeChecker_Env.UnfoldAttr uu____6297  in
          [uu____6296]  in
        (FStar_TypeChecker_Env.UnfoldUntil FStar_Syntax_Syntax.delta_constant)
          :: uu____6293
    | FStar_Syntax_Embeddings.NBE  -> [FStar_TypeChecker_Env.NBE]
  
let (tr_norm_steps :
  FStar_Syntax_Embeddings.norm_step Prims.list ->
    FStar_TypeChecker_Env.step Prims.list)
  = fun s  -> FStar_List.concatMap tr_norm_step s 
let get_norm_request :
  'Auu____6322 .
    FStar_TypeChecker_Cfg.cfg ->
      (FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) ->
        (FStar_Syntax_Syntax.term * 'Auu____6322) Prims.list ->
          (FStar_TypeChecker_Env.step Prims.list * FStar_Syntax_Syntax.term)
            FStar_Pervasives_Native.option
  =
  fun cfg  ->
    fun full_norm  ->
      fun args  ->
        let parse_steps s =
          let uu____6373 =
            let uu____6378 =
              FStar_Syntax_Embeddings.e_list
                FStar_Syntax_Embeddings.e_norm_step
               in
            FStar_TypeChecker_Cfg.try_unembed_simple uu____6378 s  in
          match uu____6373 with
          | FStar_Pervasives_Native.Some steps ->
              let uu____6394 = tr_norm_steps steps  in
              FStar_Pervasives_Native.Some uu____6394
          | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None  in
        let inherited_steps =
          FStar_List.append
            (if
               (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.erase_universes
             then [FStar_TypeChecker_Env.EraseUniverses]
             else [])
            (FStar_List.append
               (if
                  (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.allow_unbound_universes
                then [FStar_TypeChecker_Env.AllowUnboundUniverses]
                else [])
               (if
                  (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.nbe_step
                then [FStar_TypeChecker_Env.NBE]
                else []))
           in
        match args with
        | uu____6429::(tm,uu____6431)::[] ->
            let s =
              [FStar_TypeChecker_Env.Beta;
              FStar_TypeChecker_Env.Zeta;
              FStar_TypeChecker_Env.Iota;
              FStar_TypeChecker_Env.Primops;
              FStar_TypeChecker_Env.UnfoldUntil
                FStar_Syntax_Syntax.delta_constant;
              FStar_TypeChecker_Env.Reify]  in
            FStar_Pervasives_Native.Some
              ((FStar_List.append inherited_steps s), tm)
        | (tm,uu____6460)::[] ->
            let s =
              [FStar_TypeChecker_Env.Beta;
              FStar_TypeChecker_Env.Zeta;
              FStar_TypeChecker_Env.Iota;
              FStar_TypeChecker_Env.Primops;
              FStar_TypeChecker_Env.UnfoldUntil
                FStar_Syntax_Syntax.delta_constant;
              FStar_TypeChecker_Env.Reify]  in
            FStar_Pervasives_Native.Some
              ((FStar_List.append inherited_steps s), tm)
        | (steps,uu____6481)::uu____6482::(tm,uu____6484)::[] ->
            let add_exclude s z =
              let uu____6522 =
                FStar_Util.for_some (FStar_TypeChecker_Env.eq_step z) s  in
              if uu____6522
              then s
              else (FStar_TypeChecker_Env.Exclude z) :: s  in
            let uu____6529 =
              let uu____6534 = full_norm steps  in parse_steps uu____6534  in
            (match uu____6529 with
             | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
             | FStar_Pervasives_Native.Some s ->
                 let s1 = FStar_TypeChecker_Env.Beta :: s  in
                 let s2 = add_exclude s1 FStar_TypeChecker_Env.Zeta  in
                 let s3 = add_exclude s2 FStar_TypeChecker_Env.Iota  in
                 FStar_Pervasives_Native.Some
                   ((FStar_List.append inherited_steps s3), tm))
        | uu____6573 -> FStar_Pervasives_Native.None
  
let (nbe_eval :
  FStar_TypeChecker_Cfg.cfg ->
    FStar_TypeChecker_Env.steps ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun s  ->
      fun tm  ->
        let delta_level =
          let uu____6605 =
            FStar_All.pipe_right s
              (FStar_Util.for_some
                 (fun uu___10_6612  ->
                    match uu___10_6612 with
                    | FStar_TypeChecker_Env.UnfoldUntil uu____6614 -> true
                    | FStar_TypeChecker_Env.UnfoldOnly uu____6616 -> true
                    | FStar_TypeChecker_Env.UnfoldFully uu____6620 -> true
                    | uu____6624 -> false))
             in
          if uu____6605
          then
            [FStar_TypeChecker_Env.Unfold FStar_Syntax_Syntax.delta_constant]
          else [FStar_TypeChecker_Env.NoDelta]  in
        FStar_TypeChecker_Cfg.log_nbe cfg
          (fun uu____6634  ->
             let uu____6635 = FStar_Syntax_Print.term_to_string tm  in
             FStar_Util.print1 "Invoking NBE with  %s\n" uu____6635);
        (let tm_norm =
           let uu____6639 =
             let uu____6654 = FStar_TypeChecker_Cfg.cfg_env cfg  in
             uu____6654.FStar_TypeChecker_Env.nbe  in
           uu____6639 s cfg.FStar_TypeChecker_Cfg.tcenv tm  in
         FStar_TypeChecker_Cfg.log_nbe cfg
           (fun uu____6658  ->
              let uu____6659 = FStar_Syntax_Print.term_to_string tm_norm  in
              FStar_Util.print1 "Result of NBE is  %s\n" uu____6659);
         tm_norm)
  
let (is_reify_head : stack_elt Prims.list -> Prims.bool) =
  fun uu___11_6670  ->
    match uu___11_6670 with
    | (App
        (uu____6674,{
                      FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                        (FStar_Const.Const_reify );
                      FStar_Syntax_Syntax.pos = uu____6675;
                      FStar_Syntax_Syntax.vars = uu____6676;_},uu____6677,uu____6678))::uu____6679
        -> true
    | uu____6685 -> false
  
let firstn :
  'Auu____6696 .
    Prims.int ->
      'Auu____6696 Prims.list ->
        ('Auu____6696 Prims.list * 'Auu____6696 Prims.list)
  =
  fun k  ->
    fun l  ->
      if (FStar_List.length l) < k then (l, []) else FStar_Util.first_N k l
  
let (should_reify :
  FStar_TypeChecker_Cfg.cfg -> stack_elt Prims.list -> Prims.bool) =
  fun cfg  ->
    fun stack  ->
      let rec drop_irrel uu___12_6753 =
        match uu___12_6753 with
        | (MemoLazy uu____6758)::s -> drop_irrel s
        | (UnivArgs uu____6768)::s -> drop_irrel s
        | s -> s  in
      let uu____6781 = drop_irrel stack  in
      match uu____6781 with
      | (App
          (uu____6785,{
                        FStar_Syntax_Syntax.n =
                          FStar_Syntax_Syntax.Tm_constant
                          (FStar_Const.Const_reify );
                        FStar_Syntax_Syntax.pos = uu____6786;
                        FStar_Syntax_Syntax.vars = uu____6787;_},uu____6788,uu____6789))::uu____6790
          -> (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.reify_
      | uu____6795 -> false
  
let rec (maybe_weakly_reduced :
  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax -> Prims.bool) =
  fun tm  ->
    let aux_comp c =
      match c.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.GTotal (t,uu____6824) -> maybe_weakly_reduced t
      | FStar_Syntax_Syntax.Total (t,uu____6834) -> maybe_weakly_reduced t
      | FStar_Syntax_Syntax.Comp ct ->
          (maybe_weakly_reduced ct.FStar_Syntax_Syntax.result_typ) ||
            (FStar_Util.for_some
               (fun uu____6855  ->
                  match uu____6855 with
                  | (a,uu____6866) -> maybe_weakly_reduced a)
               ct.FStar_Syntax_Syntax.effect_args)
       in
    let t = FStar_Syntax_Subst.compress tm  in
    match t.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_delayed uu____6877 -> failwith "Impossible"
    | FStar_Syntax_Syntax.Tm_name uu____6902 -> false
    | FStar_Syntax_Syntax.Tm_uvar uu____6904 -> false
    | FStar_Syntax_Syntax.Tm_type uu____6918 -> false
    | FStar_Syntax_Syntax.Tm_bvar uu____6920 -> false
    | FStar_Syntax_Syntax.Tm_fvar uu____6922 -> false
    | FStar_Syntax_Syntax.Tm_constant uu____6924 -> false
    | FStar_Syntax_Syntax.Tm_lazy uu____6926 -> false
    | FStar_Syntax_Syntax.Tm_unknown  -> false
    | FStar_Syntax_Syntax.Tm_uinst uu____6929 -> false
    | FStar_Syntax_Syntax.Tm_quoted uu____6937 -> false
    | FStar_Syntax_Syntax.Tm_let uu____6945 -> true
    | FStar_Syntax_Syntax.Tm_abs uu____6960 -> true
    | FStar_Syntax_Syntax.Tm_arrow uu____6980 -> true
    | FStar_Syntax_Syntax.Tm_refine uu____6996 -> true
    | FStar_Syntax_Syntax.Tm_match uu____7004 -> true
    | FStar_Syntax_Syntax.Tm_app (t1,args) ->
        (maybe_weakly_reduced t1) ||
          (FStar_All.pipe_right args
             (FStar_Util.for_some
                (fun uu____7076  ->
                   match uu____7076 with
                   | (a,uu____7087) -> maybe_weakly_reduced a)))
    | FStar_Syntax_Syntax.Tm_ascribed (t1,asc,uu____7098) ->
        ((maybe_weakly_reduced t1) ||
           (match FStar_Pervasives_Native.fst asc with
            | FStar_Util.Inl t2 -> maybe_weakly_reduced t2
            | FStar_Util.Inr c2 -> aux_comp c2))
          ||
          ((match FStar_Pervasives_Native.snd asc with
            | FStar_Pervasives_Native.None  -> false
            | FStar_Pervasives_Native.Some tac -> maybe_weakly_reduced tac))
    | FStar_Syntax_Syntax.Tm_meta (t1,m) ->
        (maybe_weakly_reduced t1) ||
          ((match m with
            | FStar_Syntax_Syntax.Meta_pattern (uu____7197,args) ->
                FStar_Util.for_some
                  (FStar_Util.for_some
                     (fun uu____7252  ->
                        match uu____7252 with
                        | (a,uu____7263) -> maybe_weakly_reduced a)) args
            | FStar_Syntax_Syntax.Meta_monadic_lift
                (uu____7272,uu____7273,t') -> maybe_weakly_reduced t'
            | FStar_Syntax_Syntax.Meta_monadic (uu____7279,t') ->
                maybe_weakly_reduced t'
            | FStar_Syntax_Syntax.Meta_labeled uu____7285 -> false
            | FStar_Syntax_Syntax.Meta_desugared uu____7295 -> false
            | FStar_Syntax_Syntax.Meta_named uu____7297 -> false))
  
type should_unfold_res =
  | Should_unfold_no 
  | Should_unfold_yes 
  | Should_unfold_fully 
  | Should_unfold_reify 
let (uu___is_Should_unfold_no : should_unfold_res -> Prims.bool) =
  fun projectee  ->
    match projectee with | Should_unfold_no  -> true | uu____7308 -> false
  
let (uu___is_Should_unfold_yes : should_unfold_res -> Prims.bool) =
  fun projectee  ->
    match projectee with | Should_unfold_yes  -> true | uu____7319 -> false
  
let (uu___is_Should_unfold_fully : should_unfold_res -> Prims.bool) =
  fun projectee  ->
    match projectee with | Should_unfold_fully  -> true | uu____7330 -> false
  
let (uu___is_Should_unfold_reify : should_unfold_res -> Prims.bool) =
  fun projectee  ->
    match projectee with | Should_unfold_reify  -> true | uu____7341 -> false
  
let (should_unfold :
  FStar_TypeChecker_Cfg.cfg ->
    (FStar_TypeChecker_Cfg.cfg -> Prims.bool) ->
      FStar_Syntax_Syntax.fv ->
        FStar_TypeChecker_Env.qninfo -> should_unfold_res)
  =
  fun cfg  ->
    fun should_reify1  ->
      fun fv  ->
        fun qninfo  ->
          let attrs =
            let uu____7374 = FStar_TypeChecker_Env.attrs_of_qninfo qninfo  in
            match uu____7374 with
            | FStar_Pervasives_Native.None  -> []
            | FStar_Pervasives_Native.Some ats -> ats  in
          let yes = (true, false, false)  in
          let no = (false, false, false)  in
          let fully = (true, true, false)  in
          let reif = (true, false, true)  in
          let yesno b = if b then yes else no  in
          let fullyno b = if b then fully else no  in
          let comb_or l =
            FStar_List.fold_right
              (fun uu____7573  ->
                 fun uu____7574  ->
                   match (uu____7573, uu____7574) with
                   | ((a,b,c),(x,y,z)) -> ((a || x), (b || y), (c || z))) l
              (false, false, false)
             in
          let string_of_res uu____7680 =
            match uu____7680 with
            | (x,y,z) ->
                let uu____7700 = FStar_Util.string_of_bool x  in
                let uu____7702 = FStar_Util.string_of_bool y  in
                let uu____7704 = FStar_Util.string_of_bool z  in
                FStar_Util.format3 "(%s,%s,%s)" uu____7700 uu____7702
                  uu____7704
             in
          let res =
            if FStar_TypeChecker_Env.qninfo_is_action qninfo
            then
              let b = should_reify1 cfg  in
              (FStar_TypeChecker_Cfg.log_unfolding cfg
                 (fun uu____7732  ->
                    let uu____7733 = FStar_Syntax_Print.fv_to_string fv  in
                    let uu____7735 = FStar_Util.string_of_bool b  in
                    FStar_Util.print2
                      "should_unfold: For DM4F action %s, should_reify = %s\n"
                      uu____7733 uu____7735);
               if b then reif else no)
            else
              if
                (let uu____7750 = FStar_TypeChecker_Cfg.find_prim_step cfg fv
                    in
                 FStar_Option.isSome uu____7750)
              then
                (FStar_TypeChecker_Cfg.log_unfolding cfg
                   (fun uu____7755  ->
                      FStar_Util.print_string
                        " >> It's a primop, not unfolding\n");
                 no)
              else
                (match (qninfo,
                         ((cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_only),
                         ((cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_fully),
                         ((cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_attr))
                 with
                 | (FStar_Pervasives_Native.Some
                    (FStar_Util.Inr
                     ({
                        FStar_Syntax_Syntax.sigel =
                          FStar_Syntax_Syntax.Sig_let
                          ((is_rec,uu____7790),uu____7791);
                        FStar_Syntax_Syntax.sigrng = uu____7792;
                        FStar_Syntax_Syntax.sigquals = qs;
                        FStar_Syntax_Syntax.sigmeta = uu____7794;
                        FStar_Syntax_Syntax.sigattrs = uu____7795;_},uu____7796),uu____7797),uu____7798,uu____7799,uu____7800)
                     when
                     FStar_List.contains FStar_Syntax_Syntax.HasMaskedEffect
                       qs
                     ->
                     (FStar_TypeChecker_Cfg.log_unfolding cfg
                        (fun uu____7907  ->
                           FStar_Util.print_string
                             " >> HasMaskedEffect, not unfolding\n");
                      no)
                 | (uu____7909,uu____7910,uu____7911,uu____7912) when
                     (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_tac
                       &&
                       (FStar_Util.for_some
                          (FStar_Syntax_Util.attr_eq
                             FStar_Syntax_Util.tac_opaque_attr) attrs)
                     ->
                     (FStar_TypeChecker_Cfg.log_unfolding cfg
                        (fun uu____7979  ->
                           FStar_Util.print_string
                             " >> tac_opaque, not unfolding\n");
                      no)
                 | (FStar_Pervasives_Native.Some
                    (FStar_Util.Inr
                     ({
                        FStar_Syntax_Syntax.sigel =
                          FStar_Syntax_Syntax.Sig_let
                          ((is_rec,uu____7982),uu____7983);
                        FStar_Syntax_Syntax.sigrng = uu____7984;
                        FStar_Syntax_Syntax.sigquals = qs;
                        FStar_Syntax_Syntax.sigmeta = uu____7986;
                        FStar_Syntax_Syntax.sigattrs = uu____7987;_},uu____7988),uu____7989),uu____7990,uu____7991,uu____7992)
                     when
                     is_rec &&
                       (Prims.op_Negation
                          (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.zeta)
                     ->
                     (FStar_TypeChecker_Cfg.log_unfolding cfg
                        (fun uu____8099  ->
                           FStar_Util.print_string
                             " >> It's a recursive definition but we're not doing Zeta, not unfolding\n");
                      no)
                 | (uu____8101,FStar_Pervasives_Native.Some
                    uu____8102,uu____8103,uu____8104) ->
                     (FStar_TypeChecker_Cfg.log_unfolding cfg
                        (fun uu____8172  ->
                           let uu____8173 =
                             FStar_Syntax_Print.fv_to_string fv  in
                           FStar_Util.print1
                             "should_unfold: Reached a %s with selective unfolding\n"
                             uu____8173);
                      (let uu____8176 =
                         let uu____8188 =
                           match (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_only
                           with
                           | FStar_Pervasives_Native.None  -> no
                           | FStar_Pervasives_Native.Some lids ->
                               let uu____8214 =
                                 FStar_Util.for_some
                                   (FStar_Syntax_Syntax.fv_eq_lid fv) lids
                                  in
                               FStar_All.pipe_left yesno uu____8214
                            in
                         let uu____8226 =
                           let uu____8238 =
                             match (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_attr
                             with
                             | FStar_Pervasives_Native.None  -> no
                             | FStar_Pervasives_Native.Some lids ->
                                 let uu____8264 =
                                   FStar_Util.for_some
                                     (fun at  ->
                                        FStar_Util.for_some
                                          (fun lid  ->
                                             FStar_Syntax_Util.is_fvar lid at)
                                          lids) attrs
                                    in
                                 FStar_All.pipe_left yesno uu____8264
                              in
                           let uu____8280 =
                             let uu____8292 =
                               match (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_fully
                               with
                               | FStar_Pervasives_Native.None  -> no
                               | FStar_Pervasives_Native.Some lids ->
                                   let uu____8318 =
                                     FStar_Util.for_some
                                       (FStar_Syntax_Syntax.fv_eq_lid fv)
                                       lids
                                      in
                                   FStar_All.pipe_left fullyno uu____8318
                                in
                             [uu____8292]  in
                           uu____8238 :: uu____8280  in
                         uu____8188 :: uu____8226  in
                       comb_or uu____8176))
                 | (uu____8366,uu____8367,FStar_Pervasives_Native.Some
                    uu____8368,uu____8369) ->
                     (FStar_TypeChecker_Cfg.log_unfolding cfg
                        (fun uu____8437  ->
                           let uu____8438 =
                             FStar_Syntax_Print.fv_to_string fv  in
                           FStar_Util.print1
                             "should_unfold: Reached a %s with selective unfolding\n"
                             uu____8438);
                      (let uu____8441 =
                         let uu____8453 =
                           match (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_only
                           with
                           | FStar_Pervasives_Native.None  -> no
                           | FStar_Pervasives_Native.Some lids ->
                               let uu____8479 =
                                 FStar_Util.for_some
                                   (FStar_Syntax_Syntax.fv_eq_lid fv) lids
                                  in
                               FStar_All.pipe_left yesno uu____8479
                            in
                         let uu____8491 =
                           let uu____8503 =
                             match (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_attr
                             with
                             | FStar_Pervasives_Native.None  -> no
                             | FStar_Pervasives_Native.Some lids ->
                                 let uu____8529 =
                                   FStar_Util.for_some
                                     (fun at  ->
                                        FStar_Util.for_some
                                          (fun lid  ->
                                             FStar_Syntax_Util.is_fvar lid at)
                                          lids) attrs
                                    in
                                 FStar_All.pipe_left yesno uu____8529
                              in
                           let uu____8545 =
                             let uu____8557 =
                               match (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_fully
                               with
                               | FStar_Pervasives_Native.None  -> no
                               | FStar_Pervasives_Native.Some lids ->
                                   let uu____8583 =
                                     FStar_Util.for_some
                                       (FStar_Syntax_Syntax.fv_eq_lid fv)
                                       lids
                                      in
                                   FStar_All.pipe_left fullyno uu____8583
                                in
                             [uu____8557]  in
                           uu____8503 :: uu____8545  in
                         uu____8453 :: uu____8491  in
                       comb_or uu____8441))
                 | (uu____8631,uu____8632,uu____8633,FStar_Pervasives_Native.Some
                    uu____8634) ->
                     (FStar_TypeChecker_Cfg.log_unfolding cfg
                        (fun uu____8702  ->
                           let uu____8703 =
                             FStar_Syntax_Print.fv_to_string fv  in
                           FStar_Util.print1
                             "should_unfold: Reached a %s with selective unfolding\n"
                             uu____8703);
                      (let uu____8706 =
                         let uu____8718 =
                           match (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_only
                           with
                           | FStar_Pervasives_Native.None  -> no
                           | FStar_Pervasives_Native.Some lids ->
                               let uu____8744 =
                                 FStar_Util.for_some
                                   (FStar_Syntax_Syntax.fv_eq_lid fv) lids
                                  in
                               FStar_All.pipe_left yesno uu____8744
                            in
                         let uu____8756 =
                           let uu____8768 =
                             match (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_attr
                             with
                             | FStar_Pervasives_Native.None  -> no
                             | FStar_Pervasives_Native.Some lids ->
                                 let uu____8794 =
                                   FStar_Util.for_some
                                     (fun at  ->
                                        FStar_Util.for_some
                                          (fun lid  ->
                                             FStar_Syntax_Util.is_fvar lid at)
                                          lids) attrs
                                    in
                                 FStar_All.pipe_left yesno uu____8794
                              in
                           let uu____8810 =
                             let uu____8822 =
                               match (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unfold_fully
                               with
                               | FStar_Pervasives_Native.None  -> no
                               | FStar_Pervasives_Native.Some lids ->
                                   let uu____8848 =
                                     FStar_Util.for_some
                                       (FStar_Syntax_Syntax.fv_eq_lid fv)
                                       lids
                                      in
                                   FStar_All.pipe_left fullyno uu____8848
                                in
                             [uu____8822]  in
                           uu____8768 :: uu____8810  in
                         uu____8718 :: uu____8756  in
                       comb_or uu____8706))
                 | uu____8896 ->
                     (FStar_TypeChecker_Cfg.log_unfolding cfg
                        (fun uu____8942  ->
                           let uu____8943 =
                             FStar_Syntax_Print.fv_to_string fv  in
                           let uu____8945 =
                             FStar_Syntax_Print.delta_depth_to_string
                               fv.FStar_Syntax_Syntax.fv_delta
                              in
                           let uu____8947 =
                             FStar_Common.string_of_list
                               FStar_TypeChecker_Env.string_of_delta_level
                               cfg.FStar_TypeChecker_Cfg.delta_level
                              in
                           FStar_Util.print3
                             "should_unfold: Reached a %s with delta_depth = %s\n >> Our delta_level is %s\n"
                             uu____8943 uu____8945 uu____8947);
                      (let uu____8950 =
                         FStar_All.pipe_right
                           cfg.FStar_TypeChecker_Cfg.delta_level
                           (FStar_Util.for_some
                              (fun uu___13_8956  ->
                                 match uu___13_8956 with
                                 | FStar_TypeChecker_Env.NoDelta  -> false
                                 | FStar_TypeChecker_Env.InliningDelta  ->
                                     true
                                 | FStar_TypeChecker_Env.Eager_unfolding_only
                                      -> true
                                 | FStar_TypeChecker_Env.Unfold l ->
                                     let uu____8962 =
                                       FStar_TypeChecker_Env.delta_depth_of_fv
                                         cfg.FStar_TypeChecker_Cfg.tcenv fv
                                        in
                                     FStar_TypeChecker_Common.delta_depth_greater_than
                                       uu____8962 l))
                          in
                       FStar_All.pipe_left yesno uu____8950)))
             in
          FStar_TypeChecker_Cfg.log_unfolding cfg
            (fun uu____8978  ->
               let uu____8979 = FStar_Syntax_Print.fv_to_string fv  in
               let uu____8981 =
                 let uu____8983 = FStar_Syntax_Syntax.range_of_fv fv  in
                 FStar_Range.string_of_range uu____8983  in
               let uu____8984 = string_of_res res  in
               FStar_Util.print3
                 "should_unfold: For %s (%s), unfolding res = %s\n"
                 uu____8979 uu____8981 uu____8984);
          (match res with
           | (false ,uu____8987,uu____8988) -> Should_unfold_no
           | (true ,false ,false ) -> Should_unfold_yes
           | (true ,true ,false ) -> Should_unfold_fully
           | (true ,false ,true ) -> Should_unfold_reify
           | uu____9013 ->
               let uu____9023 =
                 let uu____9025 = string_of_res res  in
                 FStar_Util.format1 "Unexpected unfolding result: %s"
                   uu____9025
                  in
               FStar_All.pipe_left failwith uu____9023)
  
let decide_unfolding :
  'Auu____9044 .
    FStar_TypeChecker_Cfg.cfg ->
      env ->
        stack_elt Prims.list ->
          'Auu____9044 ->
            FStar_Syntax_Syntax.fv ->
              FStar_TypeChecker_Env.qninfo ->
                (FStar_TypeChecker_Cfg.cfg * stack_elt Prims.list)
                  FStar_Pervasives_Native.option
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun rng  ->
          fun fv  ->
            fun qninfo  ->
              let res =
                should_unfold cfg (fun cfg1  -> should_reify cfg1 stack) fv
                  qninfo
                 in
              match res with
              | Should_unfold_no  -> FStar_Pervasives_Native.None
              | Should_unfold_yes  ->
                  FStar_Pervasives_Native.Some (cfg, stack)
              | Should_unfold_fully  ->
                  let cfg' =
                    let uu___1159_9113 = cfg  in
                    {
                      FStar_TypeChecker_Cfg.steps =
                        (let uu___1161_9116 = cfg.FStar_TypeChecker_Cfg.steps
                            in
                         {
                           FStar_TypeChecker_Cfg.beta =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.beta);
                           FStar_TypeChecker_Cfg.iota =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.iota);
                           FStar_TypeChecker_Cfg.zeta =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.zeta);
                           FStar_TypeChecker_Cfg.weak =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.weak);
                           FStar_TypeChecker_Cfg.hnf =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.hnf);
                           FStar_TypeChecker_Cfg.primops =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.primops);
                           FStar_TypeChecker_Cfg.do_not_unfold_pure_lets =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.do_not_unfold_pure_lets);
                           FStar_TypeChecker_Cfg.unfold_until =
                             (FStar_Pervasives_Native.Some
                                FStar_Syntax_Syntax.delta_constant);
                           FStar_TypeChecker_Cfg.unfold_only =
                             FStar_Pervasives_Native.None;
                           FStar_TypeChecker_Cfg.unfold_fully =
                             FStar_Pervasives_Native.None;
                           FStar_TypeChecker_Cfg.unfold_attr =
                             FStar_Pervasives_Native.None;
                           FStar_TypeChecker_Cfg.unfold_tac =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.unfold_tac);
                           FStar_TypeChecker_Cfg.pure_subterms_within_computations
                             =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.pure_subterms_within_computations);
                           FStar_TypeChecker_Cfg.simplify =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.simplify);
                           FStar_TypeChecker_Cfg.erase_universes =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.erase_universes);
                           FStar_TypeChecker_Cfg.allow_unbound_universes =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.allow_unbound_universes);
                           FStar_TypeChecker_Cfg.reify_ =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.reify_);
                           FStar_TypeChecker_Cfg.compress_uvars =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.compress_uvars);
                           FStar_TypeChecker_Cfg.no_full_norm =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.no_full_norm);
                           FStar_TypeChecker_Cfg.check_no_uvars =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.check_no_uvars);
                           FStar_TypeChecker_Cfg.unmeta =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.unmeta);
                           FStar_TypeChecker_Cfg.unascribe =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.unascribe);
                           FStar_TypeChecker_Cfg.in_full_norm_request =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.in_full_norm_request);
                           FStar_TypeChecker_Cfg.weakly_reduce_scrutinee =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.weakly_reduce_scrutinee);
                           FStar_TypeChecker_Cfg.nbe_step =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.nbe_step);
                           FStar_TypeChecker_Cfg.for_extraction =
                             (uu___1161_9116.FStar_TypeChecker_Cfg.for_extraction)
                         });
                      FStar_TypeChecker_Cfg.tcenv =
                        (uu___1159_9113.FStar_TypeChecker_Cfg.tcenv);
                      FStar_TypeChecker_Cfg.debug =
                        (uu___1159_9113.FStar_TypeChecker_Cfg.debug);
                      FStar_TypeChecker_Cfg.delta_level =
                        (uu___1159_9113.FStar_TypeChecker_Cfg.delta_level);
                      FStar_TypeChecker_Cfg.primitive_steps =
                        (uu___1159_9113.FStar_TypeChecker_Cfg.primitive_steps);
                      FStar_TypeChecker_Cfg.strong =
                        (uu___1159_9113.FStar_TypeChecker_Cfg.strong);
                      FStar_TypeChecker_Cfg.memoize_lazy =
                        (uu___1159_9113.FStar_TypeChecker_Cfg.memoize_lazy);
                      FStar_TypeChecker_Cfg.normalize_pure_lets =
                        (uu___1159_9113.FStar_TypeChecker_Cfg.normalize_pure_lets);
                      FStar_TypeChecker_Cfg.reifying =
                        (uu___1159_9113.FStar_TypeChecker_Cfg.reifying)
                    }  in
                  let stack' =
                    match stack with
                    | (UnivArgs (us,r))::stack' -> (UnivArgs (us, r)) ::
                        (Cfg cfg) :: stack'
                    | stack' -> (Cfg cfg) :: stack'  in
                  FStar_Pervasives_Native.Some (cfg', stack')
              | Should_unfold_reify  ->
                  let rec push1 e s =
                    match s with
                    | [] -> [e]
                    | (UnivArgs (us,r))::t ->
                        let uu____9178 = push1 e t  in (UnivArgs (us, r)) ::
                          uu____9178
                    | h::t -> e :: h :: t  in
                  let ref =
                    let uu____9190 =
                      let uu____9197 =
                        let uu____9198 =
                          let uu____9199 = FStar_Syntax_Syntax.lid_of_fv fv
                             in
                          FStar_Const.Const_reflect uu____9199  in
                        FStar_Syntax_Syntax.Tm_constant uu____9198  in
                      FStar_Syntax_Syntax.mk uu____9197  in
                    uu____9190 FStar_Pervasives_Native.None
                      FStar_Range.dummyRange
                     in
                  let stack1 =
                    push1
                      (App
                         (env, ref, FStar_Pervasives_Native.None,
                           FStar_Range.dummyRange)) stack
                     in
                  FStar_Pervasives_Native.Some (cfg, stack1)
  
let (is_fext_on_domain :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun t  ->
    let fext_lid s =
      FStar_Ident.lid_of_path ["FStar"; "FunctionalExtensionality"; s]
        FStar_Range.dummyRange
       in
    let on_domain_lids =
      FStar_All.pipe_right ["on_domain"; "on_dom"; "on_domain_g"; "on_dom_g"]
        (FStar_List.map fext_lid)
       in
    let is_on_dom fv =
      FStar_All.pipe_right on_domain_lids
        (FStar_List.existsb (fun l  -> FStar_Syntax_Syntax.fv_eq_lid fv l))
       in
    let uu____9265 =
      let uu____9266 = FStar_Syntax_Subst.compress t  in
      uu____9266.FStar_Syntax_Syntax.n  in
    match uu____9265 with
    | FStar_Syntax_Syntax.Tm_app (hd1,args) ->
        let uu____9297 =
          let uu____9298 = FStar_Syntax_Util.un_uinst hd1  in
          uu____9298.FStar_Syntax_Syntax.n  in
        (match uu____9297 with
         | FStar_Syntax_Syntax.Tm_fvar fv when
             (is_on_dom fv) &&
               ((FStar_List.length args) = (Prims.parse_int "3"))
             ->
             let f =
               let uu____9315 =
                 let uu____9322 =
                   let uu____9333 = FStar_All.pipe_right args FStar_List.tl
                      in
                   FStar_All.pipe_right uu____9333 FStar_List.tl  in
                 FStar_All.pipe_right uu____9322 FStar_List.hd  in
               FStar_All.pipe_right uu____9315 FStar_Pervasives_Native.fst
                in
             FStar_Pervasives_Native.Some f
         | uu____9432 -> FStar_Pervasives_Native.None)
    | uu____9433 -> FStar_Pervasives_Native.None
  
let rec (norm :
  FStar_TypeChecker_Cfg.cfg ->
    env -> stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t  ->
          let t1 =
            if
              (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.norm_delayed
            then
              (match t.FStar_Syntax_Syntax.n with
               | FStar_Syntax_Syntax.Tm_delayed uu____9712 ->
                   let uu____9735 = FStar_Syntax_Print.term_to_string t  in
                   FStar_Util.print1 "NORM delayed: %s\n" uu____9735
               | uu____9738 -> ())
            else ();
            FStar_Syntax_Subst.compress t  in
          FStar_TypeChecker_Cfg.log cfg
            (fun uu____9748  ->
               let uu____9749 = FStar_Syntax_Print.tag_of_term t1  in
               let uu____9751 =
                 FStar_Util.string_of_bool
                   (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.no_full_norm
                  in
               let uu____9753 = FStar_Syntax_Print.term_to_string t1  in
               let uu____9755 =
                 FStar_Util.string_of_int (FStar_List.length env)  in
               let uu____9763 =
                 let uu____9765 =
                   let uu____9768 = firstn (Prims.parse_int "4") stack  in
                   FStar_All.pipe_left FStar_Pervasives_Native.fst uu____9768
                    in
                 stack_to_string uu____9765  in
               FStar_Util.print5
                 ">>> %s (no_full_norm=%s)\nNorm %s  with with %s env elements top of the stack %s \n"
                 uu____9749 uu____9751 uu____9753 uu____9755 uu____9763);
          FStar_TypeChecker_Cfg.log_cfg cfg
            (fun uu____9796  ->
               let uu____9797 = FStar_TypeChecker_Cfg.cfg_to_string cfg  in
               FStar_Util.print1 ">>> cfg = %s\n" uu____9797);
          (match t1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_unknown  ->
               (FStar_TypeChecker_Cfg.log_unfolding cfg
                  (fun uu____9803  ->
                     let uu____9804 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____9804);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_constant uu____9807 ->
               (FStar_TypeChecker_Cfg.log_unfolding cfg
                  (fun uu____9811  ->
                     let uu____9812 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____9812);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_name uu____9815 ->
               (FStar_TypeChecker_Cfg.log_unfolding cfg
                  (fun uu____9819  ->
                     let uu____9820 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____9820);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_lazy uu____9823 ->
               (FStar_TypeChecker_Cfg.log_unfolding cfg
                  (fun uu____9827  ->
                     let uu____9828 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____9828);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_fvar
               { FStar_Syntax_Syntax.fv_name = uu____9831;
                 FStar_Syntax_Syntax.fv_delta = uu____9832;
                 FStar_Syntax_Syntax.fv_qual = FStar_Pervasives_Native.Some
                   (FStar_Syntax_Syntax.Data_ctor );_}
               ->
               (FStar_TypeChecker_Cfg.log_unfolding cfg
                  (fun uu____9836  ->
                     let uu____9837 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____9837);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_fvar
               { FStar_Syntax_Syntax.fv_name = uu____9840;
                 FStar_Syntax_Syntax.fv_delta = uu____9841;
                 FStar_Syntax_Syntax.fv_qual = FStar_Pervasives_Native.Some
                   (FStar_Syntax_Syntax.Record_ctor uu____9842);_}
               ->
               (FStar_TypeChecker_Cfg.log_unfolding cfg
                  (fun uu____9852  ->
                     let uu____9853 = FStar_Syntax_Print.term_to_string t1
                        in
                     FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                       uu____9853);
                rebuild cfg env stack t1)
           | FStar_Syntax_Syntax.Tm_fvar fv ->
               let lid = FStar_Syntax_Syntax.lid_of_fv fv  in
               let qninfo =
                 FStar_TypeChecker_Env.lookup_qname
                   cfg.FStar_TypeChecker_Cfg.tcenv lid
                  in
               let uu____9859 =
                 FStar_TypeChecker_Env.delta_depth_of_qninfo fv qninfo  in
               (match uu____9859 with
                | FStar_Pervasives_Native.Some
                    (FStar_Syntax_Syntax.Delta_constant_at_level _9862) when
                    _9862 = (Prims.parse_int "0") ->
                    (FStar_TypeChecker_Cfg.log_unfolding cfg
                       (fun uu____9866  ->
                          let uu____9867 =
                            FStar_Syntax_Print.term_to_string t1  in
                          FStar_Util.print1 ">>> Tm_fvar case 0 for %s\n"
                            uu____9867);
                     rebuild cfg env stack t1)
                | uu____9870 ->
                    let uu____9873 =
                      decide_unfolding cfg env stack
                        t1.FStar_Syntax_Syntax.pos fv qninfo
                       in
                    (match uu____9873 with
                     | FStar_Pervasives_Native.Some (cfg1,stack1) ->
                         do_unfold_fv cfg1 env stack1 t1 qninfo fv
                     | FStar_Pervasives_Native.None  ->
                         rebuild cfg env stack t1))
           | FStar_Syntax_Syntax.Tm_quoted uu____9900 ->
               let uu____9907 = closure_as_term cfg env t1  in
               rebuild cfg env stack uu____9907
           | FStar_Syntax_Syntax.Tm_app (hd1,args) when
               (should_consider_norm_requests cfg) &&
                 (let uu____9935 = is_norm_request hd1 args  in
                  uu____9935 = Norm_request_requires_rejig)
               ->
               (if
                  (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.print_normalized
                then FStar_Util.print_string "Rejigging norm request ... \n"
                else ();
                (let uu____9941 = rejig_norm_request hd1 args  in
                 norm cfg env stack uu____9941))
           | FStar_Syntax_Syntax.Tm_app (hd1,args) when
               (should_consider_norm_requests cfg) &&
                 (let uu____9969 = is_norm_request hd1 args  in
                  uu____9969 = Norm_request_ready)
               ->
               (if
                  (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.print_normalized
                then FStar_Util.print_string "Potential norm request ... \n"
                else ();
                (let cfg' =
                   let uu___1269_9976 = cfg  in
                   {
                     FStar_TypeChecker_Cfg.steps =
                       (let uu___1271_9979 = cfg.FStar_TypeChecker_Cfg.steps
                           in
                        {
                          FStar_TypeChecker_Cfg.beta =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.beta);
                          FStar_TypeChecker_Cfg.iota =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.iota);
                          FStar_TypeChecker_Cfg.zeta =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.zeta);
                          FStar_TypeChecker_Cfg.weak =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.weak);
                          FStar_TypeChecker_Cfg.hnf =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.hnf);
                          FStar_TypeChecker_Cfg.primops =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.primops);
                          FStar_TypeChecker_Cfg.do_not_unfold_pure_lets =
                            false;
                          FStar_TypeChecker_Cfg.unfold_until =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.unfold_until);
                          FStar_TypeChecker_Cfg.unfold_only =
                            FStar_Pervasives_Native.None;
                          FStar_TypeChecker_Cfg.unfold_fully =
                            FStar_Pervasives_Native.None;
                          FStar_TypeChecker_Cfg.unfold_attr =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.unfold_attr);
                          FStar_TypeChecker_Cfg.unfold_tac =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.unfold_tac);
                          FStar_TypeChecker_Cfg.pure_subterms_within_computations
                            =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.pure_subterms_within_computations);
                          FStar_TypeChecker_Cfg.simplify =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.simplify);
                          FStar_TypeChecker_Cfg.erase_universes =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.erase_universes);
                          FStar_TypeChecker_Cfg.allow_unbound_universes =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.allow_unbound_universes);
                          FStar_TypeChecker_Cfg.reify_ =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.reify_);
                          FStar_TypeChecker_Cfg.compress_uvars =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.compress_uvars);
                          FStar_TypeChecker_Cfg.no_full_norm =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.no_full_norm);
                          FStar_TypeChecker_Cfg.check_no_uvars =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.check_no_uvars);
                          FStar_TypeChecker_Cfg.unmeta =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.unmeta);
                          FStar_TypeChecker_Cfg.unascribe =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.unascribe);
                          FStar_TypeChecker_Cfg.in_full_norm_request =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.in_full_norm_request);
                          FStar_TypeChecker_Cfg.weakly_reduce_scrutinee =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.weakly_reduce_scrutinee);
                          FStar_TypeChecker_Cfg.nbe_step =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.nbe_step);
                          FStar_TypeChecker_Cfg.for_extraction =
                            (uu___1271_9979.FStar_TypeChecker_Cfg.for_extraction)
                        });
                     FStar_TypeChecker_Cfg.tcenv =
                       (uu___1269_9976.FStar_TypeChecker_Cfg.tcenv);
                     FStar_TypeChecker_Cfg.debug =
                       (uu___1269_9976.FStar_TypeChecker_Cfg.debug);
                     FStar_TypeChecker_Cfg.delta_level =
                       [FStar_TypeChecker_Env.Unfold
                          FStar_Syntax_Syntax.delta_constant];
                     FStar_TypeChecker_Cfg.primitive_steps =
                       (uu___1269_9976.FStar_TypeChecker_Cfg.primitive_steps);
                     FStar_TypeChecker_Cfg.strong =
                       (uu___1269_9976.FStar_TypeChecker_Cfg.strong);
                     FStar_TypeChecker_Cfg.memoize_lazy =
                       (uu___1269_9976.FStar_TypeChecker_Cfg.memoize_lazy);
                     FStar_TypeChecker_Cfg.normalize_pure_lets = true;
                     FStar_TypeChecker_Cfg.reifying =
                       (uu___1269_9976.FStar_TypeChecker_Cfg.reifying)
                   }  in
                 let uu____9986 =
                   get_norm_request cfg (norm cfg' env []) args  in
                 match uu____9986 with
                 | FStar_Pervasives_Native.None  ->
                     (if
                        (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.print_normalized
                      then FStar_Util.print_string "Norm request None ... \n"
                      else ();
                      (let stack1 =
                         FStar_All.pipe_right stack
                           (FStar_List.fold_right
                              (fun uu____10022  ->
                                 fun stack1  ->
                                   match uu____10022 with
                                   | (a,aq) ->
                                       let uu____10034 =
                                         let uu____10035 =
                                           let uu____10042 =
                                             let uu____10043 =
                                               let uu____10075 =
                                                 FStar_Util.mk_ref
                                                   FStar_Pervasives_Native.None
                                                  in
                                               (env, a, uu____10075, false)
                                                in
                                             Clos uu____10043  in
                                           (uu____10042, aq,
                                             (t1.FStar_Syntax_Syntax.pos))
                                            in
                                         Arg uu____10035  in
                                       uu____10034 :: stack1) args)
                          in
                       FStar_TypeChecker_Cfg.log cfg
                         (fun uu____10143  ->
                            let uu____10144 =
                              FStar_All.pipe_left FStar_Util.string_of_int
                                (FStar_List.length args)
                               in
                            FStar_Util.print1 "\tPushed %s arguments\n"
                              uu____10144);
                       norm cfg env stack1 hd1))
                 | FStar_Pervasives_Native.Some (s,tm) when is_nbe_request s
                     ->
                     (if
                        (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.print_normalized
                      then
                        (let uu____10171 =
                           FStar_Syntax_Print.term_to_string tm  in
                         FStar_Util.print1
                           "Starting NBE request on %s ... \n" uu____10171)
                      else ();
                      (let tm' = closure_as_term cfg env tm  in
                       let start = FStar_Util.now ()  in
                       let tm_norm = nbe_eval cfg s tm'  in
                       let fin = FStar_Util.now ()  in
                       if
                         (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.print_normalized
                       then
                         (let uu____10182 =
                            let uu____10184 =
                              let uu____10186 =
                                FStar_Util.time_diff start fin  in
                              FStar_Pervasives_Native.snd uu____10186  in
                            FStar_Util.string_of_int uu____10184  in
                          let uu____10193 =
                            FStar_Syntax_Print.term_to_string tm'  in
                          let uu____10195 =
                            FStar_Syntax_Print.term_to_string tm_norm  in
                          FStar_Util.print3 "NBE'd (%s ms) %s\n\tto %s\n"
                            uu____10182 uu____10193 uu____10195)
                       else ();
                       norm cfg env stack tm_norm))
                 | FStar_Pervasives_Native.Some (s,tm) ->
                     (if
                        (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.print_normalized
                      then
                        (let uu____10214 =
                           FStar_Syntax_Print.term_to_string tm  in
                         FStar_Util.print1
                           "Starting norm request on %s ... \n" uu____10214)
                      else ();
                      (let delta_level =
                         let uu____10222 =
                           FStar_All.pipe_right s
                             (FStar_Util.for_some
                                (fun uu___14_10229  ->
                                   match uu___14_10229 with
                                   | FStar_TypeChecker_Env.UnfoldUntil
                                       uu____10231 -> true
                                   | FStar_TypeChecker_Env.UnfoldOnly
                                       uu____10233 -> true
                                   | FStar_TypeChecker_Env.UnfoldFully
                                       uu____10237 -> true
                                   | uu____10241 -> false))
                            in
                         if uu____10222
                         then
                           [FStar_TypeChecker_Env.Unfold
                              FStar_Syntax_Syntax.delta_constant]
                         else [FStar_TypeChecker_Env.NoDelta]  in
                       let cfg'1 =
                         let uu___1312_10249 = cfg  in
                         let uu____10250 =
                           let uu___1314_10251 =
                             FStar_TypeChecker_Cfg.to_fsteps s  in
                           {
                             FStar_TypeChecker_Cfg.beta =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.beta);
                             FStar_TypeChecker_Cfg.iota =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.iota);
                             FStar_TypeChecker_Cfg.zeta =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.zeta);
                             FStar_TypeChecker_Cfg.weak =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.weak);
                             FStar_TypeChecker_Cfg.hnf =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.hnf);
                             FStar_TypeChecker_Cfg.primops =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.primops);
                             FStar_TypeChecker_Cfg.do_not_unfold_pure_lets =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.do_not_unfold_pure_lets);
                             FStar_TypeChecker_Cfg.unfold_until =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.unfold_until);
                             FStar_TypeChecker_Cfg.unfold_only =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.unfold_only);
                             FStar_TypeChecker_Cfg.unfold_fully =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.unfold_fully);
                             FStar_TypeChecker_Cfg.unfold_attr =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.unfold_attr);
                             FStar_TypeChecker_Cfg.unfold_tac =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.unfold_tac);
                             FStar_TypeChecker_Cfg.pure_subterms_within_computations
                               =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.pure_subterms_within_computations);
                             FStar_TypeChecker_Cfg.simplify =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.simplify);
                             FStar_TypeChecker_Cfg.erase_universes =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.erase_universes);
                             FStar_TypeChecker_Cfg.allow_unbound_universes =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.allow_unbound_universes);
                             FStar_TypeChecker_Cfg.reify_ =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.reify_);
                             FStar_TypeChecker_Cfg.compress_uvars =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.compress_uvars);
                             FStar_TypeChecker_Cfg.no_full_norm =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.no_full_norm);
                             FStar_TypeChecker_Cfg.check_no_uvars =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.check_no_uvars);
                             FStar_TypeChecker_Cfg.unmeta =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.unmeta);
                             FStar_TypeChecker_Cfg.unascribe =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.unascribe);
                             FStar_TypeChecker_Cfg.in_full_norm_request =
                               true;
                             FStar_TypeChecker_Cfg.weakly_reduce_scrutinee =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.weakly_reduce_scrutinee);
                             FStar_TypeChecker_Cfg.nbe_step =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.nbe_step);
                             FStar_TypeChecker_Cfg.for_extraction =
                               (uu___1314_10251.FStar_TypeChecker_Cfg.for_extraction)
                           }  in
                         {
                           FStar_TypeChecker_Cfg.steps = uu____10250;
                           FStar_TypeChecker_Cfg.tcenv =
                             (uu___1312_10249.FStar_TypeChecker_Cfg.tcenv);
                           FStar_TypeChecker_Cfg.debug =
                             (uu___1312_10249.FStar_TypeChecker_Cfg.debug);
                           FStar_TypeChecker_Cfg.delta_level = delta_level;
                           FStar_TypeChecker_Cfg.primitive_steps =
                             (uu___1312_10249.FStar_TypeChecker_Cfg.primitive_steps);
                           FStar_TypeChecker_Cfg.strong =
                             (uu___1312_10249.FStar_TypeChecker_Cfg.strong);
                           FStar_TypeChecker_Cfg.memoize_lazy =
                             (uu___1312_10249.FStar_TypeChecker_Cfg.memoize_lazy);
                           FStar_TypeChecker_Cfg.normalize_pure_lets = true;
                           FStar_TypeChecker_Cfg.reifying =
                             (uu___1312_10249.FStar_TypeChecker_Cfg.reifying)
                         }  in
                       let stack' =
                         let tail1 = (Cfg cfg) :: stack  in
                         if
                           (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.print_normalized
                         then
                           let uu____10259 =
                             let uu____10260 =
                               let uu____10265 = FStar_Util.now ()  in
                               (t1, uu____10265)  in
                             Debug uu____10260  in
                           uu____10259 :: tail1
                         else tail1  in
                       norm cfg'1 env stack' tm))))
           | FStar_Syntax_Syntax.Tm_type u ->
               let u1 = norm_universe cfg env u  in
               let uu____10270 =
                 mk (FStar_Syntax_Syntax.Tm_type u1)
                   t1.FStar_Syntax_Syntax.pos
                  in
               rebuild cfg env stack uu____10270
           | FStar_Syntax_Syntax.Tm_uinst (t',us) ->
               let t'1 =
                 FStar_Syntax_Subst.set_use_range t1.FStar_Syntax_Syntax.pos
                   t'
                  in
               if
                 (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.erase_universes
               then norm cfg env stack t'1
               else
                 (let us1 =
<<<<<<< HEAD
                    let uu____10185 =
                      let uu____10192 =
                        FStar_List.map (norm_universe cfg env) us  in
                      (uu____10192, (t1.FStar_Syntax_Syntax.pos))  in
                    UnivArgs uu____10185  in
                  let stack1 = us1 :: stack  in norm cfg env stack1 t'1)
           | FStar_Syntax_Syntax.Tm_bvar x ->
               let uu____10201 = lookup_bvar env x  in
               (match uu____10201 with
                | Univ uu____10202 ->
=======
                    let uu____10281 =
                      let uu____10288 =
                        FStar_List.map (norm_universe cfg env) us  in
                      (uu____10288, (t1.FStar_Syntax_Syntax.pos))  in
                    UnivArgs uu____10281  in
                  let stack1 = us1 :: stack  in norm cfg env stack1 t')
           | FStar_Syntax_Syntax.Tm_bvar x ->
               let uu____10297 = lookup_bvar env x  in
               (match uu____10297 with
                | Univ uu____10298 ->
>>>>>>> master
                    failwith
                      "Impossible: term variable is bound to a universe"
                | Dummy  -> failwith "Term variable not found"
                | Clos (env1,t0,r,fix) ->
                    if
                      (Prims.op_Negation fix) ||
                        (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.zeta
                    then
<<<<<<< HEAD
                      let uu____10256 = FStar_ST.op_Bang r  in
                      (match uu____10256 with
                       | FStar_Pervasives_Native.Some (env2,t') ->
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____10352  ->
                                 let uu____10353 =
                                   FStar_Syntax_Print.term_to_string t1  in
                                 let uu____10355 =
                                   FStar_Syntax_Print.term_to_string t'  in
                                 FStar_Util.print2
                                   "Lazy hit: %s cached to %s\n" uu____10353
                                   uu____10355);
                            (let uu____10358 = maybe_weakly_reduced t'  in
                             if uu____10358
=======
                      let uu____10352 = FStar_ST.op_Bang r  in
                      (match uu____10352 with
                       | FStar_Pervasives_Native.Some (env2,t') ->
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____10448  ->
                                 let uu____10449 =
                                   FStar_Syntax_Print.term_to_string t1  in
                                 let uu____10451 =
                                   FStar_Syntax_Print.term_to_string t'  in
                                 FStar_Util.print2
                                   "Lazy hit: %s cached to %s\n" uu____10449
                                   uu____10451);
                            (let uu____10454 = maybe_weakly_reduced t'  in
                             if uu____10454
>>>>>>> master
                             then
                               match stack with
                               | [] when
                                   (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak
                                     ||
                                     (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.compress_uvars
                                   -> rebuild cfg env2 stack t'
<<<<<<< HEAD
                               | uu____10361 -> norm cfg env2 stack t'
=======
                               | uu____10457 -> norm cfg env2 stack t'
>>>>>>> master
                             else rebuild cfg env2 stack t'))
                       | FStar_Pervasives_Native.None  ->
                           norm cfg env1 ((MemoLazy r) :: stack) t0)
                    else norm cfg env1 stack t0)
           | FStar_Syntax_Syntax.Tm_abs (bs,body,lopt) ->
               (match stack with
<<<<<<< HEAD
                | (UnivArgs uu____10405)::uu____10406 ->
                    failwith
                      "Ill-typed term: universes cannot be applied to term abstraction"
                | (Arg (c,uu____10417,uu____10418))::stack_rest ->
                    (match c with
                     | Univ uu____10422 ->
                         norm cfg ((FStar_Pervasives_Native.None, c) :: env)
                           stack_rest t1
                     | uu____10431 ->
=======
                | (UnivArgs uu____10501)::uu____10502 ->
                    failwith
                      "Ill-typed term: universes cannot be applied to term abstraction"
                | (Arg (c,uu____10513,uu____10514))::stack_rest ->
                    (match c with
                     | Univ uu____10518 ->
                         norm cfg ((FStar_Pervasives_Native.None, c) :: env)
                           stack_rest t1
                     | uu____10527 ->
>>>>>>> master
                         (match bs with
                          | [] -> failwith "Impossible"
                          | b::[] ->
                              (FStar_TypeChecker_Cfg.log cfg
<<<<<<< HEAD
                                 (fun uu____10461  ->
                                    let uu____10462 = closure_to_string c  in
                                    FStar_Util.print1 "\tShifted %s\n"
                                      uu____10462);
=======
                                 (fun uu____10557  ->
                                    let uu____10558 = closure_to_string c  in
                                    FStar_Util.print1 "\tShifted %s\n"
                                      uu____10558);
>>>>>>> master
                               norm cfg
                                 (((FStar_Pervasives_Native.Some b), c) ::
                                 env) stack_rest body)
                          | b::tl1 ->
                              (FStar_TypeChecker_Cfg.log cfg
<<<<<<< HEAD
                                 (fun uu____10498  ->
                                    let uu____10499 = closure_to_string c  in
                                    FStar_Util.print1 "\tShifted %s\n"
                                      uu____10499);
=======
                                 (fun uu____10594  ->
                                    let uu____10595 = closure_to_string c  in
                                    FStar_Util.print1 "\tShifted %s\n"
                                      uu____10595);
>>>>>>> master
                               (let body1 =
                                  mk
                                    (FStar_Syntax_Syntax.Tm_abs
                                       (tl1, body, lopt))
                                    t1.FStar_Syntax_Syntax.pos
                                   in
                                norm cfg
                                  (((FStar_Pervasives_Native.Some b), c) ::
                                  env) stack_rest body1))))
                | (Cfg cfg1)::stack1 -> norm cfg1 env stack1 t1
                | (MemoLazy r)::stack1 ->
                    (set_memo cfg r (env, t1);
                     FStar_TypeChecker_Cfg.log cfg
<<<<<<< HEAD
                       (fun uu____10547  ->
                          let uu____10548 =
                            FStar_Syntax_Print.term_to_string t1  in
                          FStar_Util.print1 "\tSet memo %s\n" uu____10548);
                     norm cfg env stack1 t1)
                | (Match uu____10551)::uu____10552 ->
=======
                       (fun uu____10643  ->
                          let uu____10644 =
                            FStar_Syntax_Print.term_to_string t1  in
                          FStar_Util.print1 "\tSet memo %s\n" uu____10644);
                     norm cfg env stack1 t1)
                | (Match uu____10647)::uu____10648 ->
>>>>>>> master
                    if
                      (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak
                    then
                      let t2 = closure_as_term cfg env t1  in
                      rebuild cfg env stack t2
                    else
<<<<<<< HEAD
                      (let uu____10567 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____10567 with
=======
                      (let uu____10663 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____10663 with
>>>>>>> master
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
<<<<<<< HEAD
                                     fun uu____10603  -> dummy :: env1) env)
=======
                                     fun uu____10699  -> dummy :: env1) env)
>>>>>>> master
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if
                                     (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
<<<<<<< HEAD
                                          let uu____10647 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____10647)
=======
                                          let uu____10743 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____10743)
>>>>>>> master
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
<<<<<<< HEAD
                                   (let uu___1429_10655 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1429_10655.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1429_10655.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____10656 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____10662  ->
                                 let uu____10663 =
=======
                                   (let uu___1432_10751 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1432_10751.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1432_10751.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____10752 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____10758  ->
                                 let uu____10759 =
>>>>>>> master
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
<<<<<<< HEAD
                                   uu____10663);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1436_10678 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1436_10678.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1436_10678.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1436_10678.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1436_10678.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1436_10678.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1436_10678.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1436_10678.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1436_10678.FStar_TypeChecker_Cfg.reifying)
=======
                                   uu____10759);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1439_10774 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1439_10774.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1439_10774.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1439_10774.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1439_10774.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1439_10774.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1439_10774.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1439_10774.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1439_10774.FStar_TypeChecker_Cfg.reifying)
>>>>>>> master
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
<<<<<<< HEAD
                | (Debug uu____10682)::uu____10683 ->
=======
                | (Debug uu____10778)::uu____10779 ->
>>>>>>> master
                    if
                      (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak
                    then
                      let t2 = closure_as_term cfg env t1  in
                      rebuild cfg env stack t2
                    else
<<<<<<< HEAD
                      (let uu____10694 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____10694 with
=======
                      (let uu____10790 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____10790 with
>>>>>>> master
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
<<<<<<< HEAD
                                     fun uu____10730  -> dummy :: env1) env)
=======
                                     fun uu____10826  -> dummy :: env1) env)
>>>>>>> master
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if
                                     (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
<<<<<<< HEAD
                                          let uu____10774 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____10774)
=======
                                          let uu____10870 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____10870)
>>>>>>> master
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
<<<<<<< HEAD
                                   (let uu___1429_10782 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1429_10782.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1429_10782.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____10783 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____10789  ->
                                 let uu____10790 =
=======
                                   (let uu___1432_10878 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1432_10878.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1432_10878.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____10879 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____10885  ->
                                 let uu____10886 =
>>>>>>> master
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
<<<<<<< HEAD
                                   uu____10790);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1436_10805 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1436_10805.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1436_10805.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1436_10805.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1436_10805.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1436_10805.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1436_10805.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1436_10805.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1436_10805.FStar_TypeChecker_Cfg.reifying)
=======
                                   uu____10886);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1439_10901 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1439_10901.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1439_10901.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1439_10901.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1439_10901.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1439_10901.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1439_10901.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1439_10901.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1439_10901.FStar_TypeChecker_Cfg.reifying)
>>>>>>> master
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
<<<<<<< HEAD
                | (Meta uu____10809)::uu____10810 ->
=======
                | (Meta uu____10905)::uu____10906 ->
>>>>>>> master
                    if
                      (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak
                    then
                      let t2 = closure_as_term cfg env t1  in
                      rebuild cfg env stack t2
                    else
<<<<<<< HEAD
                      (let uu____10823 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____10823 with
=======
                      (let uu____10919 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____10919 with
>>>>>>> master
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
<<<<<<< HEAD
                                     fun uu____10859  -> dummy :: env1) env)
=======
                                     fun uu____10955  -> dummy :: env1) env)
>>>>>>> master
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if
                                     (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
<<<<<<< HEAD
                                          let uu____10903 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____10903)
=======
                                          let uu____10999 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____10999)
>>>>>>> master
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
<<<<<<< HEAD
                                   (let uu___1429_10911 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1429_10911.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1429_10911.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____10912 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____10918  ->
                                 let uu____10919 =
=======
                                   (let uu___1432_11007 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1432_11007.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1432_11007.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____11008 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____11014  ->
                                 let uu____11015 =
>>>>>>> master
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
<<<<<<< HEAD
                                   uu____10919);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1436_10934 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1436_10934.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1436_10934.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1436_10934.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1436_10934.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1436_10934.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1436_10934.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1436_10934.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1436_10934.FStar_TypeChecker_Cfg.reifying)
=======
                                   uu____11015);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1439_11030 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1439_11030.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1439_11030.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1439_11030.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1439_11030.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1439_11030.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1439_11030.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1439_11030.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1439_11030.FStar_TypeChecker_Cfg.reifying)
>>>>>>> master
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
<<<<<<< HEAD
                | (Let uu____10938)::uu____10939 ->
=======
                | (Let uu____11034)::uu____11035 ->
>>>>>>> master
                    if
                      (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak
                    then
                      let t2 = closure_as_term cfg env t1  in
                      rebuild cfg env stack t2
                    else
<<<<<<< HEAD
                      (let uu____10954 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____10954 with
=======
                      (let uu____11050 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____11050 with
>>>>>>> master
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
<<<<<<< HEAD
                                     fun uu____10990  -> dummy :: env1) env)
=======
                                     fun uu____11086  -> dummy :: env1) env)
>>>>>>> master
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if
                                     (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
<<<<<<< HEAD
                                          let uu____11034 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____11034)
=======
                                          let uu____11130 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____11130)
>>>>>>> master
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
<<<<<<< HEAD
                                   (let uu___1429_11042 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1429_11042.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1429_11042.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____11043 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____11049  ->
                                 let uu____11050 =
=======
                                   (let uu___1432_11138 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1432_11138.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1432_11138.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____11139 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____11145  ->
                                 let uu____11146 =
>>>>>>> master
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
<<<<<<< HEAD
                                   uu____11050);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1436_11065 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1436_11065.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1436_11065.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1436_11065.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1436_11065.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1436_11065.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1436_11065.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1436_11065.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1436_11065.FStar_TypeChecker_Cfg.reifying)
=======
                                   uu____11146);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1439_11161 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1439_11161.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1439_11161.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1439_11161.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1439_11161.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1439_11161.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1439_11161.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1439_11161.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1439_11161.FStar_TypeChecker_Cfg.reifying)
>>>>>>> master
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
<<<<<<< HEAD
                | (App uu____11069)::uu____11070 ->
=======
                | (App uu____11165)::uu____11166 ->
>>>>>>> master
                    if
                      (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak
                    then
                      let t2 = closure_as_term cfg env t1  in
                      rebuild cfg env stack t2
                    else
<<<<<<< HEAD
                      (let uu____11085 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____11085 with
=======
                      (let uu____11181 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____11181 with
>>>>>>> master
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
<<<<<<< HEAD
                                     fun uu____11121  -> dummy :: env1) env)
=======
                                     fun uu____11217  -> dummy :: env1) env)
>>>>>>> master
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if
                                     (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
<<<<<<< HEAD
                                          let uu____11165 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____11165)
=======
                                          let uu____11261 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____11261)
>>>>>>> master
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
<<<<<<< HEAD
                                   (let uu___1429_11173 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1429_11173.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1429_11173.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____11174 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____11180  ->
                                 let uu____11181 =
=======
                                   (let uu___1432_11269 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1432_11269.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1432_11269.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____11270 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____11276  ->
                                 let uu____11277 =
>>>>>>> master
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
<<<<<<< HEAD
                                   uu____11181);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1436_11196 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1436_11196.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1436_11196.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1436_11196.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1436_11196.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1436_11196.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1436_11196.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1436_11196.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1436_11196.FStar_TypeChecker_Cfg.reifying)
=======
                                   uu____11277);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1439_11292 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1439_11292.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1439_11292.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1439_11292.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1439_11292.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1439_11292.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1439_11292.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1439_11292.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1439_11292.FStar_TypeChecker_Cfg.reifying)
>>>>>>> master
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
<<<<<<< HEAD
                | (Abs uu____11200)::uu____11201 ->
=======
                | (Abs uu____11296)::uu____11297 ->
>>>>>>> master
                    if
                      (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak
                    then
                      let t2 = closure_as_term cfg env t1  in
                      rebuild cfg env stack t2
                    else
<<<<<<< HEAD
                      (let uu____11220 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____11220 with
=======
                      (let uu____11316 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____11316 with
>>>>>>> master
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
<<<<<<< HEAD
                                     fun uu____11256  -> dummy :: env1) env)
=======
                                     fun uu____11352  -> dummy :: env1) env)
>>>>>>> master
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if
                                     (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
<<<<<<< HEAD
                                          let uu____11300 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____11300)
=======
                                          let uu____11396 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____11396)
>>>>>>> master
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
<<<<<<< HEAD
                                   (let uu___1429_11308 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1429_11308.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1429_11308.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____11309 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____11315  ->
                                 let uu____11316 =
=======
                                   (let uu___1432_11404 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1432_11404.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1432_11404.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____11405 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____11411  ->
                                 let uu____11412 =
>>>>>>> master
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
<<<<<<< HEAD
                                   uu____11316);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1436_11331 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1436_11331.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1436_11331.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1436_11331.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1436_11331.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1436_11331.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1436_11331.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1436_11331.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1436_11331.FStar_TypeChecker_Cfg.reifying)
=======
                                   uu____11412);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1439_11427 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1439_11427.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1439_11427.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1439_11427.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1439_11427.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1439_11427.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1439_11427.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1439_11427.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1439_11427.FStar_TypeChecker_Cfg.reifying)
>>>>>>> master
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1)))
                | [] ->
                    if
                      (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak
                    then
                      let t2 = closure_as_term cfg env t1  in
                      rebuild cfg env stack t2
                    else
<<<<<<< HEAD
                      (let uu____11339 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____11339 with
=======
                      (let uu____11435 =
                         FStar_Syntax_Subst.open_term' bs body  in
                       match uu____11435 with
>>>>>>> master
                       | (bs1,body1,opening) ->
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
<<<<<<< HEAD
                                     fun uu____11375  -> dummy :: env1) env)
=======
                                     fun uu____11471  -> dummy :: env1) env)
>>>>>>> master
                              in
                           let lopt1 =
                             match lopt with
                             | FStar_Pervasives_Native.Some rc ->
                                 let rct =
                                   if
                                     (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.check_no_uvars
                                   then
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (fun t2  ->
<<<<<<< HEAD
                                          let uu____11419 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____11419)
=======
                                          let uu____11515 =
                                            FStar_Syntax_Subst.subst opening
                                              t2
                                             in
                                          norm cfg env' [] uu____11515)
>>>>>>> master
                                   else
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening)
                                    in
                                 FStar_Pervasives_Native.Some
<<<<<<< HEAD
                                   (let uu___1429_11427 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1429_11427.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1429_11427.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____11428 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____11434  ->
                                 let uu____11435 =
=======
                                   (let uu___1432_11523 = rc  in
                                    {
                                      FStar_Syntax_Syntax.residual_effect =
                                        (uu___1432_11523.FStar_Syntax_Syntax.residual_effect);
                                      FStar_Syntax_Syntax.residual_typ = rct;
                                      FStar_Syntax_Syntax.residual_flags =
                                        (uu___1432_11523.FStar_Syntax_Syntax.residual_flags)
                                    })
                             | uu____11524 -> lopt  in
                           (FStar_TypeChecker_Cfg.log cfg
                              (fun uu____11530  ->
                                 let uu____11531 =
>>>>>>> master
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1)
                                    in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
<<<<<<< HEAD
                                   uu____11435);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1436_11450 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1436_11450.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1436_11450.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1436_11450.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1436_11450.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1436_11450.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1436_11450.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1436_11450.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1436_11450.FStar_TypeChecker_Cfg.reifying)
=======
                                   uu____11531);
                            (let stack1 = (Cfg cfg) :: stack  in
                             let cfg1 =
                               let uu___1439_11546 = cfg  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
                                   (uu___1439_11546.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv =
                                   (uu___1439_11546.FStar_TypeChecker_Cfg.tcenv);
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1439_11546.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1439_11546.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1439_11546.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong = true;
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1439_11546.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1439_11546.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1439_11546.FStar_TypeChecker_Cfg.reifying)
>>>>>>> master
                               }  in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack1) body1))))
           | FStar_Syntax_Syntax.Tm_app (head1,args) ->
               let stack1 =
                 FStar_All.pipe_right stack
                   (FStar_List.fold_right
<<<<<<< HEAD
                      (fun uu____11494  ->
                         fun stack1  ->
                           match uu____11494 with
                           | (a,aq) ->
                               let uu____11506 =
                                 let uu____11507 =
                                   let uu____11514 =
                                     let uu____11515 =
                                       let uu____11547 =
                                         FStar_Util.mk_ref
                                           FStar_Pervasives_Native.None
                                          in
                                       (env, a, uu____11547, false)  in
                                     Clos uu____11515  in
                                   (uu____11514, aq,
                                     (t1.FStar_Syntax_Syntax.pos))
                                    in
                                 Arg uu____11507  in
                               uu____11506 :: stack1) args)
                  in
               (FStar_TypeChecker_Cfg.log cfg
                  (fun uu____11615  ->
                     let uu____11616 =
                       FStar_All.pipe_left FStar_Util.string_of_int
                         (FStar_List.length args)
                        in
                     FStar_Util.print1 "\tPushed %s arguments\n" uu____11616);
                norm cfg env stack1 head1)
           | FStar_Syntax_Syntax.Tm_refine (x,uu____11630) when
=======
                      (fun uu____11590  ->
                         fun stack1  ->
                           match uu____11590 with
                           | (a,aq) ->
                               let uu____11602 =
                                 let uu____11603 =
                                   let uu____11610 =
                                     let uu____11611 =
                                       let uu____11643 =
                                         FStar_Util.mk_ref
                                           FStar_Pervasives_Native.None
                                          in
                                       (env, a, uu____11643, false)  in
                                     Clos uu____11611  in
                                   (uu____11610, aq,
                                     (t1.FStar_Syntax_Syntax.pos))
                                    in
                                 Arg uu____11603  in
                               uu____11602 :: stack1) args)
                  in
               (FStar_TypeChecker_Cfg.log cfg
                  (fun uu____11711  ->
                     let uu____11712 =
                       FStar_All.pipe_left FStar_Util.string_of_int
                         (FStar_List.length args)
                        in
                     FStar_Util.print1 "\tPushed %s arguments\n" uu____11712);
                norm cfg env stack1 head1)
           | FStar_Syntax_Syntax.Tm_refine (x,uu____11726) when
>>>>>>> master
               (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.for_extraction
               -> norm cfg env stack x.FStar_Syntax_Syntax.sort
           | FStar_Syntax_Syntax.Tm_refine (x,f) ->
               if
                 (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak
               then
                 (match (env, stack) with
                  | ([],[]) ->
                      let t_x = norm cfg env [] x.FStar_Syntax_Syntax.sort
                         in
                      let t2 =
                        mk
                          (FStar_Syntax_Syntax.Tm_refine
<<<<<<< HEAD
                             ((let uu___1463_11675 = x  in
                               {
                                 FStar_Syntax_Syntax.ppname =
                                   (uu___1463_11675.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___1463_11675.FStar_Syntax_Syntax.index);
=======
                             ((let uu___1466_11771 = x  in
                               {
                                 FStar_Syntax_Syntax.ppname =
                                   (uu___1466_11771.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___1466_11771.FStar_Syntax_Syntax.index);
>>>>>>> master
                                 FStar_Syntax_Syntax.sort = t_x
                               }), f)) t1.FStar_Syntax_Syntax.pos
                         in
                      rebuild cfg env stack t2
<<<<<<< HEAD
                  | uu____11676 ->
                      let uu____11691 = closure_as_term cfg env t1  in
                      rebuild cfg env stack uu____11691)
               else
                 (let t_x = norm cfg env [] x.FStar_Syntax_Syntax.sort  in
                  let uu____11695 =
                    FStar_Syntax_Subst.open_term
                      [(x, FStar_Pervasives_Native.None)] f
                     in
                  match uu____11695 with
                  | (closing,f1) ->
                      let f2 = norm cfg (dummy :: env) [] f1  in
                      let t2 =
                        let uu____11726 =
                          let uu____11727 =
                            let uu____11734 =
                              FStar_Syntax_Subst.close closing f2  in
                            ((let uu___1472_11740 = x  in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___1472_11740.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index =
                                  (uu___1472_11740.FStar_Syntax_Syntax.index);
                                FStar_Syntax_Syntax.sort = t_x
                              }), uu____11734)
                             in
                          FStar_Syntax_Syntax.Tm_refine uu____11727  in
                        mk uu____11726 t1.FStar_Syntax_Syntax.pos  in
=======
                  | uu____11772 ->
                      let uu____11787 = closure_as_term cfg env t1  in
                      rebuild cfg env stack uu____11787)
               else
                 (let t_x = norm cfg env [] x.FStar_Syntax_Syntax.sort  in
                  let uu____11791 =
                    FStar_Syntax_Subst.open_term
                      [(x, FStar_Pervasives_Native.None)] f
                     in
                  match uu____11791 with
                  | (closing,f1) ->
                      let f2 = norm cfg (dummy :: env) [] f1  in
                      let t2 =
                        let uu____11822 =
                          let uu____11823 =
                            let uu____11830 =
                              FStar_Syntax_Subst.close closing f2  in
                            ((let uu___1475_11836 = x  in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___1475_11836.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index =
                                  (uu___1475_11836.FStar_Syntax_Syntax.index);
                                FStar_Syntax_Syntax.sort = t_x
                              }), uu____11830)
                             in
                          FStar_Syntax_Syntax.Tm_refine uu____11823  in
                        mk uu____11822 t1.FStar_Syntax_Syntax.pos  in
>>>>>>> master
                      rebuild cfg env stack t2)
           | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
               if
                 (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak
               then
<<<<<<< HEAD
                 let uu____11764 = closure_as_term cfg env t1  in
                 rebuild cfg env stack uu____11764
               else
                 (let uu____11767 = FStar_Syntax_Subst.open_comp bs c  in
                  match uu____11767 with
                  | (bs1,c1) ->
                      let c2 =
                        let uu____11775 =
                          FStar_All.pipe_right bs1
                            (FStar_List.fold_left
                               (fun env1  ->
                                  fun uu____11801  -> dummy :: env1) env)
                           in
                        norm_comp cfg uu____11775 c1  in
                      let t2 =
                        let uu____11825 = norm_binders cfg env bs1  in
                        FStar_Syntax_Util.arrow uu____11825 c2  in
=======
                 let uu____11860 = closure_as_term cfg env t1  in
                 rebuild cfg env stack uu____11860
               else
                 (let uu____11863 = FStar_Syntax_Subst.open_comp bs c  in
                  match uu____11863 with
                  | (bs1,c1) ->
                      let c2 =
                        let uu____11871 =
                          FStar_All.pipe_right bs1
                            (FStar_List.fold_left
                               (fun env1  ->
                                  fun uu____11897  -> dummy :: env1) env)
                           in
                        norm_comp cfg uu____11871 c1  in
                      let t2 =
                        let uu____11921 = norm_binders cfg env bs1  in
                        FStar_Syntax_Util.arrow uu____11921 c2  in
>>>>>>> master
                      rebuild cfg env stack t2)
           | FStar_Syntax_Syntax.Tm_ascribed (t11,(tc,tacopt),l) when
               (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unascribe
               -> norm cfg env stack t11
           | FStar_Syntax_Syntax.Tm_ascribed (t11,(tc,tacopt),l) ->
               (match stack with
<<<<<<< HEAD
                | (Match uu____11938)::uu____11939 when
                    (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.beta
                    ->
                    (FStar_TypeChecker_Cfg.log cfg
                       (fun uu____11952  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | (Arg uu____11954)::uu____11955 when
                    (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.beta
                    ->
                    (FStar_TypeChecker_Cfg.log cfg
                       (fun uu____11966  ->
=======
                | (Match uu____12034)::uu____12035 when
                    (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.beta
                    ->
                    (FStar_TypeChecker_Cfg.log cfg
                       (fun uu____12048  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | (Arg uu____12050)::uu____12051 when
                    (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.beta
                    ->
                    (FStar_TypeChecker_Cfg.log cfg
                       (fun uu____12062  ->
>>>>>>> master
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | (App
<<<<<<< HEAD
                    (uu____11968,{
                                   FStar_Syntax_Syntax.n =
                                     FStar_Syntax_Syntax.Tm_constant
                                     (FStar_Const.Const_reify );
                                   FStar_Syntax_Syntax.pos = uu____11969;
                                   FStar_Syntax_Syntax.vars = uu____11970;_},uu____11971,uu____11972))::uu____11973
=======
                    (uu____12064,{
                                   FStar_Syntax_Syntax.n =
                                     FStar_Syntax_Syntax.Tm_constant
                                     (FStar_Const.Const_reify );
                                   FStar_Syntax_Syntax.pos = uu____12065;
                                   FStar_Syntax_Syntax.vars = uu____12066;_},uu____12067,uu____12068))::uu____12069
>>>>>>> master
                    when
                    (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.beta
                    ->
                    (FStar_TypeChecker_Cfg.log cfg
<<<<<<< HEAD
                       (fun uu____11980  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | (MemoLazy uu____11982)::uu____11983 when
                    (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.beta
                    ->
                    (FStar_TypeChecker_Cfg.log cfg
                       (fun uu____11994  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | uu____11996 ->
                    (FStar_TypeChecker_Cfg.log cfg
                       (fun uu____11999  ->
                          FStar_Util.print_string "+++ Keeping ascription \n");
                     (let t12 = norm cfg env [] t11  in
                      FStar_TypeChecker_Cfg.log cfg
                        (fun uu____12004  ->
=======
                       (fun uu____12076  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | (MemoLazy uu____12078)::uu____12079 when
                    (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.beta
                    ->
                    (FStar_TypeChecker_Cfg.log cfg
                       (fun uu____12090  ->
                          FStar_Util.print_string
                            "+++ Dropping ascription \n");
                     norm cfg env stack t11)
                | uu____12092 ->
                    (FStar_TypeChecker_Cfg.log cfg
                       (fun uu____12095  ->
                          FStar_Util.print_string "+++ Keeping ascription \n");
                     (let t12 = norm cfg env [] t11  in
                      FStar_TypeChecker_Cfg.log cfg
                        (fun uu____12100  ->
>>>>>>> master
                           FStar_Util.print_string
                             "+++ Normalizing ascription \n");
                      (let tc1 =
                         match tc with
                         | FStar_Util.Inl t2 ->
<<<<<<< HEAD
                             let uu____12030 = norm cfg env [] t2  in
                             FStar_Util.Inl uu____12030
                         | FStar_Util.Inr c ->
                             let uu____12044 = norm_comp cfg env c  in
                             FStar_Util.Inr uu____12044
=======
                             let uu____12126 = norm cfg env [] t2  in
                             FStar_Util.Inl uu____12126
                         | FStar_Util.Inr c ->
                             let uu____12140 = norm_comp cfg env c  in
                             FStar_Util.Inr uu____12140
>>>>>>> master
                          in
                       let tacopt1 =
                         FStar_Util.map_opt tacopt (norm cfg env [])  in
                       match stack with
                       | (Cfg cfg1)::stack1 ->
                           let t2 =
<<<<<<< HEAD
                             let uu____12067 =
                               let uu____12068 =
                                 let uu____12095 =
                                   FStar_Syntax_Util.unascribe t12  in
                                 (uu____12095, (tc1, tacopt1), l)  in
                               FStar_Syntax_Syntax.Tm_ascribed uu____12068
                                in
                             mk uu____12067 t1.FStar_Syntax_Syntax.pos  in
                           norm cfg1 env stack1 t2
                       | uu____12130 ->
                           let uu____12131 =
                             let uu____12132 =
                               let uu____12133 =
                                 let uu____12160 =
                                   FStar_Syntax_Util.unascribe t12  in
                                 (uu____12160, (tc1, tacopt1), l)  in
                               FStar_Syntax_Syntax.Tm_ascribed uu____12133
                                in
                             mk uu____12132 t1.FStar_Syntax_Syntax.pos  in
                           rebuild cfg env stack uu____12131))))
=======
                             let uu____12163 =
                               let uu____12164 =
                                 let uu____12191 =
                                   FStar_Syntax_Util.unascribe t12  in
                                 (uu____12191, (tc1, tacopt1), l)  in
                               FStar_Syntax_Syntax.Tm_ascribed uu____12164
                                in
                             mk uu____12163 t1.FStar_Syntax_Syntax.pos  in
                           norm cfg1 env stack1 t2
                       | uu____12226 ->
                           let uu____12227 =
                             let uu____12228 =
                               let uu____12229 =
                                 let uu____12256 =
                                   FStar_Syntax_Util.unascribe t12  in
                                 (uu____12256, (tc1, tacopt1), l)  in
                               FStar_Syntax_Syntax.Tm_ascribed uu____12229
                                in
                             mk uu____12228 t1.FStar_Syntax_Syntax.pos  in
                           rebuild cfg env stack uu____12227))))
>>>>>>> master
           | FStar_Syntax_Syntax.Tm_match (head1,branches) ->
               let stack1 =
                 (Match (env, branches, cfg, (t1.FStar_Syntax_Syntax.pos)))
                 :: stack  in
               if
                 ((cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.iota
                    &&
                    (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weakly_reduce_scrutinee)
                   &&
                   (Prims.op_Negation
                      (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak)
               then
                 let cfg' =
<<<<<<< HEAD
                   let uu___1551_12238 = cfg  in
                   {
                     FStar_TypeChecker_Cfg.steps =
                       (let uu___1553_12241 = cfg.FStar_TypeChecker_Cfg.steps
                           in
                        {
                          FStar_TypeChecker_Cfg.beta =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.beta);
                          FStar_TypeChecker_Cfg.iota =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.iota);
                          FStar_TypeChecker_Cfg.zeta =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.zeta);
                          FStar_TypeChecker_Cfg.weak = true;
                          FStar_TypeChecker_Cfg.hnf =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.hnf);
                          FStar_TypeChecker_Cfg.primops =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.primops);
                          FStar_TypeChecker_Cfg.do_not_unfold_pure_lets =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.do_not_unfold_pure_lets);
                          FStar_TypeChecker_Cfg.unfold_until =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.unfold_until);
                          FStar_TypeChecker_Cfg.unfold_only =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.unfold_only);
                          FStar_TypeChecker_Cfg.unfold_fully =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.unfold_fully);
                          FStar_TypeChecker_Cfg.unfold_attr =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.unfold_attr);
                          FStar_TypeChecker_Cfg.unfold_tac =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.unfold_tac);
                          FStar_TypeChecker_Cfg.pure_subterms_within_computations
                            =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.pure_subterms_within_computations);
                          FStar_TypeChecker_Cfg.simplify =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.simplify);
                          FStar_TypeChecker_Cfg.erase_universes =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.erase_universes);
                          FStar_TypeChecker_Cfg.allow_unbound_universes =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.allow_unbound_universes);
                          FStar_TypeChecker_Cfg.reify_ =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.reify_);
                          FStar_TypeChecker_Cfg.compress_uvars =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.compress_uvars);
                          FStar_TypeChecker_Cfg.no_full_norm =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.no_full_norm);
                          FStar_TypeChecker_Cfg.check_no_uvars =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.check_no_uvars);
                          FStar_TypeChecker_Cfg.unmeta =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.unmeta);
                          FStar_TypeChecker_Cfg.unascribe =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.unascribe);
                          FStar_TypeChecker_Cfg.in_full_norm_request =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.in_full_norm_request);
                          FStar_TypeChecker_Cfg.weakly_reduce_scrutinee =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.weakly_reduce_scrutinee);
                          FStar_TypeChecker_Cfg.nbe_step =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.nbe_step);
                          FStar_TypeChecker_Cfg.for_extraction =
                            (uu___1553_12241.FStar_TypeChecker_Cfg.for_extraction)
                        });
                     FStar_TypeChecker_Cfg.tcenv =
                       (uu___1551_12238.FStar_TypeChecker_Cfg.tcenv);
                     FStar_TypeChecker_Cfg.debug =
                       (uu___1551_12238.FStar_TypeChecker_Cfg.debug);
                     FStar_TypeChecker_Cfg.delta_level =
                       (uu___1551_12238.FStar_TypeChecker_Cfg.delta_level);
                     FStar_TypeChecker_Cfg.primitive_steps =
                       (uu___1551_12238.FStar_TypeChecker_Cfg.primitive_steps);
                     FStar_TypeChecker_Cfg.strong =
                       (uu___1551_12238.FStar_TypeChecker_Cfg.strong);
                     FStar_TypeChecker_Cfg.memoize_lazy =
                       (uu___1551_12238.FStar_TypeChecker_Cfg.memoize_lazy);
                     FStar_TypeChecker_Cfg.normalize_pure_lets =
                       (uu___1551_12238.FStar_TypeChecker_Cfg.normalize_pure_lets);
                     FStar_TypeChecker_Cfg.reifying =
                       (uu___1551_12238.FStar_TypeChecker_Cfg.reifying)
=======
                   let uu___1554_12334 = cfg  in
                   {
                     FStar_TypeChecker_Cfg.steps =
                       (let uu___1556_12337 = cfg.FStar_TypeChecker_Cfg.steps
                           in
                        {
                          FStar_TypeChecker_Cfg.beta =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.beta);
                          FStar_TypeChecker_Cfg.iota =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.iota);
                          FStar_TypeChecker_Cfg.zeta =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.zeta);
                          FStar_TypeChecker_Cfg.weak = true;
                          FStar_TypeChecker_Cfg.hnf =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.hnf);
                          FStar_TypeChecker_Cfg.primops =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.primops);
                          FStar_TypeChecker_Cfg.do_not_unfold_pure_lets =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.do_not_unfold_pure_lets);
                          FStar_TypeChecker_Cfg.unfold_until =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.unfold_until);
                          FStar_TypeChecker_Cfg.unfold_only =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.unfold_only);
                          FStar_TypeChecker_Cfg.unfold_fully =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.unfold_fully);
                          FStar_TypeChecker_Cfg.unfold_attr =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.unfold_attr);
                          FStar_TypeChecker_Cfg.unfold_tac =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.unfold_tac);
                          FStar_TypeChecker_Cfg.pure_subterms_within_computations
                            =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.pure_subterms_within_computations);
                          FStar_TypeChecker_Cfg.simplify =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.simplify);
                          FStar_TypeChecker_Cfg.erase_universes =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.erase_universes);
                          FStar_TypeChecker_Cfg.allow_unbound_universes =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.allow_unbound_universes);
                          FStar_TypeChecker_Cfg.reify_ =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.reify_);
                          FStar_TypeChecker_Cfg.compress_uvars =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.compress_uvars);
                          FStar_TypeChecker_Cfg.no_full_norm =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.no_full_norm);
                          FStar_TypeChecker_Cfg.check_no_uvars =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.check_no_uvars);
                          FStar_TypeChecker_Cfg.unmeta =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.unmeta);
                          FStar_TypeChecker_Cfg.unascribe =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.unascribe);
                          FStar_TypeChecker_Cfg.in_full_norm_request =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.in_full_norm_request);
                          FStar_TypeChecker_Cfg.weakly_reduce_scrutinee =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.weakly_reduce_scrutinee);
                          FStar_TypeChecker_Cfg.nbe_step =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.nbe_step);
                          FStar_TypeChecker_Cfg.for_extraction =
                            (uu___1556_12337.FStar_TypeChecker_Cfg.for_extraction)
                        });
                     FStar_TypeChecker_Cfg.tcenv =
                       (uu___1554_12334.FStar_TypeChecker_Cfg.tcenv);
                     FStar_TypeChecker_Cfg.debug =
                       (uu___1554_12334.FStar_TypeChecker_Cfg.debug);
                     FStar_TypeChecker_Cfg.delta_level =
                       (uu___1554_12334.FStar_TypeChecker_Cfg.delta_level);
                     FStar_TypeChecker_Cfg.primitive_steps =
                       (uu___1554_12334.FStar_TypeChecker_Cfg.primitive_steps);
                     FStar_TypeChecker_Cfg.strong =
                       (uu___1554_12334.FStar_TypeChecker_Cfg.strong);
                     FStar_TypeChecker_Cfg.memoize_lazy =
                       (uu___1554_12334.FStar_TypeChecker_Cfg.memoize_lazy);
                     FStar_TypeChecker_Cfg.normalize_pure_lets =
                       (uu___1554_12334.FStar_TypeChecker_Cfg.normalize_pure_lets);
                     FStar_TypeChecker_Cfg.reifying =
                       (uu___1554_12334.FStar_TypeChecker_Cfg.reifying)
>>>>>>> master
                   }  in
                 norm cfg' env ((Cfg cfg) :: stack1) head1
               else norm cfg env stack1 head1
           | FStar_Syntax_Syntax.Tm_let ((b,lbs),lbody) when
               (FStar_Syntax_Syntax.is_top_level lbs) &&
                 (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.compress_uvars
               ->
               let lbs1 =
                 FStar_All.pipe_right lbs
                   (FStar_List.map
                      (fun lb  ->
<<<<<<< HEAD
                         let uu____12282 =
                           FStar_Syntax_Subst.univ_var_opening
                             lb.FStar_Syntax_Syntax.lbunivs
                            in
                         match uu____12282 with
                         | (openings,lbunivs) ->
                             let cfg1 =
                               let uu___1566_12302 = cfg  in
                               let uu____12303 =
=======
                         let uu____12378 =
                           FStar_Syntax_Subst.univ_var_opening
                             lb.FStar_Syntax_Syntax.lbunivs
                            in
                         match uu____12378 with
                         | (openings,lbunivs) ->
                             let cfg1 =
                               let uu___1569_12398 = cfg  in
                               let uu____12399 =
>>>>>>> master
                                 FStar_TypeChecker_Env.push_univ_vars
                                   cfg.FStar_TypeChecker_Cfg.tcenv lbunivs
                                  in
                               {
                                 FStar_TypeChecker_Cfg.steps =
<<<<<<< HEAD
                                   (uu___1566_12302.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv = uu____12303;
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1566_12302.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1566_12302.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1566_12302.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong =
                                   (uu___1566_12302.FStar_TypeChecker_Cfg.strong);
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1566_12302.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1566_12302.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1566_12302.FStar_TypeChecker_Cfg.reifying)
                               }  in
                             let norm1 t2 =
                               let uu____12310 =
                                 let uu____12311 =
                                   FStar_Syntax_Subst.subst openings t2  in
                                 norm cfg1 env [] uu____12311  in
                               FStar_Syntax_Subst.close_univ_vars lbunivs
                                 uu____12310
=======
                                   (uu___1569_12398.FStar_TypeChecker_Cfg.steps);
                                 FStar_TypeChecker_Cfg.tcenv = uu____12399;
                                 FStar_TypeChecker_Cfg.debug =
                                   (uu___1569_12398.FStar_TypeChecker_Cfg.debug);
                                 FStar_TypeChecker_Cfg.delta_level =
                                   (uu___1569_12398.FStar_TypeChecker_Cfg.delta_level);
                                 FStar_TypeChecker_Cfg.primitive_steps =
                                   (uu___1569_12398.FStar_TypeChecker_Cfg.primitive_steps);
                                 FStar_TypeChecker_Cfg.strong =
                                   (uu___1569_12398.FStar_TypeChecker_Cfg.strong);
                                 FStar_TypeChecker_Cfg.memoize_lazy =
                                   (uu___1569_12398.FStar_TypeChecker_Cfg.memoize_lazy);
                                 FStar_TypeChecker_Cfg.normalize_pure_lets =
                                   (uu___1569_12398.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                 FStar_TypeChecker_Cfg.reifying =
                                   (uu___1569_12398.FStar_TypeChecker_Cfg.reifying)
                               }  in
                             let norm1 t2 =
                               let uu____12406 =
                                 let uu____12407 =
                                   FStar_Syntax_Subst.subst openings t2  in
                                 norm cfg1 env [] uu____12407  in
                               FStar_Syntax_Subst.close_univ_vars lbunivs
                                 uu____12406
>>>>>>> master
                                in
                             let lbtyp = norm1 lb.FStar_Syntax_Syntax.lbtyp
                                in
                             let lbdef = norm1 lb.FStar_Syntax_Syntax.lbdef
                                in
<<<<<<< HEAD
                             let uu___1573_12314 = lb  in
                             {
                               FStar_Syntax_Syntax.lbname =
                                 (uu___1573_12314.FStar_Syntax_Syntax.lbname);
                               FStar_Syntax_Syntax.lbunivs = lbunivs;
                               FStar_Syntax_Syntax.lbtyp = lbtyp;
                               FStar_Syntax_Syntax.lbeff =
                                 (uu___1573_12314.FStar_Syntax_Syntax.lbeff);
                               FStar_Syntax_Syntax.lbdef = lbdef;
                               FStar_Syntax_Syntax.lbattrs =
                                 (uu___1573_12314.FStar_Syntax_Syntax.lbattrs);
                               FStar_Syntax_Syntax.lbpos =
                                 (uu___1573_12314.FStar_Syntax_Syntax.lbpos)
                             }))
                  in
               let uu____12315 =
                 mk (FStar_Syntax_Syntax.Tm_let ((b, lbs1), lbody))
                   t1.FStar_Syntax_Syntax.pos
                  in
               rebuild cfg env stack uu____12315
           | FStar_Syntax_Syntax.Tm_let
               ((uu____12328,{
                               FStar_Syntax_Syntax.lbname = FStar_Util.Inr
                                 uu____12329;
                               FStar_Syntax_Syntax.lbunivs = uu____12330;
                               FStar_Syntax_Syntax.lbtyp = uu____12331;
                               FStar_Syntax_Syntax.lbeff = uu____12332;
                               FStar_Syntax_Syntax.lbdef = uu____12333;
                               FStar_Syntax_Syntax.lbattrs = uu____12334;
                               FStar_Syntax_Syntax.lbpos = uu____12335;_}::uu____12336),uu____12337)
=======
                             let uu___1576_12410 = lb  in
                             {
                               FStar_Syntax_Syntax.lbname =
                                 (uu___1576_12410.FStar_Syntax_Syntax.lbname);
                               FStar_Syntax_Syntax.lbunivs = lbunivs;
                               FStar_Syntax_Syntax.lbtyp = lbtyp;
                               FStar_Syntax_Syntax.lbeff =
                                 (uu___1576_12410.FStar_Syntax_Syntax.lbeff);
                               FStar_Syntax_Syntax.lbdef = lbdef;
                               FStar_Syntax_Syntax.lbattrs =
                                 (uu___1576_12410.FStar_Syntax_Syntax.lbattrs);
                               FStar_Syntax_Syntax.lbpos =
                                 (uu___1576_12410.FStar_Syntax_Syntax.lbpos)
                             }))
                  in
               let uu____12411 =
                 mk (FStar_Syntax_Syntax.Tm_let ((b, lbs1), lbody))
                   t1.FStar_Syntax_Syntax.pos
                  in
               rebuild cfg env stack uu____12411
           | FStar_Syntax_Syntax.Tm_let
               ((uu____12424,{
                               FStar_Syntax_Syntax.lbname = FStar_Util.Inr
                                 uu____12425;
                               FStar_Syntax_Syntax.lbunivs = uu____12426;
                               FStar_Syntax_Syntax.lbtyp = uu____12427;
                               FStar_Syntax_Syntax.lbeff = uu____12428;
                               FStar_Syntax_Syntax.lbdef = uu____12429;
                               FStar_Syntax_Syntax.lbattrs = uu____12430;
                               FStar_Syntax_Syntax.lbpos = uu____12431;_}::uu____12432),uu____12433)
>>>>>>> master
               -> rebuild cfg env stack t1
           | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
               let n1 =
                 FStar_TypeChecker_Env.norm_eff_name
                   cfg.FStar_TypeChecker_Cfg.tcenv
                   lb.FStar_Syntax_Syntax.lbeff
                  in
<<<<<<< HEAD
               let uu____12383 =
=======
               let uu____12479 =
>>>>>>> master
                 (Prims.op_Negation
                    (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.do_not_unfold_pure_lets)
                   &&
                   ((((cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.pure_subterms_within_computations
                        &&
                        (FStar_Syntax_Util.has_attribute
                           lb.FStar_Syntax_Syntax.lbattrs
                           FStar_Parser_Const.inline_let_attr))
                       ||
                       ((FStar_Syntax_Util.is_pure_effect n1) &&
                          (cfg.FStar_TypeChecker_Cfg.normalize_pure_lets ||
                             (FStar_Syntax_Util.has_attribute
                                lb.FStar_Syntax_Syntax.lbattrs
                                FStar_Parser_Const.inline_let_attr))))
                      ||
                      ((FStar_Syntax_Util.is_ghost_effect n1) &&
                         (Prims.op_Negation
                            (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.pure_subterms_within_computations)))
                  in
<<<<<<< HEAD
               if uu____12383
               then
                 let binder =
                   let uu____12387 =
                     FStar_Util.left lb.FStar_Syntax_Syntax.lbname  in
                   FStar_Syntax_Syntax.mk_binder uu____12387  in
                 let env1 =
                   let uu____12397 =
                     let uu____12404 =
                       let uu____12405 =
                         let uu____12437 =
                           FStar_Util.mk_ref FStar_Pervasives_Native.None  in
                         (env, (lb.FStar_Syntax_Syntax.lbdef), uu____12437,
                           false)
                          in
                       Clos uu____12405  in
                     ((FStar_Pervasives_Native.Some binder), uu____12404)  in
                   uu____12397 :: env  in
                 (FStar_TypeChecker_Cfg.log cfg
                    (fun uu____12512  ->
=======
               if uu____12479
               then
                 let binder =
                   let uu____12483 =
                     FStar_Util.left lb.FStar_Syntax_Syntax.lbname  in
                   FStar_Syntax_Syntax.mk_binder uu____12483  in
                 let env1 =
                   let uu____12493 =
                     let uu____12500 =
                       let uu____12501 =
                         let uu____12533 =
                           FStar_Util.mk_ref FStar_Pervasives_Native.None  in
                         (env, (lb.FStar_Syntax_Syntax.lbdef), uu____12533,
                           false)
                          in
                       Clos uu____12501  in
                     ((FStar_Pervasives_Native.Some binder), uu____12500)  in
                   uu____12493 :: env  in
                 (FStar_TypeChecker_Cfg.log cfg
                    (fun uu____12608  ->
>>>>>>> master
                       FStar_Util.print_string "+++ Reducing Tm_let\n");
                  norm cfg env1 stack body)
               else
                 if
                   (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak
                 then
                   (FStar_TypeChecker_Cfg.log cfg
<<<<<<< HEAD
                      (fun uu____12519  ->
                         FStar_Util.print_string "+++ Not touching Tm_let\n");
                    (let uu____12521 = closure_as_term cfg env t1  in
                     rebuild cfg env stack uu____12521))
                 else
                   (let uu____12524 =
                      let uu____12529 =
                        let uu____12530 =
                          let uu____12537 =
                            FStar_All.pipe_right
                              lb.FStar_Syntax_Syntax.lbname FStar_Util.left
                             in
                          FStar_All.pipe_right uu____12537
                            FStar_Syntax_Syntax.mk_binder
                           in
                        [uu____12530]  in
                      FStar_Syntax_Subst.open_term uu____12529 body  in
                    match uu____12524 with
                    | (bs,body1) ->
                        (FStar_TypeChecker_Cfg.log cfg
                           (fun uu____12564  ->
=======
                      (fun uu____12615  ->
                         FStar_Util.print_string "+++ Not touching Tm_let\n");
                    (let uu____12617 = closure_as_term cfg env t1  in
                     rebuild cfg env stack uu____12617))
                 else
                   (let uu____12620 =
                      let uu____12625 =
                        let uu____12626 =
                          let uu____12633 =
                            FStar_All.pipe_right
                              lb.FStar_Syntax_Syntax.lbname FStar_Util.left
                             in
                          FStar_All.pipe_right uu____12633
                            FStar_Syntax_Syntax.mk_binder
                           in
                        [uu____12626]  in
                      FStar_Syntax_Subst.open_term uu____12625 body  in
                    match uu____12620 with
                    | (bs,body1) ->
                        (FStar_TypeChecker_Cfg.log cfg
                           (fun uu____12660  ->
>>>>>>> master
                              FStar_Util.print_string
                                "+++ Normalizing Tm_let -- type");
                         (let ty =
                            norm cfg env [] lb.FStar_Syntax_Syntax.lbtyp  in
                          let lbname =
                            let x =
<<<<<<< HEAD
                              let uu____12573 = FStar_List.hd bs  in
                              FStar_Pervasives_Native.fst uu____12573  in
                            FStar_Util.Inl
                              (let uu___1615_12589 = x  in
                               {
                                 FStar_Syntax_Syntax.ppname =
                                   (uu___1615_12589.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___1615_12589.FStar_Syntax_Syntax.index);
=======
                              let uu____12669 = FStar_List.hd bs  in
                              FStar_Pervasives_Native.fst uu____12669  in
                            FStar_Util.Inl
                              (let uu___1618_12685 = x  in
                               {
                                 FStar_Syntax_Syntax.ppname =
                                   (uu___1618_12685.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___1618_12685.FStar_Syntax_Syntax.index);
>>>>>>> master
                                 FStar_Syntax_Syntax.sort = ty
                               })
                             in
                          FStar_TypeChecker_Cfg.log cfg
<<<<<<< HEAD
                            (fun uu____12592  ->
                               FStar_Util.print_string
                                 "+++ Normalizing Tm_let -- definiens\n");
                          (let lb1 =
                             let uu___1620_12595 = lb  in
                             let uu____12596 =
=======
                            (fun uu____12688  ->
                               FStar_Util.print_string
                                 "+++ Normalizing Tm_let -- definiens\n");
                          (let lb1 =
                             let uu___1623_12691 = lb  in
                             let uu____12692 =
>>>>>>> master
                               norm cfg env [] lb.FStar_Syntax_Syntax.lbdef
                                in
                             {
                               FStar_Syntax_Syntax.lbname = lbname;
                               FStar_Syntax_Syntax.lbunivs =
<<<<<<< HEAD
                                 (uu___1620_12595.FStar_Syntax_Syntax.lbunivs);
                               FStar_Syntax_Syntax.lbtyp = ty;
                               FStar_Syntax_Syntax.lbeff =
                                 (uu___1620_12595.FStar_Syntax_Syntax.lbeff);
                               FStar_Syntax_Syntax.lbdef = uu____12596;
                               FStar_Syntax_Syntax.lbattrs =
                                 (uu___1620_12595.FStar_Syntax_Syntax.lbattrs);
                               FStar_Syntax_Syntax.lbpos =
                                 (uu___1620_12595.FStar_Syntax_Syntax.lbpos)
=======
                                 (uu___1623_12691.FStar_Syntax_Syntax.lbunivs);
                               FStar_Syntax_Syntax.lbtyp = ty;
                               FStar_Syntax_Syntax.lbeff =
                                 (uu___1623_12691.FStar_Syntax_Syntax.lbeff);
                               FStar_Syntax_Syntax.lbdef = uu____12692;
                               FStar_Syntax_Syntax.lbattrs =
                                 (uu___1623_12691.FStar_Syntax_Syntax.lbattrs);
                               FStar_Syntax_Syntax.lbpos =
                                 (uu___1623_12691.FStar_Syntax_Syntax.lbpos)
>>>>>>> master
                             }  in
                           let env' =
                             FStar_All.pipe_right bs
                               (FStar_List.fold_left
                                  (fun env1  ->
<<<<<<< HEAD
                                     fun uu____12625  -> dummy :: env1) env)
                              in
                           let stack1 = (Cfg cfg) :: stack  in
                           let cfg1 =
                             let uu___1627_12650 = cfg  in
                             {
                               FStar_TypeChecker_Cfg.steps =
                                 (uu___1627_12650.FStar_TypeChecker_Cfg.steps);
                               FStar_TypeChecker_Cfg.tcenv =
                                 (uu___1627_12650.FStar_TypeChecker_Cfg.tcenv);
                               FStar_TypeChecker_Cfg.debug =
                                 (uu___1627_12650.FStar_TypeChecker_Cfg.debug);
                               FStar_TypeChecker_Cfg.delta_level =
                                 (uu___1627_12650.FStar_TypeChecker_Cfg.delta_level);
                               FStar_TypeChecker_Cfg.primitive_steps =
                                 (uu___1627_12650.FStar_TypeChecker_Cfg.primitive_steps);
                               FStar_TypeChecker_Cfg.strong = true;
                               FStar_TypeChecker_Cfg.memoize_lazy =
                                 (uu___1627_12650.FStar_TypeChecker_Cfg.memoize_lazy);
                               FStar_TypeChecker_Cfg.normalize_pure_lets =
                                 (uu___1627_12650.FStar_TypeChecker_Cfg.normalize_pure_lets);
                               FStar_TypeChecker_Cfg.reifying =
                                 (uu___1627_12650.FStar_TypeChecker_Cfg.reifying)
                             }  in
                           FStar_TypeChecker_Cfg.log cfg1
                             (fun uu____12654  ->
=======
                                     fun uu____12721  -> dummy :: env1) env)
                              in
                           let stack1 = (Cfg cfg) :: stack  in
                           let cfg1 =
                             let uu___1630_12746 = cfg  in
                             {
                               FStar_TypeChecker_Cfg.steps =
                                 (uu___1630_12746.FStar_TypeChecker_Cfg.steps);
                               FStar_TypeChecker_Cfg.tcenv =
                                 (uu___1630_12746.FStar_TypeChecker_Cfg.tcenv);
                               FStar_TypeChecker_Cfg.debug =
                                 (uu___1630_12746.FStar_TypeChecker_Cfg.debug);
                               FStar_TypeChecker_Cfg.delta_level =
                                 (uu___1630_12746.FStar_TypeChecker_Cfg.delta_level);
                               FStar_TypeChecker_Cfg.primitive_steps =
                                 (uu___1630_12746.FStar_TypeChecker_Cfg.primitive_steps);
                               FStar_TypeChecker_Cfg.strong = true;
                               FStar_TypeChecker_Cfg.memoize_lazy =
                                 (uu___1630_12746.FStar_TypeChecker_Cfg.memoize_lazy);
                               FStar_TypeChecker_Cfg.normalize_pure_lets =
                                 (uu___1630_12746.FStar_TypeChecker_Cfg.normalize_pure_lets);
                               FStar_TypeChecker_Cfg.reifying =
                                 (uu___1630_12746.FStar_TypeChecker_Cfg.reifying)
                             }  in
                           FStar_TypeChecker_Cfg.log cfg1
                             (fun uu____12750  ->
>>>>>>> master
                                FStar_Util.print_string
                                  "+++ Normalizing Tm_let -- body\n");
                           norm cfg1 env'
                             ((Let
                                 (env, bs, lb1, (t1.FStar_Syntax_Syntax.pos)))
                             :: stack1) body1))))
           | FStar_Syntax_Syntax.Tm_let ((true ,lbs),body) when
               (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.compress_uvars
                 ||
                 ((Prims.op_Negation
                     (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.zeta)
                    &&
                    (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.pure_subterms_within_computations)
               ->
<<<<<<< HEAD
               let uu____12675 = FStar_Syntax_Subst.open_let_rec lbs body  in
               (match uu____12675 with
=======
               let uu____12771 = FStar_Syntax_Subst.open_let_rec lbs body  in
               (match uu____12771 with
>>>>>>> master
                | (lbs1,body1) ->
                    let lbs2 =
                      FStar_List.map
                        (fun lb  ->
                           let ty =
                             norm cfg env [] lb.FStar_Syntax_Syntax.lbtyp  in
                           let lbname =
<<<<<<< HEAD
                             let uu____12711 =
                               let uu___1643_12712 =
=======
                             let uu____12807 =
                               let uu___1646_12808 =
>>>>>>> master
                                 FStar_Util.left
                                   lb.FStar_Syntax_Syntax.lbname
                                  in
                               {
                                 FStar_Syntax_Syntax.ppname =
<<<<<<< HEAD
                                   (uu___1643_12712.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___1643_12712.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = ty
                               }  in
                             FStar_Util.Inl uu____12711  in
                           let uu____12713 =
                             FStar_Syntax_Util.abs_formals
                               lb.FStar_Syntax_Syntax.lbdef
                              in
                           match uu____12713 with
                           | (xs,def_body,lopt) ->
                               let xs1 = norm_binders cfg env xs  in
                               let env1 =
                                 let uu____12739 =
                                   FStar_List.map (fun uu____12755  -> dummy)
                                     lbs1
                                    in
                                 let uu____12756 =
                                   let uu____12765 =
                                     FStar_List.map
                                       (fun uu____12787  -> dummy) xs1
                                      in
                                   FStar_List.append uu____12765 env  in
                                 FStar_List.append uu____12739 uu____12756
=======
                                   (uu___1646_12808.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___1646_12808.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = ty
                               }  in
                             FStar_Util.Inl uu____12807  in
                           let uu____12809 =
                             FStar_Syntax_Util.abs_formals
                               lb.FStar_Syntax_Syntax.lbdef
                              in
                           match uu____12809 with
                           | (xs,def_body,lopt) ->
                               let xs1 = norm_binders cfg env xs  in
                               let env1 =
                                 let uu____12835 =
                                   FStar_List.map (fun uu____12851  -> dummy)
                                     lbs1
                                    in
                                 let uu____12852 =
                                   let uu____12861 =
                                     FStar_List.map
                                       (fun uu____12883  -> dummy) xs1
                                      in
                                   FStar_List.append uu____12861 env  in
                                 FStar_List.append uu____12835 uu____12852
>>>>>>> master
                                  in
                               let def_body1 = norm cfg env1 [] def_body  in
                               let lopt1 =
                                 match lopt with
                                 | FStar_Pervasives_Native.Some rc ->
<<<<<<< HEAD
                                     let uu____12813 =
                                       let uu___1657_12814 = rc  in
                                       let uu____12815 =
=======
                                     let uu____12909 =
                                       let uu___1660_12910 = rc  in
                                       let uu____12911 =
>>>>>>> master
                                         FStar_Util.map_opt
                                           rc.FStar_Syntax_Syntax.residual_typ
                                           (norm cfg env1 [])
                                          in
                                       {
                                         FStar_Syntax_Syntax.residual_effect
                                           =
<<<<<<< HEAD
                                           (uu___1657_12814.FStar_Syntax_Syntax.residual_effect);
                                         FStar_Syntax_Syntax.residual_typ =
                                           uu____12815;
                                         FStar_Syntax_Syntax.residual_flags =
                                           (uu___1657_12814.FStar_Syntax_Syntax.residual_flags)
                                       }  in
                                     FStar_Pervasives_Native.Some uu____12813
                                 | uu____12824 -> lopt  in
                               let def =
                                 FStar_Syntax_Util.abs xs1 def_body1 lopt1
                                  in
                               let uu___1662_12830 = lb  in
                               {
                                 FStar_Syntax_Syntax.lbname = lbname;
                                 FStar_Syntax_Syntax.lbunivs =
                                   (uu___1662_12830.FStar_Syntax_Syntax.lbunivs);
                                 FStar_Syntax_Syntax.lbtyp = ty;
                                 FStar_Syntax_Syntax.lbeff =
                                   (uu___1662_12830.FStar_Syntax_Syntax.lbeff);
                                 FStar_Syntax_Syntax.lbdef = def;
                                 FStar_Syntax_Syntax.lbattrs =
                                   (uu___1662_12830.FStar_Syntax_Syntax.lbattrs);
                                 FStar_Syntax_Syntax.lbpos =
                                   (uu___1662_12830.FStar_Syntax_Syntax.lbpos)
                               }) lbs1
                       in
                    let env' =
                      let uu____12840 =
                        FStar_List.map (fun uu____12856  -> dummy) lbs2  in
                      FStar_List.append uu____12840 env  in
                    let body2 = norm cfg env' [] body1  in
                    let uu____12864 =
                      FStar_Syntax_Subst.close_let_rec lbs2 body2  in
                    (match uu____12864 with
                     | (lbs3,body3) ->
                         let t2 =
                           let uu___1671_12880 = t1  in
=======
                                           (uu___1660_12910.FStar_Syntax_Syntax.residual_effect);
                                         FStar_Syntax_Syntax.residual_typ =
                                           uu____12911;
                                         FStar_Syntax_Syntax.residual_flags =
                                           (uu___1660_12910.FStar_Syntax_Syntax.residual_flags)
                                       }  in
                                     FStar_Pervasives_Native.Some uu____12909
                                 | uu____12920 -> lopt  in
                               let def =
                                 FStar_Syntax_Util.abs xs1 def_body1 lopt1
                                  in
                               let uu___1665_12926 = lb  in
                               {
                                 FStar_Syntax_Syntax.lbname = lbname;
                                 FStar_Syntax_Syntax.lbunivs =
                                   (uu___1665_12926.FStar_Syntax_Syntax.lbunivs);
                                 FStar_Syntax_Syntax.lbtyp = ty;
                                 FStar_Syntax_Syntax.lbeff =
                                   (uu___1665_12926.FStar_Syntax_Syntax.lbeff);
                                 FStar_Syntax_Syntax.lbdef = def;
                                 FStar_Syntax_Syntax.lbattrs =
                                   (uu___1665_12926.FStar_Syntax_Syntax.lbattrs);
                                 FStar_Syntax_Syntax.lbpos =
                                   (uu___1665_12926.FStar_Syntax_Syntax.lbpos)
                               }) lbs1
                       in
                    let env' =
                      let uu____12936 =
                        FStar_List.map (fun uu____12952  -> dummy) lbs2  in
                      FStar_List.append uu____12936 env  in
                    let body2 = norm cfg env' [] body1  in
                    let uu____12960 =
                      FStar_Syntax_Subst.close_let_rec lbs2 body2  in
                    (match uu____12960 with
                     | (lbs3,body3) ->
                         let t2 =
                           let uu___1674_12976 = t1  in
>>>>>>> master
                           {
                             FStar_Syntax_Syntax.n =
                               (FStar_Syntax_Syntax.Tm_let
                                  ((true, lbs3), body3));
                             FStar_Syntax_Syntax.pos =
<<<<<<< HEAD
                               (uu___1671_12880.FStar_Syntax_Syntax.pos);
                             FStar_Syntax_Syntax.vars =
                               (uu___1671_12880.FStar_Syntax_Syntax.vars)
=======
                               (uu___1674_12976.FStar_Syntax_Syntax.pos);
                             FStar_Syntax_Syntax.vars =
                               (uu___1674_12976.FStar_Syntax_Syntax.vars)
>>>>>>> master
                           }  in
                         rebuild cfg env stack t2))
           | FStar_Syntax_Syntax.Tm_let (lbs,body) when
               Prims.op_Negation
                 (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.zeta
               ->
<<<<<<< HEAD
               let uu____12914 = closure_as_term cfg env t1  in
               rebuild cfg env stack uu____12914
           | FStar_Syntax_Syntax.Tm_let (lbs,body) ->
               let uu____12935 =
                 FStar_List.fold_right
                   (fun lb  ->
                      fun uu____13013  ->
                        match uu____13013 with
                        | (rec_env,memos,i) ->
                            let bv =
                              let uu___1687_13138 =
=======
               let uu____13010 = closure_as_term cfg env t1  in
               rebuild cfg env stack uu____13010
           | FStar_Syntax_Syntax.Tm_let (lbs,body) ->
               let uu____13031 =
                 FStar_List.fold_right
                   (fun lb  ->
                      fun uu____13109  ->
                        match uu____13109 with
                        | (rec_env,memos,i) ->
                            let bv =
                              let uu___1690_13234 =
>>>>>>> master
                                FStar_Util.left lb.FStar_Syntax_Syntax.lbname
                                 in
                              {
                                FStar_Syntax_Syntax.ppname =
<<<<<<< HEAD
                                  (uu___1687_13138.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index = i;
                                FStar_Syntax_Syntax.sort =
                                  (uu___1687_13138.FStar_Syntax_Syntax.sort)
=======
                                  (uu___1690_13234.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index = i;
                                FStar_Syntax_Syntax.sort =
                                  (uu___1690_13234.FStar_Syntax_Syntax.sort)
>>>>>>> master
                              }  in
                            let f_i = FStar_Syntax_Syntax.bv_to_tm bv  in
                            let fix_f_i =
                              mk (FStar_Syntax_Syntax.Tm_let (lbs, f_i))
                                t1.FStar_Syntax_Syntax.pos
                               in
                            let memo =
                              FStar_Util.mk_ref FStar_Pervasives_Native.None
                               in
                            let rec_env1 =
                              (FStar_Pervasives_Native.None,
                                (Clos (env, fix_f_i, memo, true)))
                              :: rec_env  in
                            (rec_env1, (memo :: memos),
                              (i + (Prims.parse_int "1"))))
                   (FStar_Pervasives_Native.snd lbs)
                   (env, [], (Prims.parse_int "0"))
                  in
<<<<<<< HEAD
               (match uu____12935 with
                | (rec_env,memos,uu____13329) ->
                    let uu____13384 =
=======
               (match uu____13031 with
                | (rec_env,memos,uu____13425) ->
                    let uu____13480 =
>>>>>>> master
                      FStar_List.map2
                        (fun lb  ->
                           fun memo  ->
                             FStar_ST.op_Colon_Equals memo
                               (FStar_Pervasives_Native.Some
                                  (rec_env, (lb.FStar_Syntax_Syntax.lbdef))))
                        (FStar_Pervasives_Native.snd lbs) memos
                       in
                    let body_env =
                      FStar_List.fold_right
                        (fun lb  ->
                           fun env1  ->
<<<<<<< HEAD
                             let uu____13633 =
                               let uu____13640 =
                                 let uu____13641 =
                                   let uu____13673 =
=======
                             let uu____13729 =
                               let uu____13736 =
                                 let uu____13737 =
                                   let uu____13769 =
>>>>>>> master
                                     FStar_Util.mk_ref
                                       FStar_Pervasives_Native.None
                                      in
                                   (rec_env, (lb.FStar_Syntax_Syntax.lbdef),
<<<<<<< HEAD
                                     uu____13673, false)
                                    in
                                 Clos uu____13641  in
                               (FStar_Pervasives_Native.None, uu____13640)
                                in
                             uu____13633 :: env1)
=======
                                     uu____13769, false)
                                    in
                                 Clos uu____13737  in
                               (FStar_Pervasives_Native.None, uu____13736)
                                in
                             uu____13729 :: env1)
>>>>>>> master
                        (FStar_Pervasives_Native.snd lbs) env
                       in
                    norm cfg body_env stack body)
           | FStar_Syntax_Syntax.Tm_meta (head1,m) ->
               (FStar_TypeChecker_Cfg.log cfg
<<<<<<< HEAD
                  (fun uu____13758  ->
                     let uu____13759 =
                       FStar_Syntax_Print.metadata_to_string m  in
                     FStar_Util.print1 ">> metadata = %s\n" uu____13759);
=======
                  (fun uu____13854  ->
                     let uu____13855 =
                       FStar_Syntax_Print.metadata_to_string m  in
                     FStar_Util.print1 ">> metadata = %s\n" uu____13855);
>>>>>>> master
                (match m with
                 | FStar_Syntax_Syntax.Meta_monadic (m1,t2) ->
                     reduce_impure_comp cfg env stack head1
                       (FStar_Util.Inl m1) t2
                 | FStar_Syntax_Syntax.Meta_monadic_lift (m1,m',t2) ->
                     reduce_impure_comp cfg env stack head1
                       (FStar_Util.Inr (m1, m')) t2
<<<<<<< HEAD
                 | uu____13783 ->
=======
                 | uu____13879 ->
>>>>>>> master
                     if
                       (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.unmeta
                     then norm cfg env stack head1
                     else
                       (match stack with
<<<<<<< HEAD
                        | uu____13787::uu____13788 ->
                            (match m with
                             | FStar_Syntax_Syntax.Meta_labeled
                                 (l,r,uu____13793) ->
=======
                        | uu____13883::uu____13884 ->
                            (match m with
                             | FStar_Syntax_Syntax.Meta_labeled
                                 (l,r,uu____13889) ->
>>>>>>> master
                                 norm cfg env ((Meta (env, m, r)) :: stack)
                                   head1
                             | FStar_Syntax_Syntax.Meta_pattern (names1,args)
                                 ->
                                 let args1 = norm_pattern_args cfg env args
                                    in
                                 let names2 =
                                   FStar_All.pipe_right names1
                                     (FStar_List.map (norm cfg env []))
                                    in
                                 norm cfg env
                                   ((Meta
                                       (env,
                                         (FStar_Syntax_Syntax.Meta_pattern
                                            (names2, args1)),
                                         (t1.FStar_Syntax_Syntax.pos))) ::
                                   stack) head1
<<<<<<< HEAD
                             | uu____13824 -> norm cfg env stack head1)
=======
                             | uu____13968 -> norm cfg env stack head1)
>>>>>>> master
                        | [] ->
                            let head2 = norm cfg env [] head1  in
                            let m1 =
                              match m with
<<<<<<< HEAD
                              | FStar_Syntax_Syntax.Meta_pattern args ->
                                  let uu____13840 =
                                    norm_pattern_args cfg env args  in
                                  FStar_Syntax_Syntax.Meta_pattern
                                    uu____13840
                              | uu____13853 -> m  in
=======
                              | FStar_Syntax_Syntax.Meta_pattern
                                  (names1,args) ->
                                  let names2 =
                                    FStar_All.pipe_right names1
                                      (FStar_List.map (norm cfg env []))
                                     in
                                  let uu____14016 =
                                    let uu____14037 =
                                      norm_pattern_args cfg env args  in
                                    (names2, uu____14037)  in
                                  FStar_Syntax_Syntax.Meta_pattern
                                    uu____14016
                              | uu____14066 -> m  in
>>>>>>> master
                            let t2 =
                              mk (FStar_Syntax_Syntax.Tm_meta (head2, m1))
                                t1.FStar_Syntax_Syntax.pos
                               in
                            rebuild cfg env stack t2)))
<<<<<<< HEAD
           | FStar_Syntax_Syntax.Tm_delayed uu____13859 ->
               let t2 = FStar_Syntax_Subst.compress t1  in
               norm cfg env stack t2
           | FStar_Syntax_Syntax.Tm_uvar uu____13883 ->
               let t2 = FStar_Syntax_Subst.compress t1  in
               (match t2.FStar_Syntax_Syntax.n with
                | FStar_Syntax_Syntax.Tm_uvar uu____13897 ->
                    if
                      (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.check_no_uvars
                    then
                      let uu____13911 =
                        let uu____13913 =
                          FStar_Range.string_of_range
                            t2.FStar_Syntax_Syntax.pos
                           in
                        let uu____13915 =
                          FStar_Syntax_Print.term_to_string t2  in
                        FStar_Util.format2
                          "(%s) CheckNoUvars: Unexpected unification variable remains: %s"
                          uu____13913 uu____13915
                         in
                      failwith uu____13911
                    else
                      (let uu____13920 = inline_closure_env cfg env [] t2  in
                       rebuild cfg env stack uu____13920)
                | uu____13921 -> norm cfg env stack t2))
=======
           | FStar_Syntax_Syntax.Tm_delayed uu____14072 ->
               let t2 = FStar_Syntax_Subst.compress t1  in
               norm cfg env stack t2
           | FStar_Syntax_Syntax.Tm_uvar uu____14096 ->
               let t2 = FStar_Syntax_Subst.compress t1  in
               (match t2.FStar_Syntax_Syntax.n with
                | FStar_Syntax_Syntax.Tm_uvar uu____14110 ->
                    if
                      (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.check_no_uvars
                    then
                      let uu____14124 =
                        let uu____14126 =
                          FStar_Range.string_of_range
                            t2.FStar_Syntax_Syntax.pos
                           in
                        let uu____14128 =
                          FStar_Syntax_Print.term_to_string t2  in
                        FStar_Util.format2
                          "(%s) CheckNoUvars: Unexpected unification variable remains: %s"
                          uu____14126 uu____14128
                         in
                      failwith uu____14124
                    else
                      (let uu____14133 = inline_closure_env cfg env [] t2  in
                       rebuild cfg env stack uu____14133)
                | uu____14134 -> norm cfg env stack t2))
>>>>>>> master

and (do_unfold_fv :
  FStar_TypeChecker_Cfg.cfg ->
    env ->
      stack_elt Prims.list ->
        FStar_Syntax_Syntax.term ->
          FStar_TypeChecker_Env.qninfo ->
            FStar_Syntax_Syntax.fv -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t0  ->
          fun qninfo  ->
            fun f  ->
<<<<<<< HEAD
              let uu____13930 =
=======
              let uu____14143 =
>>>>>>> master
                FStar_TypeChecker_Env.lookup_definition_qninfo
                  cfg.FStar_TypeChecker_Cfg.delta_level
                  (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                  qninfo
                 in
<<<<<<< HEAD
              match uu____13930 with
              | FStar_Pervasives_Native.None  ->
                  (FStar_TypeChecker_Cfg.log_unfolding cfg
                     (fun uu____13944  ->
                        let uu____13945 = FStar_Syntax_Print.fv_to_string f
                           in
                        FStar_Util.print1 " >> Tm_fvar case 2 for %s\n"
                          uu____13945);
                   rebuild cfg env stack t0)
              | FStar_Pervasives_Native.Some (us,t) ->
                  (FStar_TypeChecker_Cfg.log_unfolding cfg
                     (fun uu____13958  ->
                        let uu____13959 =
                          FStar_Syntax_Print.term_to_string t0  in
                        let uu____13961 = FStar_Syntax_Print.term_to_string t
                           in
                        FStar_Util.print2 " >> Unfolded %s to %s\n"
                          uu____13959 uu____13961);
=======
              match uu____14143 with
              | FStar_Pervasives_Native.None  ->
                  (FStar_TypeChecker_Cfg.log_unfolding cfg
                     (fun uu____14157  ->
                        let uu____14158 = FStar_Syntax_Print.fv_to_string f
                           in
                        FStar_Util.print1 " >> Tm_fvar case 2 for %s\n"
                          uu____14158);
                   rebuild cfg env stack t0)
              | FStar_Pervasives_Native.Some (us,t) ->
                  (FStar_TypeChecker_Cfg.log_unfolding cfg
                     (fun uu____14171  ->
                        let uu____14172 =
                          FStar_Syntax_Print.term_to_string t0  in
                        let uu____14174 = FStar_Syntax_Print.term_to_string t
                           in
                        FStar_Util.print2 " >> Unfolded %s to %s\n"
                          uu____14172 uu____14174);
>>>>>>> master
                   (let t1 =
                      FStar_Syntax_Subst.set_use_range
                        t0.FStar_Syntax_Syntax.pos t
                       in
                    let n1 = FStar_List.length us  in
                    if n1 > (Prims.parse_int "0")
                    then
                      match stack with
<<<<<<< HEAD
                      | (UnivArgs (us',uu____13969))::stack1 ->
                          ((let uu____13978 =
=======
                      | (UnivArgs (us',uu____14187))::stack1 ->
                          ((let uu____14196 =
>>>>>>> master
                              FStar_All.pipe_left
                                (FStar_TypeChecker_Env.debug
                                   cfg.FStar_TypeChecker_Cfg.tcenv)
                                (FStar_Options.Other "univ_norm")
                               in
<<<<<<< HEAD
                            if uu____13978
                            then
                              FStar_List.iter
                                (fun x  ->
                                   let uu____13986 =
                                     FStar_Syntax_Print.univ_to_string x  in
                                   FStar_Util.print1 "Univ (normalizer) %s\n"
                                     uu____13986) us'
=======
                            if uu____14196
                            then
                              FStar_List.iter
                                (fun x  ->
                                   let uu____14204 =
                                     FStar_Syntax_Print.univ_to_string x  in
                                   FStar_Util.print1 "Univ (normalizer) %s\n"
                                     uu____14204) us'
>>>>>>> master
                            else ());
                           (let env1 =
                              FStar_All.pipe_right us'
                                (FStar_List.fold_left
                                   (fun env1  ->
                                      fun u  ->
                                        (FStar_Pervasives_Native.None,
                                          (Univ u))
                                        :: env1) env)
                               in
                            norm cfg env1 stack1 t1))
<<<<<<< HEAD
                      | uu____14022 when
=======
                      | uu____14240 when
>>>>>>> master
                          (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.erase_universes
                            ||
                            (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.allow_unbound_universes
                          -> norm cfg env stack t1
<<<<<<< HEAD
                      | uu____14025 ->
                          let uu____14028 =
                            let uu____14030 =
=======
                      | uu____14243 ->
                          let uu____14246 =
                            let uu____14248 =
>>>>>>> master
                              FStar_Syntax_Print.lid_to_string
                                (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                               in
                            FStar_Util.format1
                              "Impossible: missing universe instantiation on %s"
<<<<<<< HEAD
                              uu____14030
                             in
                          failwith uu____14028
=======
                              uu____14248
                             in
                          failwith uu____14246
>>>>>>> master
                    else norm cfg env stack t1))

and (reduce_impure_comp :
  FStar_TypeChecker_Cfg.cfg ->
    env ->
      stack ->
        FStar_Syntax_Syntax.term ->
          (FStar_Syntax_Syntax.monad_name,(FStar_Syntax_Syntax.monad_name *
                                            FStar_Syntax_Syntax.monad_name))
            FStar_Util.either ->
            FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun head1  ->
          fun m  ->
            fun t  ->
              let t1 = norm cfg env [] t  in
              let stack1 = (Cfg cfg) :: stack  in
              let cfg1 =
                if
                  (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.pure_subterms_within_computations
                then
                  let new_steps =
                    [FStar_TypeChecker_Env.PureSubtermsWithinComputations;
                    FStar_TypeChecker_Env.Primops;
                    FStar_TypeChecker_Env.AllowUnboundUniverses;
                    FStar_TypeChecker_Env.EraseUniverses;
                    FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
                    FStar_TypeChecker_Env.Inlining]  in
<<<<<<< HEAD
                  let uu___1792_14058 = cfg  in
                  let uu____14059 =
=======
                  let uu___1802_14276 = cfg  in
                  let uu____14277 =
>>>>>>> master
                    FStar_List.fold_right FStar_TypeChecker_Cfg.fstep_add_one
                      new_steps cfg.FStar_TypeChecker_Cfg.steps
                     in
                  {
<<<<<<< HEAD
                    FStar_TypeChecker_Cfg.steps = uu____14059;
                    FStar_TypeChecker_Cfg.tcenv =
                      (uu___1792_14058.FStar_TypeChecker_Cfg.tcenv);
                    FStar_TypeChecker_Cfg.debug =
                      (uu___1792_14058.FStar_TypeChecker_Cfg.debug);
=======
                    FStar_TypeChecker_Cfg.steps = uu____14277;
                    FStar_TypeChecker_Cfg.tcenv =
                      (uu___1802_14276.FStar_TypeChecker_Cfg.tcenv);
                    FStar_TypeChecker_Cfg.debug =
                      (uu___1802_14276.FStar_TypeChecker_Cfg.debug);
>>>>>>> master
                    FStar_TypeChecker_Cfg.delta_level =
                      [FStar_TypeChecker_Env.InliningDelta;
                      FStar_TypeChecker_Env.Eager_unfolding_only];
                    FStar_TypeChecker_Cfg.primitive_steps =
<<<<<<< HEAD
                      (uu___1792_14058.FStar_TypeChecker_Cfg.primitive_steps);
                    FStar_TypeChecker_Cfg.strong =
                      (uu___1792_14058.FStar_TypeChecker_Cfg.strong);
                    FStar_TypeChecker_Cfg.memoize_lazy =
                      (uu___1792_14058.FStar_TypeChecker_Cfg.memoize_lazy);
                    FStar_TypeChecker_Cfg.normalize_pure_lets =
                      (uu___1792_14058.FStar_TypeChecker_Cfg.normalize_pure_lets);
                    FStar_TypeChecker_Cfg.reifying =
                      (uu___1792_14058.FStar_TypeChecker_Cfg.reifying)
=======
                      (uu___1802_14276.FStar_TypeChecker_Cfg.primitive_steps);
                    FStar_TypeChecker_Cfg.strong =
                      (uu___1802_14276.FStar_TypeChecker_Cfg.strong);
                    FStar_TypeChecker_Cfg.memoize_lazy =
                      (uu___1802_14276.FStar_TypeChecker_Cfg.memoize_lazy);
                    FStar_TypeChecker_Cfg.normalize_pure_lets =
                      (uu___1802_14276.FStar_TypeChecker_Cfg.normalize_pure_lets);
                    FStar_TypeChecker_Cfg.reifying =
                      (uu___1802_14276.FStar_TypeChecker_Cfg.reifying)
>>>>>>> master
                  }
                else cfg  in
              let metadata =
                match m with
                | FStar_Util.Inl m1 ->
                    FStar_Syntax_Syntax.Meta_monadic (m1, t1)
                | FStar_Util.Inr (m1,m') ->
                    FStar_Syntax_Syntax.Meta_monadic_lift (m1, m', t1)
                 in
              norm cfg1 env
                ((Meta (env, metadata, (head1.FStar_Syntax_Syntax.pos))) ::
                stack1) head1

and (do_reify_monadic :
  (unit -> FStar_Syntax_Syntax.term) ->
    FStar_TypeChecker_Cfg.cfg ->
      env ->
        stack_elt Prims.list ->
          FStar_Syntax_Syntax.term ->
            FStar_Syntax_Syntax.monad_name ->
              FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun fallback  ->
    fun cfg  ->
      fun env  ->
        fun stack  ->
          fun head1  ->
            fun m  ->
              fun t  ->
                (match stack with
                 | (App
<<<<<<< HEAD
                     (uu____14090,{
                                    FStar_Syntax_Syntax.n =
                                      FStar_Syntax_Syntax.Tm_constant
                                      (FStar_Const.Const_reify );
                                    FStar_Syntax_Syntax.pos = uu____14091;
                                    FStar_Syntax_Syntax.vars = uu____14092;_},uu____14093,uu____14094))::uu____14095
                     -> ()
                 | uu____14100 ->
                     let uu____14103 =
                       let uu____14105 = stack_to_string stack  in
                       FStar_Util.format1
                         "INTERNAL ERROR: do_reify_monadic: bad stack: %s"
                         uu____14105
                        in
                     failwith uu____14103);
                (let head0 = head1  in
                 let head2 = FStar_Syntax_Util.unascribe head1  in
                 FStar_TypeChecker_Cfg.log cfg
                   (fun uu____14114  ->
                      let uu____14115 = FStar_Syntax_Print.tag_of_term head2
                         in
                      let uu____14117 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print2 "Reifying: (%s) %s\n" uu____14115
                        uu____14117);
                 (let head3 = FStar_Syntax_Util.unmeta_safe head2  in
                  let uu____14121 =
                    let uu____14122 = FStar_Syntax_Subst.compress head3  in
                    uu____14122.FStar_Syntax_Syntax.n  in
                  match uu____14121 with
                  | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
                      let ed =
                        let uu____14143 =
=======
                     (uu____14308,{
                                    FStar_Syntax_Syntax.n =
                                      FStar_Syntax_Syntax.Tm_constant
                                      (FStar_Const.Const_reify );
                                    FStar_Syntax_Syntax.pos = uu____14309;
                                    FStar_Syntax_Syntax.vars = uu____14310;_},uu____14311,uu____14312))::uu____14313
                     -> ()
                 | uu____14318 ->
                     let uu____14321 =
                       let uu____14323 = stack_to_string stack  in
                       FStar_Util.format1
                         "INTERNAL ERROR: do_reify_monadic: bad stack: %s"
                         uu____14323
                        in
                     failwith uu____14321);
                (let head0 = head1  in
                 let head2 = FStar_Syntax_Util.unascribe head1  in
                 FStar_TypeChecker_Cfg.log cfg
                   (fun uu____14332  ->
                      let uu____14333 = FStar_Syntax_Print.tag_of_term head2
                         in
                      let uu____14335 =
                        FStar_Syntax_Print.term_to_string head2  in
                      FStar_Util.print2 "Reifying: (%s) %s\n" uu____14333
                        uu____14335);
                 (let head3 = FStar_Syntax_Util.unmeta_safe head2  in
                  let uu____14339 =
                    let uu____14340 = FStar_Syntax_Subst.compress head3  in
                    uu____14340.FStar_Syntax_Syntax.n  in
                  match uu____14339 with
                  | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
                      let ed =
                        let uu____14361 =
>>>>>>> master
                          FStar_TypeChecker_Env.norm_eff_name
                            cfg.FStar_TypeChecker_Cfg.tcenv m
                           in
                        FStar_TypeChecker_Env.get_effect_decl
<<<<<<< HEAD
                          cfg.FStar_TypeChecker_Cfg.tcenv uu____14143
                         in
                      let uu____14144 = ed.FStar_Syntax_Syntax.bind_repr  in
                      (match uu____14144 with
                       | (uu____14145,bind_repr) ->
                           (match lb.FStar_Syntax_Syntax.lbname with
                            | FStar_Util.Inr uu____14155 ->
=======
                          cfg.FStar_TypeChecker_Cfg.tcenv uu____14361
                         in
                      let uu____14362 = ed.FStar_Syntax_Syntax.bind_repr  in
                      (match uu____14362 with
                       | (uu____14363,bind_repr) ->
                           (match lb.FStar_Syntax_Syntax.lbname with
                            | FStar_Util.Inr uu____14373 ->
>>>>>>> master
                                failwith
                                  "Cannot reify a top-level let binding"
                            | FStar_Util.Inl x ->
                                let is_return e =
<<<<<<< HEAD
                                  let uu____14166 =
                                    let uu____14167 =
                                      FStar_Syntax_Subst.compress e  in
                                    uu____14167.FStar_Syntax_Syntax.n  in
                                  match uu____14166 with
                                  | FStar_Syntax_Syntax.Tm_meta
                                      (e1,FStar_Syntax_Syntax.Meta_monadic
                                       (uu____14173,uu____14174))
                                      ->
                                      let uu____14183 =
                                        let uu____14184 =
                                          FStar_Syntax_Subst.compress e1  in
                                        uu____14184.FStar_Syntax_Syntax.n  in
                                      (match uu____14183 with
                                       | FStar_Syntax_Syntax.Tm_meta
                                           (e2,FStar_Syntax_Syntax.Meta_monadic_lift
                                            (uu____14190,msrc,uu____14192))
=======
                                  let uu____14384 =
                                    let uu____14385 =
                                      FStar_Syntax_Subst.compress e  in
                                    uu____14385.FStar_Syntax_Syntax.n  in
                                  match uu____14384 with
                                  | FStar_Syntax_Syntax.Tm_meta
                                      (e1,FStar_Syntax_Syntax.Meta_monadic
                                       (uu____14391,uu____14392))
                                      ->
                                      let uu____14401 =
                                        let uu____14402 =
                                          FStar_Syntax_Subst.compress e1  in
                                        uu____14402.FStar_Syntax_Syntax.n  in
                                      (match uu____14401 with
                                       | FStar_Syntax_Syntax.Tm_meta
                                           (e2,FStar_Syntax_Syntax.Meta_monadic_lift
                                            (uu____14408,msrc,uu____14410))
>>>>>>> master
                                           when
                                           FStar_Syntax_Util.is_pure_effect
                                             msrc
                                           ->
<<<<<<< HEAD
                                           let uu____14201 =
                                             FStar_Syntax_Subst.compress e2
                                              in
                                           FStar_Pervasives_Native.Some
                                             uu____14201
                                       | uu____14202 ->
                                           FStar_Pervasives_Native.None)
                                  | uu____14203 ->
                                      FStar_Pervasives_Native.None
                                   in
                                let uu____14204 =
                                  is_return lb.FStar_Syntax_Syntax.lbdef  in
                                (match uu____14204 with
                                 | FStar_Pervasives_Native.Some e ->
                                     let lb1 =
                                       let uu___1864_14209 = lb  in
                                       {
                                         FStar_Syntax_Syntax.lbname =
                                           (uu___1864_14209.FStar_Syntax_Syntax.lbname);
                                         FStar_Syntax_Syntax.lbunivs =
                                           (uu___1864_14209.FStar_Syntax_Syntax.lbunivs);
                                         FStar_Syntax_Syntax.lbtyp =
                                           (uu___1864_14209.FStar_Syntax_Syntax.lbtyp);
=======
                                           let uu____14419 =
                                             FStar_Syntax_Subst.compress e2
                                              in
                                           FStar_Pervasives_Native.Some
                                             uu____14419
                                       | uu____14420 ->
                                           FStar_Pervasives_Native.None)
                                  | uu____14421 ->
                                      FStar_Pervasives_Native.None
                                   in
                                let uu____14422 =
                                  is_return lb.FStar_Syntax_Syntax.lbdef  in
                                (match uu____14422 with
                                 | FStar_Pervasives_Native.Some e ->
                                     let lb1 =
                                       let uu___1874_14427 = lb  in
                                       {
                                         FStar_Syntax_Syntax.lbname =
                                           (uu___1874_14427.FStar_Syntax_Syntax.lbname);
                                         FStar_Syntax_Syntax.lbunivs =
                                           (uu___1874_14427.FStar_Syntax_Syntax.lbunivs);
                                         FStar_Syntax_Syntax.lbtyp =
                                           (uu___1874_14427.FStar_Syntax_Syntax.lbtyp);
>>>>>>> master
                                         FStar_Syntax_Syntax.lbeff =
                                           FStar_Parser_Const.effect_PURE_lid;
                                         FStar_Syntax_Syntax.lbdef = e;
                                         FStar_Syntax_Syntax.lbattrs =
<<<<<<< HEAD
                                           (uu___1864_14209.FStar_Syntax_Syntax.lbattrs);
                                         FStar_Syntax_Syntax.lbpos =
                                           (uu___1864_14209.FStar_Syntax_Syntax.lbpos)
                                       }  in
                                     let uu____14210 = FStar_List.tl stack
                                        in
                                     let uu____14211 =
                                       let uu____14212 =
                                         let uu____14219 =
                                           let uu____14220 =
                                             let uu____14234 =
                                               FStar_Syntax_Util.mk_reify
                                                 body
                                                in
                                             ((false, [lb1]), uu____14234)
                                              in
                                           FStar_Syntax_Syntax.Tm_let
                                             uu____14220
                                            in
                                         FStar_Syntax_Syntax.mk uu____14219
                                          in
                                       uu____14212
                                         FStar_Pervasives_Native.None
                                         head3.FStar_Syntax_Syntax.pos
                                        in
                                     norm cfg env uu____14210 uu____14211
                                 | FStar_Pervasives_Native.None  ->
                                     let uu____14250 =
                                       let uu____14252 = is_return body  in
                                       match uu____14252 with
=======
                                           (uu___1874_14427.FStar_Syntax_Syntax.lbattrs);
                                         FStar_Syntax_Syntax.lbpos =
                                           (uu___1874_14427.FStar_Syntax_Syntax.lbpos)
                                       }  in
                                     let uu____14428 = FStar_List.tl stack
                                        in
                                     let uu____14429 =
                                       let uu____14430 =
                                         let uu____14437 =
                                           let uu____14438 =
                                             let uu____14452 =
                                               FStar_Syntax_Util.mk_reify
                                                 body
                                                in
                                             ((false, [lb1]), uu____14452)
                                              in
                                           FStar_Syntax_Syntax.Tm_let
                                             uu____14438
                                            in
                                         FStar_Syntax_Syntax.mk uu____14437
                                          in
                                       uu____14430
                                         FStar_Pervasives_Native.None
                                         head3.FStar_Syntax_Syntax.pos
                                        in
                                     norm cfg env uu____14428 uu____14429
                                 | FStar_Pervasives_Native.None  ->
                                     let uu____14468 =
                                       let uu____14470 = is_return body  in
                                       match uu____14470 with
>>>>>>> master
                                       | FStar_Pervasives_Native.Some
                                           {
                                             FStar_Syntax_Syntax.n =
                                               FStar_Syntax_Syntax.Tm_bvar y;
                                             FStar_Syntax_Syntax.pos =
<<<<<<< HEAD
                                               uu____14257;
                                             FStar_Syntax_Syntax.vars =
                                               uu____14258;_}
                                           -> FStar_Syntax_Syntax.bv_eq x y
                                       | uu____14261 -> false  in
                                     if uu____14250
=======
                                               uu____14475;
                                             FStar_Syntax_Syntax.vars =
                                               uu____14476;_}
                                           -> FStar_Syntax_Syntax.bv_eq x y
                                       | uu____14479 -> false  in
                                     if uu____14468
>>>>>>> master
                                     then
                                       norm cfg env stack
                                         lb.FStar_Syntax_Syntax.lbdef
                                     else
                                       (let rng =
                                          head3.FStar_Syntax_Syntax.pos  in
                                        let head4 =
                                          FStar_All.pipe_left
                                            FStar_Syntax_Util.mk_reify
                                            lb.FStar_Syntax_Syntax.lbdef
                                           in
                                        let body1 =
                                          FStar_All.pipe_left
                                            FStar_Syntax_Util.mk_reify body
                                           in
                                        let body_rc =
                                          {
                                            FStar_Syntax_Syntax.residual_effect
                                              = m;
                                            FStar_Syntax_Syntax.residual_typ
                                              =
                                              (FStar_Pervasives_Native.Some t);
                                            FStar_Syntax_Syntax.residual_flags
                                              = []
                                          }  in
                                        let body2 =
<<<<<<< HEAD
                                          let uu____14285 =
                                            let uu____14292 =
                                              let uu____14293 =
                                                let uu____14312 =
                                                  let uu____14321 =
                                                    FStar_Syntax_Syntax.mk_binder
                                                      x
                                                     in
                                                  [uu____14321]  in
                                                (uu____14312, body1,
=======
                                          let uu____14503 =
                                            let uu____14510 =
                                              let uu____14511 =
                                                let uu____14530 =
                                                  let uu____14539 =
                                                    FStar_Syntax_Syntax.mk_binder
                                                      x
                                                     in
                                                  [uu____14539]  in
                                                (uu____14530, body1,
>>>>>>> master
                                                  (FStar_Pervasives_Native.Some
                                                     body_rc))
                                                 in
                                              FStar_Syntax_Syntax.Tm_abs
<<<<<<< HEAD
                                                uu____14293
                                               in
                                            FStar_Syntax_Syntax.mk
                                              uu____14292
                                             in
                                          uu____14285
=======
                                                uu____14511
                                               in
                                            FStar_Syntax_Syntax.mk
                                              uu____14510
                                             in
                                          uu____14503
>>>>>>> master
                                            FStar_Pervasives_Native.None
                                            body1.FStar_Syntax_Syntax.pos
                                           in
                                        let close1 = closure_as_term cfg env
                                           in
                                        let bind_inst =
<<<<<<< HEAD
                                          let uu____14360 =
                                            let uu____14361 =
                                              FStar_Syntax_Subst.compress
                                                bind_repr
                                               in
                                            uu____14361.FStar_Syntax_Syntax.n
                                             in
                                          match uu____14360 with
                                          | FStar_Syntax_Syntax.Tm_uinst
                                              (bind1,uu____14367::uu____14368::[])
                                              ->
                                              let uu____14373 =
                                                let uu____14380 =
                                                  let uu____14381 =
                                                    let uu____14388 =
                                                      let uu____14389 =
                                                        let uu____14390 =
=======
                                          let uu____14578 =
                                            let uu____14579 =
                                              FStar_Syntax_Subst.compress
                                                bind_repr
                                               in
                                            uu____14579.FStar_Syntax_Syntax.n
                                             in
                                          match uu____14578 with
                                          | FStar_Syntax_Syntax.Tm_uinst
                                              (bind1,uu____14585::uu____14586::[])
                                              ->
                                              let uu____14591 =
                                                let uu____14598 =
                                                  let uu____14599 =
                                                    let uu____14606 =
                                                      let uu____14607 =
                                                        let uu____14608 =
>>>>>>> master
                                                          close1
                                                            lb.FStar_Syntax_Syntax.lbtyp
                                                           in
                                                        (cfg.FStar_TypeChecker_Cfg.tcenv).FStar_TypeChecker_Env.universe_of
                                                          cfg.FStar_TypeChecker_Cfg.tcenv
<<<<<<< HEAD
                                                          uu____14390
                                                         in
                                                      let uu____14391 =
                                                        let uu____14394 =
                                                          let uu____14395 =
                                                            close1 t  in
                                                          (cfg.FStar_TypeChecker_Cfg.tcenv).FStar_TypeChecker_Env.universe_of
                                                            cfg.FStar_TypeChecker_Cfg.tcenv
                                                            uu____14395
                                                           in
                                                        [uu____14394]  in
                                                      uu____14389 ::
                                                        uu____14391
                                                       in
                                                    (bind1, uu____14388)  in
                                                  FStar_Syntax_Syntax.Tm_uinst
                                                    uu____14381
                                                   in
                                                FStar_Syntax_Syntax.mk
                                                  uu____14380
                                                 in
                                              uu____14373
                                                FStar_Pervasives_Native.None
                                                rng
                                          | uu____14398 ->
=======
                                                          uu____14608
                                                         in
                                                      let uu____14609 =
                                                        let uu____14612 =
                                                          let uu____14613 =
                                                            close1 t  in
                                                          (cfg.FStar_TypeChecker_Cfg.tcenv).FStar_TypeChecker_Env.universe_of
                                                            cfg.FStar_TypeChecker_Cfg.tcenv
                                                            uu____14613
                                                           in
                                                        [uu____14612]  in
                                                      uu____14607 ::
                                                        uu____14609
                                                       in
                                                    (bind1, uu____14606)  in
                                                  FStar_Syntax_Syntax.Tm_uinst
                                                    uu____14599
                                                   in
                                                FStar_Syntax_Syntax.mk
                                                  uu____14598
                                                 in
                                              uu____14591
                                                FStar_Pervasives_Native.None
                                                rng
                                          | uu____14616 ->
>>>>>>> master
                                              failwith
                                                "NIY : Reification of indexed effects"
                                           in
                                        let maybe_range_arg =
<<<<<<< HEAD
                                          let uu____14413 =
=======
                                          let uu____14631 =
>>>>>>> master
                                            FStar_Util.for_some
                                              (FStar_Syntax_Util.attr_eq
                                                 FStar_Syntax_Util.dm4f_bind_range_attr)
                                              ed.FStar_Syntax_Syntax.eff_attrs
                                             in
<<<<<<< HEAD
                                          if uu____14413
                                          then
                                            let uu____14426 =
                                              let uu____14435 =
=======
                                          if uu____14631
                                          then
                                            let uu____14644 =
                                              let uu____14653 =
>>>>>>> master
                                                FStar_TypeChecker_Cfg.embed_simple
                                                  FStar_Syntax_Embeddings.e_range
                                                  lb.FStar_Syntax_Syntax.lbpos
                                                  lb.FStar_Syntax_Syntax.lbpos
                                                 in
                                              FStar_Syntax_Syntax.as_arg
<<<<<<< HEAD
                                                uu____14435
                                               in
                                            let uu____14436 =
                                              let uu____14447 =
                                                let uu____14456 =
=======
                                                uu____14653
                                               in
                                            let uu____14654 =
                                              let uu____14665 =
                                                let uu____14674 =
>>>>>>> master
                                                  FStar_TypeChecker_Cfg.embed_simple
                                                    FStar_Syntax_Embeddings.e_range
                                                    body2.FStar_Syntax_Syntax.pos
                                                    body2.FStar_Syntax_Syntax.pos
                                                   in
                                                FStar_Syntax_Syntax.as_arg
<<<<<<< HEAD
                                                  uu____14456
                                                 in
                                              [uu____14447]  in
                                            uu____14426 :: uu____14436
                                          else []  in
                                        let reified =
                                          let uu____14494 =
                                            let uu____14501 =
                                              let uu____14502 =
                                                let uu____14519 =
                                                  let uu____14530 =
                                                    let uu____14541 =
                                                      FStar_Syntax_Syntax.as_arg
                                                        lb.FStar_Syntax_Syntax.lbtyp
                                                       in
                                                    let uu____14550 =
                                                      let uu____14561 =
                                                        FStar_Syntax_Syntax.as_arg
                                                          t
                                                         in
                                                      [uu____14561]  in
                                                    uu____14541 ::
                                                      uu____14550
                                                     in
                                                  let uu____14594 =
                                                    let uu____14605 =
                                                      let uu____14616 =
                                                        FStar_Syntax_Syntax.as_arg
                                                          FStar_Syntax_Syntax.tun
                                                         in
                                                      let uu____14625 =
                                                        let uu____14636 =
                                                          FStar_Syntax_Syntax.as_arg
                                                            head4
                                                           in
                                                        let uu____14645 =
                                                          let uu____14656 =
                                                            FStar_Syntax_Syntax.as_arg
                                                              FStar_Syntax_Syntax.tun
                                                             in
                                                          let uu____14665 =
                                                            let uu____14676 =
                                                              FStar_Syntax_Syntax.as_arg
                                                                body2
                                                               in
                                                            [uu____14676]  in
                                                          uu____14656 ::
                                                            uu____14665
                                                           in
                                                        uu____14636 ::
                                                          uu____14645
                                                         in
                                                      uu____14616 ::
                                                        uu____14625
                                                       in
                                                    FStar_List.append
                                                      maybe_range_arg
                                                      uu____14605
                                                     in
                                                  FStar_List.append
                                                    uu____14530 uu____14594
                                                   in
                                                (bind_inst, uu____14519)  in
                                              FStar_Syntax_Syntax.Tm_app
                                                uu____14502
                                               in
                                            FStar_Syntax_Syntax.mk
                                              uu____14501
                                             in
                                          uu____14494
                                            FStar_Pervasives_Native.None rng
                                           in
                                        FStar_TypeChecker_Cfg.log cfg
                                          (fun uu____14757  ->
                                             let uu____14758 =
                                               FStar_Syntax_Print.term_to_string
                                                 head0
                                                in
                                             let uu____14760 =
=======
                                                  uu____14674
                                                 in
                                              [uu____14665]  in
                                            uu____14644 :: uu____14654
                                          else []  in
                                        let reified =
                                          let uu____14712 =
                                            let uu____14719 =
                                              let uu____14720 =
                                                let uu____14737 =
                                                  let uu____14748 =
                                                    let uu____14759 =
                                                      FStar_Syntax_Syntax.as_arg
                                                        lb.FStar_Syntax_Syntax.lbtyp
                                                       in
                                                    let uu____14768 =
                                                      let uu____14779 =
                                                        FStar_Syntax_Syntax.as_arg
                                                          t
                                                         in
                                                      [uu____14779]  in
                                                    uu____14759 ::
                                                      uu____14768
                                                     in
                                                  let uu____14812 =
                                                    let uu____14823 =
                                                      let uu____14834 =
                                                        FStar_Syntax_Syntax.as_arg
                                                          FStar_Syntax_Syntax.tun
                                                         in
                                                      let uu____14843 =
                                                        let uu____14854 =
                                                          FStar_Syntax_Syntax.as_arg
                                                            head4
                                                           in
                                                        let uu____14863 =
                                                          let uu____14874 =
                                                            FStar_Syntax_Syntax.as_arg
                                                              FStar_Syntax_Syntax.tun
                                                             in
                                                          let uu____14883 =
                                                            let uu____14894 =
                                                              FStar_Syntax_Syntax.as_arg
                                                                body2
                                                               in
                                                            [uu____14894]  in
                                                          uu____14874 ::
                                                            uu____14883
                                                           in
                                                        uu____14854 ::
                                                          uu____14863
                                                         in
                                                      uu____14834 ::
                                                        uu____14843
                                                       in
                                                    FStar_List.append
                                                      maybe_range_arg
                                                      uu____14823
                                                     in
                                                  FStar_List.append
                                                    uu____14748 uu____14812
                                                   in
                                                (bind_inst, uu____14737)  in
                                              FStar_Syntax_Syntax.Tm_app
                                                uu____14720
                                               in
                                            FStar_Syntax_Syntax.mk
                                              uu____14719
                                             in
                                          uu____14712
                                            FStar_Pervasives_Native.None rng
                                           in
                                        FStar_TypeChecker_Cfg.log cfg
                                          (fun uu____14975  ->
                                             let uu____14976 =
                                               FStar_Syntax_Print.term_to_string
                                                 head0
                                                in
                                             let uu____14978 =
>>>>>>> master
                                               FStar_Syntax_Print.term_to_string
                                                 reified
                                                in
                                             FStar_Util.print2
                                               "Reified (1) <%s> to %s\n"
<<<<<<< HEAD
                                               uu____14758 uu____14760);
                                        (let uu____14763 =
                                           FStar_List.tl stack  in
                                         norm cfg env uu____14763 reified)))))
                  | FStar_Syntax_Syntax.Tm_app (head_app,args) ->
                      ((let uu____14791 = FStar_Options.defensive ()  in
                        if uu____14791
                        then
                          let is_arg_impure uu____14806 =
                            match uu____14806 with
                            | (e,q) ->
                                let uu____14820 =
                                  let uu____14821 =
                                    FStar_Syntax_Subst.compress e  in
                                  uu____14821.FStar_Syntax_Syntax.n  in
                                (match uu____14820 with
=======
                                               uu____14976 uu____14978);
                                        (let uu____14981 =
                                           FStar_List.tl stack  in
                                         norm cfg env uu____14981 reified)))))
                  | FStar_Syntax_Syntax.Tm_app (head_app,args) ->
                      ((let uu____15009 = FStar_Options.defensive ()  in
                        if uu____15009
                        then
                          let is_arg_impure uu____15024 =
                            match uu____15024 with
                            | (e,q) ->
                                let uu____15038 =
                                  let uu____15039 =
                                    FStar_Syntax_Subst.compress e  in
                                  uu____15039.FStar_Syntax_Syntax.n  in
                                (match uu____15038 with
>>>>>>> master
                                 | FStar_Syntax_Syntax.Tm_meta
                                     (e0,FStar_Syntax_Syntax.Meta_monadic_lift
                                      (m1,m2,t'))
                                     ->
<<<<<<< HEAD
                                     let uu____14837 =
                                       FStar_Syntax_Util.is_pure_effect m1
                                        in
                                     Prims.op_Negation uu____14837
                                 | uu____14839 -> false)
                             in
                          let uu____14841 =
                            let uu____14843 =
                              let uu____14854 =
                                FStar_Syntax_Syntax.as_arg head_app  in
                              uu____14854 :: args  in
                            FStar_Util.for_some is_arg_impure uu____14843  in
                          (if uu____14841
                           then
                             let uu____14880 =
                               let uu____14886 =
                                 let uu____14888 =
=======
                                     let uu____15055 =
                                       FStar_Syntax_Util.is_pure_effect m1
                                        in
                                     Prims.op_Negation uu____15055
                                 | uu____15057 -> false)
                             in
                          let uu____15059 =
                            let uu____15061 =
                              let uu____15072 =
                                FStar_Syntax_Syntax.as_arg head_app  in
                              uu____15072 :: args  in
                            FStar_Util.for_some is_arg_impure uu____15061  in
                          (if uu____15059
                           then
                             let uu____15098 =
                               let uu____15104 =
                                 let uu____15106 =
>>>>>>> master
                                   FStar_Syntax_Print.term_to_string head3
                                    in
                                 FStar_Util.format1
                                   "Incompatibility between typechecker and normalizer; this monadic application contains impure terms %s\n"
<<<<<<< HEAD
                                   uu____14888
                                  in
                               (FStar_Errors.Warning_Defensive, uu____14886)
                                in
                             FStar_Errors.log_issue
                               head3.FStar_Syntax_Syntax.pos uu____14880
                           else ())
                        else ());
                       (let fallback1 uu____14901 =
                          FStar_TypeChecker_Cfg.log cfg
                            (fun uu____14905  ->
                               let uu____14906 =
                                 FStar_Syntax_Print.term_to_string head0  in
                               FStar_Util.print2 "Reified (2) <%s> to %s\n"
                                 uu____14906 "");
                          (let uu____14910 = FStar_List.tl stack  in
                           let uu____14911 = FStar_Syntax_Util.mk_reify head3
                              in
                           norm cfg env uu____14910 uu____14911)
                           in
                        let fallback2 uu____14917 =
                          FStar_TypeChecker_Cfg.log cfg
                            (fun uu____14921  ->
                               let uu____14922 =
                                 FStar_Syntax_Print.term_to_string head0  in
                               FStar_Util.print2 "Reified (3) <%s> to %s\n"
                                 uu____14922 "");
                          (let uu____14926 = FStar_List.tl stack  in
                           let uu____14927 =
=======
                                   uu____15106
                                  in
                               (FStar_Errors.Warning_Defensive, uu____15104)
                                in
                             FStar_Errors.log_issue
                               head3.FStar_Syntax_Syntax.pos uu____15098
                           else ())
                        else ());
                       (let fallback1 uu____15119 =
                          FStar_TypeChecker_Cfg.log cfg
                            (fun uu____15123  ->
                               let uu____15124 =
                                 FStar_Syntax_Print.term_to_string head0  in
                               FStar_Util.print2 "Reified (2) <%s> to %s\n"
                                 uu____15124 "");
                          (let uu____15128 = FStar_List.tl stack  in
                           let uu____15129 = FStar_Syntax_Util.mk_reify head3
                              in
                           norm cfg env uu____15128 uu____15129)
                           in
                        let fallback2 uu____15135 =
                          FStar_TypeChecker_Cfg.log cfg
                            (fun uu____15139  ->
                               let uu____15140 =
                                 FStar_Syntax_Print.term_to_string head0  in
                               FStar_Util.print2 "Reified (3) <%s> to %s\n"
                                 uu____15140 "");
                          (let uu____15144 = FStar_List.tl stack  in
                           let uu____15145 =
>>>>>>> master
                             mk
                               (FStar_Syntax_Syntax.Tm_meta
                                  (head3,
                                    (FStar_Syntax_Syntax.Meta_monadic (m, t))))
                               head0.FStar_Syntax_Syntax.pos
                              in
<<<<<<< HEAD
                           norm cfg env uu____14926 uu____14927)
                           in
                        let uu____14932 =
                          let uu____14933 =
                            FStar_Syntax_Util.un_uinst head_app  in
                          uu____14933.FStar_Syntax_Syntax.n  in
                        match uu____14932 with
=======
                           norm cfg env uu____15144 uu____15145)
                           in
                        let uu____15150 =
                          let uu____15151 =
                            FStar_Syntax_Util.un_uinst head_app  in
                          uu____15151.FStar_Syntax_Syntax.n  in
                        match uu____15150 with
>>>>>>> master
                        | FStar_Syntax_Syntax.Tm_fvar fv ->
                            let lid = FStar_Syntax_Syntax.lid_of_fv fv  in
                            let qninfo =
                              FStar_TypeChecker_Env.lookup_qname
                                cfg.FStar_TypeChecker_Cfg.tcenv lid
                               in
<<<<<<< HEAD
                            let uu____14939 =
                              let uu____14941 =
                                FStar_TypeChecker_Env.is_action
                                  cfg.FStar_TypeChecker_Cfg.tcenv lid
                                 in
                              Prims.op_Negation uu____14941  in
                            if uu____14939
                            then fallback1 ()
                            else
                              (let uu____14946 =
                                 let uu____14948 =
=======
                            let uu____15157 =
                              let uu____15159 =
                                FStar_TypeChecker_Env.is_action
                                  cfg.FStar_TypeChecker_Cfg.tcenv lid
                                 in
                              Prims.op_Negation uu____15159  in
                            if uu____15157
                            then fallback1 ()
                            else
                              (let uu____15164 =
                                 let uu____15166 =
>>>>>>> master
                                   FStar_TypeChecker_Env.lookup_definition_qninfo
                                     cfg.FStar_TypeChecker_Cfg.delta_level
                                     (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                                     qninfo
                                    in
<<<<<<< HEAD
                                 FStar_Option.isNone uu____14948  in
                               if uu____14946
                               then fallback2 ()
                               else
                                 (let t1 =
                                    let uu____14965 =
                                      let uu____14970 =
                                        FStar_Syntax_Util.mk_reify head_app
                                         in
                                      FStar_Syntax_Syntax.mk_Tm_app
                                        uu____14970 args
                                       in
                                    uu____14965 FStar_Pervasives_Native.None
                                      t.FStar_Syntax_Syntax.pos
                                     in
                                  let uu____14971 = FStar_List.tl stack  in
                                  norm cfg env uu____14971 t1))
                        | uu____14972 -> fallback1 ()))
                  | FStar_Syntax_Syntax.Tm_meta
                      (e,FStar_Syntax_Syntax.Meta_monadic uu____14974) ->
=======
                                 FStar_Option.isNone uu____15166  in
                               if uu____15164
                               then fallback2 ()
                               else
                                 (let t1 =
                                    let uu____15183 =
                                      let uu____15188 =
                                        FStar_Syntax_Util.mk_reify head_app
                                         in
                                      FStar_Syntax_Syntax.mk_Tm_app
                                        uu____15188 args
                                       in
                                    uu____15183 FStar_Pervasives_Native.None
                                      t.FStar_Syntax_Syntax.pos
                                     in
                                  let uu____15189 = FStar_List.tl stack  in
                                  norm cfg env uu____15189 t1))
                        | uu____15190 -> fallback1 ()))
                  | FStar_Syntax_Syntax.Tm_meta
                      (e,FStar_Syntax_Syntax.Meta_monadic uu____15192) ->
>>>>>>> master
                      do_reify_monadic fallback cfg env stack e m t
                  | FStar_Syntax_Syntax.Tm_meta
                      (e,FStar_Syntax_Syntax.Meta_monadic_lift
                       (msrc,mtgt,t'))
                      ->
                      let lifted =
<<<<<<< HEAD
                        let uu____14998 = closure_as_term cfg env t'  in
                        reify_lift cfg e msrc mtgt uu____14998  in
                      (FStar_TypeChecker_Cfg.log cfg
                         (fun uu____15002  ->
                            let uu____15003 =
                              FStar_Syntax_Print.term_to_string lifted  in
                            FStar_Util.print1 "Reified lift to (2): %s\n"
                              uu____15003);
                       (let uu____15006 = FStar_List.tl stack  in
                        norm cfg env uu____15006 lifted))
=======
                        let uu____15216 = closure_as_term cfg env t'  in
                        reify_lift cfg e msrc mtgt uu____15216  in
                      (FStar_TypeChecker_Cfg.log cfg
                         (fun uu____15220  ->
                            let uu____15221 =
                              FStar_Syntax_Print.term_to_string lifted  in
                            FStar_Util.print1 "Reified lift to (2): %s\n"
                              uu____15221);
                       (let uu____15224 = FStar_List.tl stack  in
                        norm cfg env uu____15224 lifted))
>>>>>>> master
                  | FStar_Syntax_Syntax.Tm_match (e,branches) ->
                      let branches1 =
                        FStar_All.pipe_right branches
                          (FStar_List.map
<<<<<<< HEAD
                             (fun uu____15127  ->
                                match uu____15127 with
                                | (pat,wopt,tm) ->
                                    let uu____15175 =
                                      FStar_Syntax_Util.mk_reify tm  in
                                    (pat, wopt, uu____15175)))
=======
                             (fun uu____15345  ->
                                match uu____15345 with
                                | (pat,wopt,tm) ->
                                    let uu____15393 =
                                      FStar_Syntax_Util.mk_reify tm  in
                                    (pat, wopt, uu____15393)))
>>>>>>> master
                         in
                      let tm =
                        mk (FStar_Syntax_Syntax.Tm_match (e, branches1))
                          head3.FStar_Syntax_Syntax.pos
                         in
<<<<<<< HEAD
                      let uu____15207 = FStar_List.tl stack  in
                      norm cfg env uu____15207 tm
                  | uu____15208 -> fallback ()))
=======
                      let uu____15425 = FStar_List.tl stack  in
                      norm cfg env uu____15425 tm
                  | uu____15426 -> fallback ()))
>>>>>>> master

and (reify_lift :
  FStar_TypeChecker_Cfg.cfg ->
    FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.monad_name ->
        FStar_Syntax_Syntax.monad_name ->
          FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun e  ->
      fun msrc  ->
        fun mtgt  ->
          fun t  ->
            let env = cfg.FStar_TypeChecker_Cfg.tcenv  in
            FStar_TypeChecker_Cfg.log cfg
<<<<<<< HEAD
              (fun uu____15222  ->
                 let uu____15223 = FStar_Ident.string_of_lid msrc  in
                 let uu____15225 = FStar_Ident.string_of_lid mtgt  in
                 let uu____15227 = FStar_Syntax_Print.term_to_string e  in
                 FStar_Util.print3 "Reifying lift %s -> %s: %s\n" uu____15223
                   uu____15225 uu____15227);
            (let uu____15230 =
               (FStar_Syntax_Util.is_pure_effect msrc) ||
                 (FStar_Syntax_Util.is_div_effect msrc)
                in
             if uu____15230
             then
               let ed =
                 let uu____15234 =
                   FStar_TypeChecker_Env.norm_eff_name
                     cfg.FStar_TypeChecker_Cfg.tcenv mtgt
                    in
                 FStar_TypeChecker_Env.get_effect_decl env uu____15234  in
               let uu____15235 = ed.FStar_Syntax_Syntax.return_repr  in
               match uu____15235 with
               | (uu____15236,return_repr) ->
                   let return_inst =
                     let uu____15249 =
                       let uu____15250 =
                         FStar_Syntax_Subst.compress return_repr  in
                       uu____15250.FStar_Syntax_Syntax.n  in
                     match uu____15249 with
                     | FStar_Syntax_Syntax.Tm_uinst
                         (return_tm,uu____15256::[]) ->
                         let uu____15261 =
                           let uu____15268 =
                             let uu____15269 =
                               let uu____15276 =
                                 let uu____15277 =
                                   env.FStar_TypeChecker_Env.universe_of env
                                     t
                                    in
                                 [uu____15277]  in
                               (return_tm, uu____15276)  in
                             FStar_Syntax_Syntax.Tm_uinst uu____15269  in
                           FStar_Syntax_Syntax.mk uu____15268  in
                         uu____15261 FStar_Pervasives_Native.None
                           e.FStar_Syntax_Syntax.pos
                     | uu____15280 ->
                         failwith "NIY : Reification of indexed effects"
                      in
                   let uu____15284 =
                     let uu____15291 =
                       let uu____15292 =
                         let uu____15309 =
                           let uu____15320 = FStar_Syntax_Syntax.as_arg t  in
                           let uu____15329 =
                             let uu____15340 = FStar_Syntax_Syntax.as_arg e
                                in
                             [uu____15340]  in
                           uu____15320 :: uu____15329  in
                         (return_inst, uu____15309)  in
                       FStar_Syntax_Syntax.Tm_app uu____15292  in
                     FStar_Syntax_Syntax.mk uu____15291  in
                   uu____15284 FStar_Pervasives_Native.None
                     e.FStar_Syntax_Syntax.pos
             else
               (let uu____15387 =
                  FStar_TypeChecker_Env.monad_leq env msrc mtgt  in
                match uu____15387 with
                | FStar_Pervasives_Native.None  ->
                    let uu____15390 =
                      let uu____15392 = FStar_Ident.text_of_lid msrc  in
                      let uu____15394 = FStar_Ident.text_of_lid mtgt  in
                      FStar_Util.format2
                        "Impossible : trying to reify a lift between unrelated effects (%s and %s)"
                        uu____15392 uu____15394
                       in
                    failwith uu____15390
                | FStar_Pervasives_Native.Some
                    { FStar_TypeChecker_Env.msource = uu____15397;
                      FStar_TypeChecker_Env.mtarget = uu____15398;
                      FStar_TypeChecker_Env.mlift =
                        { FStar_TypeChecker_Env.mlift_wp = uu____15399;
                          FStar_TypeChecker_Env.mlift_term =
                            FStar_Pervasives_Native.None ;_};_}
                    ->
                    let uu____15421 =
                      let uu____15423 = FStar_Ident.text_of_lid msrc  in
                      let uu____15425 = FStar_Ident.text_of_lid mtgt  in
                      FStar_Util.format2
                        "Impossible : trying to reify a non-reifiable lift (from %s to %s)"
                        uu____15423 uu____15425
                       in
                    failwith uu____15421
                | FStar_Pervasives_Native.Some
                    { FStar_TypeChecker_Env.msource = uu____15428;
                      FStar_TypeChecker_Env.mtarget = uu____15429;
                      FStar_TypeChecker_Env.mlift =
                        { FStar_TypeChecker_Env.mlift_wp = uu____15430;
                          FStar_TypeChecker_Env.mlift_term =
                            FStar_Pervasives_Native.Some lift;_};_}
                    ->
                    let uu____15465 =
                      env.FStar_TypeChecker_Env.universe_of env t  in
                    let uu____15466 = FStar_Syntax_Util.mk_reify e  in
                    lift uu____15465 t FStar_Syntax_Syntax.tun uu____15466))
=======
              (fun uu____15440  ->
                 let uu____15441 = FStar_Ident.string_of_lid msrc  in
                 let uu____15443 = FStar_Ident.string_of_lid mtgt  in
                 let uu____15445 = FStar_Syntax_Print.term_to_string e  in
                 FStar_Util.print3 "Reifying lift %s -> %s: %s\n" uu____15441
                   uu____15443 uu____15445);
            (let uu____15448 =
               (FStar_Syntax_Util.is_pure_effect msrc) ||
                 (FStar_Syntax_Util.is_div_effect msrc)
                in
             if uu____15448
             then
               let ed =
                 let uu____15452 =
                   FStar_TypeChecker_Env.norm_eff_name
                     cfg.FStar_TypeChecker_Cfg.tcenv mtgt
                    in
                 FStar_TypeChecker_Env.get_effect_decl env uu____15452  in
               let uu____15453 = ed.FStar_Syntax_Syntax.return_repr  in
               match uu____15453 with
               | (uu____15454,return_repr) ->
                   let return_inst =
                     let uu____15467 =
                       let uu____15468 =
                         FStar_Syntax_Subst.compress return_repr  in
                       uu____15468.FStar_Syntax_Syntax.n  in
                     match uu____15467 with
                     | FStar_Syntax_Syntax.Tm_uinst
                         (return_tm,uu____15474::[]) ->
                         let uu____15479 =
                           let uu____15486 =
                             let uu____15487 =
                               let uu____15494 =
                                 let uu____15495 =
                                   env.FStar_TypeChecker_Env.universe_of env
                                     t
                                    in
                                 [uu____15495]  in
                               (return_tm, uu____15494)  in
                             FStar_Syntax_Syntax.Tm_uinst uu____15487  in
                           FStar_Syntax_Syntax.mk uu____15486  in
                         uu____15479 FStar_Pervasives_Native.None
                           e.FStar_Syntax_Syntax.pos
                     | uu____15498 ->
                         failwith "NIY : Reification of indexed effects"
                      in
                   let uu____15502 =
                     let uu____15509 =
                       let uu____15510 =
                         let uu____15527 =
                           let uu____15538 = FStar_Syntax_Syntax.as_arg t  in
                           let uu____15547 =
                             let uu____15558 = FStar_Syntax_Syntax.as_arg e
                                in
                             [uu____15558]  in
                           uu____15538 :: uu____15547  in
                         (return_inst, uu____15527)  in
                       FStar_Syntax_Syntax.Tm_app uu____15510  in
                     FStar_Syntax_Syntax.mk uu____15509  in
                   uu____15502 FStar_Pervasives_Native.None
                     e.FStar_Syntax_Syntax.pos
             else
               (let uu____15605 =
                  FStar_TypeChecker_Env.monad_leq env msrc mtgt  in
                match uu____15605 with
                | FStar_Pervasives_Native.None  ->
                    let uu____15608 =
                      let uu____15610 = FStar_Ident.text_of_lid msrc  in
                      let uu____15612 = FStar_Ident.text_of_lid mtgt  in
                      FStar_Util.format2
                        "Impossible : trying to reify a lift between unrelated effects (%s and %s)"
                        uu____15610 uu____15612
                       in
                    failwith uu____15608
                | FStar_Pervasives_Native.Some
                    { FStar_TypeChecker_Env.msource = uu____15615;
                      FStar_TypeChecker_Env.mtarget = uu____15616;
                      FStar_TypeChecker_Env.mlift =
                        { FStar_TypeChecker_Env.mlift_wp = uu____15617;
                          FStar_TypeChecker_Env.mlift_term =
                            FStar_Pervasives_Native.None ;_};_}
                    ->
                    let uu____15639 =
                      let uu____15641 = FStar_Ident.text_of_lid msrc  in
                      let uu____15643 = FStar_Ident.text_of_lid mtgt  in
                      FStar_Util.format2
                        "Impossible : trying to reify a non-reifiable lift (from %s to %s)"
                        uu____15641 uu____15643
                       in
                    failwith uu____15639
                | FStar_Pervasives_Native.Some
                    { FStar_TypeChecker_Env.msource = uu____15646;
                      FStar_TypeChecker_Env.mtarget = uu____15647;
                      FStar_TypeChecker_Env.mlift =
                        { FStar_TypeChecker_Env.mlift_wp = uu____15648;
                          FStar_TypeChecker_Env.mlift_term =
                            FStar_Pervasives_Native.Some lift;_};_}
                    ->
                    let uu____15683 =
                      env.FStar_TypeChecker_Env.universe_of env t  in
                    let uu____15684 = FStar_Syntax_Util.mk_reify e  in
                    lift uu____15683 t FStar_Syntax_Syntax.tun uu____15684))
>>>>>>> master

and (norm_pattern_args :
  FStar_TypeChecker_Cfg.cfg ->
    env ->
      (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax *
        FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)
        Prims.list Prims.list ->
        (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax *
          FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)
          Prims.list Prims.list)
  =
  fun cfg  ->
    fun env  ->
      fun args  ->
        FStar_All.pipe_right args
          (FStar_List.map
             (FStar_List.map
<<<<<<< HEAD
                (fun uu____15536  ->
                   match uu____15536 with
                   | (a,imp) ->
                       let uu____15555 = norm cfg env [] a  in
                       (uu____15555, imp))))
=======
                (fun uu____15754  ->
                   match uu____15754 with
                   | (a,imp) ->
                       let uu____15773 = norm cfg env [] a  in
                       (uu____15773, imp))))
>>>>>>> master

and (norm_comp :
  FStar_TypeChecker_Cfg.cfg ->
    env -> FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun cfg  ->
    fun env  ->
      fun comp  ->
        FStar_TypeChecker_Cfg.log cfg
<<<<<<< HEAD
          (fun uu____15565  ->
             let uu____15566 = FStar_Syntax_Print.comp_to_string comp  in
             let uu____15568 =
               FStar_Util.string_of_int (FStar_List.length env)  in
             FStar_Util.print2 ">>> %s\nNormComp with with %s env elements"
               uu____15566 uu____15568);
=======
          (fun uu____15783  ->
             let uu____15784 = FStar_Syntax_Print.comp_to_string comp  in
             let uu____15786 =
               FStar_Util.string_of_int (FStar_List.length env)  in
             FStar_Util.print2 ">>> %s\nNormComp with with %s env elements"
               uu____15784 uu____15786);
>>>>>>> master
        (match comp.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.Total (t,uopt) ->
             let t1 = norm cfg env [] t  in
             let uopt1 =
               match uopt with
               | FStar_Pervasives_Native.Some u ->
<<<<<<< HEAD
                   let uu____15594 = norm_universe cfg env u  in
                   FStar_All.pipe_left
                     (fun _15597  -> FStar_Pervasives_Native.Some _15597)
                     uu____15594
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
                in
             let uu___2014_15598 = comp  in
=======
                   let uu____15812 = norm_universe cfg env u  in
                   FStar_All.pipe_left
                     (fun _15815  -> FStar_Pervasives_Native.Some _15815)
                     uu____15812
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
                in
             let uu___2024_15816 = comp  in
>>>>>>> master
             {
               FStar_Syntax_Syntax.n =
                 (FStar_Syntax_Syntax.Total (t1, uopt1));
               FStar_Syntax_Syntax.pos =
<<<<<<< HEAD
                 (uu___2014_15598.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___2014_15598.FStar_Syntax_Syntax.vars)
=======
                 (uu___2024_15816.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___2024_15816.FStar_Syntax_Syntax.vars)
>>>>>>> master
             }
         | FStar_Syntax_Syntax.GTotal (t,uopt) ->
             let t1 = norm cfg env [] t  in
             let uopt1 =
               match uopt with
               | FStar_Pervasives_Native.Some u ->
<<<<<<< HEAD
                   let uu____15620 = norm_universe cfg env u  in
                   FStar_All.pipe_left
                     (fun _15623  -> FStar_Pervasives_Native.Some _15623)
                     uu____15620
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
                in
             let uu___2025_15624 = comp  in
=======
                   let uu____15838 = norm_universe cfg env u  in
                   FStar_All.pipe_left
                     (fun _15841  -> FStar_Pervasives_Native.Some _15841)
                     uu____15838
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
                in
             let uu___2035_15842 = comp  in
>>>>>>> master
             {
               FStar_Syntax_Syntax.n =
                 (FStar_Syntax_Syntax.GTotal (t1, uopt1));
               FStar_Syntax_Syntax.pos =
<<<<<<< HEAD
                 (uu___2025_15624.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___2025_15624.FStar_Syntax_Syntax.vars)
=======
                 (uu___2035_15842.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___2035_15842.FStar_Syntax_Syntax.vars)
>>>>>>> master
             }
         | FStar_Syntax_Syntax.Comp ct ->
             let norm_args =
               FStar_List.mapi
                 (fun idx  ->
<<<<<<< HEAD
                    fun uu____15669  ->
                      match uu____15669 with
                      | (a,i) ->
                          let uu____15689 = norm cfg env [] a  in
                          (uu____15689, i))
=======
                    fun uu____15887  ->
                      match uu____15887 with
                      | (a,i) ->
                          let uu____15907 = norm cfg env [] a  in
                          (uu____15907, i))
>>>>>>> master
                in
             let effect_args = norm_args ct.FStar_Syntax_Syntax.effect_args
                in
             let flags =
               FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags
                 (FStar_List.map
<<<<<<< HEAD
                    (fun uu___15_15711  ->
                       match uu___15_15711 with
                       | FStar_Syntax_Syntax.DECREASES t ->
                           let uu____15715 = norm cfg env [] t  in
                           FStar_Syntax_Syntax.DECREASES uu____15715
=======
                    (fun uu___15_15929  ->
                       match uu___15_15929 with
                       | FStar_Syntax_Syntax.DECREASES t ->
                           let uu____15933 = norm cfg env [] t  in
                           FStar_Syntax_Syntax.DECREASES uu____15933
>>>>>>> master
                       | f -> f))
                in
             let comp_univs =
               FStar_List.map (norm_universe cfg env)
                 ct.FStar_Syntax_Syntax.comp_univs
                in
             let result_typ =
               norm cfg env [] ct.FStar_Syntax_Syntax.result_typ  in
<<<<<<< HEAD
             let uu___2042_15723 = comp  in
             {
               FStar_Syntax_Syntax.n =
                 (FStar_Syntax_Syntax.Comp
                    (let uu___2044_15726 = ct  in
                     {
                       FStar_Syntax_Syntax.comp_univs = comp_univs;
                       FStar_Syntax_Syntax.effect_name =
                         (uu___2044_15726.FStar_Syntax_Syntax.effect_name);
=======
             let uu___2052_15941 = comp  in
             {
               FStar_Syntax_Syntax.n =
                 (FStar_Syntax_Syntax.Comp
                    (let uu___2054_15944 = ct  in
                     {
                       FStar_Syntax_Syntax.comp_univs = comp_univs;
                       FStar_Syntax_Syntax.effect_name =
                         (uu___2054_15944.FStar_Syntax_Syntax.effect_name);
>>>>>>> master
                       FStar_Syntax_Syntax.result_typ = result_typ;
                       FStar_Syntax_Syntax.effect_args = effect_args;
                       FStar_Syntax_Syntax.flags = flags
                     }));
               FStar_Syntax_Syntax.pos =
<<<<<<< HEAD
                 (uu___2042_15723.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___2042_15723.FStar_Syntax_Syntax.vars)
=======
                 (uu___2052_15941.FStar_Syntax_Syntax.pos);
               FStar_Syntax_Syntax.vars =
                 (uu___2052_15941.FStar_Syntax_Syntax.vars)
>>>>>>> master
             })

and (norm_binder :
  FStar_TypeChecker_Cfg.cfg ->
    env -> FStar_Syntax_Syntax.binder -> FStar_Syntax_Syntax.binder)
  =
  fun cfg  ->
    fun env  ->
      fun b  ->
<<<<<<< HEAD
        let uu____15730 = b  in
        match uu____15730 with
        | (x,imp) ->
            let x1 =
              let uu___2052_15738 = x  in
              let uu____15739 = norm cfg env [] x.FStar_Syntax_Syntax.sort
                 in
              {
                FStar_Syntax_Syntax.ppname =
                  (uu___2052_15738.FStar_Syntax_Syntax.ppname);
                FStar_Syntax_Syntax.index =
                  (uu___2052_15738.FStar_Syntax_Syntax.index);
                FStar_Syntax_Syntax.sort = uu____15739
=======
        let uu____15948 = b  in
        match uu____15948 with
        | (x,imp) ->
            let x1 =
              let uu___2062_15956 = x  in
              let uu____15957 = norm cfg env [] x.FStar_Syntax_Syntax.sort
                 in
              {
                FStar_Syntax_Syntax.ppname =
                  (uu___2062_15956.FStar_Syntax_Syntax.ppname);
                FStar_Syntax_Syntax.index =
                  (uu___2062_15956.FStar_Syntax_Syntax.index);
                FStar_Syntax_Syntax.sort = uu____15957
>>>>>>> master
              }  in
            let imp1 =
              match imp with
              | FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Meta t) ->
<<<<<<< HEAD
                  let uu____15750 =
                    let uu____15751 = closure_as_term cfg env t  in
                    FStar_Syntax_Syntax.Meta uu____15751  in
                  FStar_Pervasives_Native.Some uu____15750
=======
                  let uu____15968 =
                    let uu____15969 = closure_as_term cfg env t  in
                    FStar_Syntax_Syntax.Meta uu____15969  in
                  FStar_Pervasives_Native.Some uu____15968
>>>>>>> master
              | i -> i  in
            (x1, imp1)

and (norm_binders :
  FStar_TypeChecker_Cfg.cfg ->
    env -> FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binders)
  =
  fun cfg  ->
    fun env  ->
      fun bs  ->
<<<<<<< HEAD
        let uu____15762 =
          FStar_List.fold_left
            (fun uu____15796  ->
               fun b  ->
                 match uu____15796 with
=======
        let uu____15980 =
          FStar_List.fold_left
            (fun uu____16014  ->
               fun b  ->
                 match uu____16014 with
>>>>>>> master
                 | (nbs',env1) ->
                     let b1 = norm_binder cfg env1 b  in
                     ((b1 :: nbs'), (dummy :: env1))) ([], env) bs
           in
<<<<<<< HEAD
        match uu____15762 with | (nbs,uu____15876) -> FStar_List.rev nbs
=======
        match uu____15980 with | (nbs,uu____16094) -> FStar_List.rev nbs
>>>>>>> master

and (norm_lcomp_opt :
  FStar_TypeChecker_Cfg.cfg ->
    env ->
      FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option)
  =
  fun cfg  ->
    fun env  ->
      fun lopt  ->
        match lopt with
        | FStar_Pervasives_Native.Some rc ->
            let flags =
              filter_out_lcomp_cflags rc.FStar_Syntax_Syntax.residual_flags
               in
<<<<<<< HEAD
            let uu____15908 =
              let uu___2077_15909 = rc  in
              let uu____15910 =
=======
            let uu____16126 =
              let uu___2087_16127 = rc  in
              let uu____16128 =
>>>>>>> master
                FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
                  (norm cfg env [])
                 in
              {
                FStar_Syntax_Syntax.residual_effect =
<<<<<<< HEAD
                  (uu___2077_15909.FStar_Syntax_Syntax.residual_effect);
                FStar_Syntax_Syntax.residual_typ = uu____15910;
                FStar_Syntax_Syntax.residual_flags =
                  (uu___2077_15909.FStar_Syntax_Syntax.residual_flags)
              }  in
            FStar_Pervasives_Native.Some uu____15908
        | uu____15919 -> lopt
=======
                  (uu___2087_16127.FStar_Syntax_Syntax.residual_effect);
                FStar_Syntax_Syntax.residual_typ = uu____16128;
                FStar_Syntax_Syntax.residual_flags =
                  (uu___2087_16127.FStar_Syntax_Syntax.residual_flags)
              }  in
            FStar_Pervasives_Native.Some uu____16126
        | uu____16137 -> lopt
>>>>>>> master

and (maybe_simplify :
  FStar_TypeChecker_Cfg.cfg ->
    env -> stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun tm  ->
          let tm' = maybe_simplify_aux cfg env stack tm  in
          if (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.b380
          then
<<<<<<< HEAD
            (let uu____15929 = FStar_Syntax_Print.term_to_string tm  in
             let uu____15931 = FStar_Syntax_Print.term_to_string tm'  in
=======
            (let uu____16147 = FStar_Syntax_Print.term_to_string tm  in
             let uu____16149 = FStar_Syntax_Print.term_to_string tm'  in
>>>>>>> master
             FStar_Util.print3 "%sSimplified\n\t%s to\n\t%s\n"
               (if
                  (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.simplify
                then ""
<<<<<<< HEAD
                else "NOT ") uu____15929 uu____15931)
=======
                else "NOT ") uu____16147 uu____16149)
>>>>>>> master
          else ();
          tm'

and (norm_cb : FStar_TypeChecker_Cfg.cfg -> FStar_Syntax_Embeddings.norm_cb)
  =
  fun cfg  ->
<<<<<<< HEAD
    fun uu___16_15943  ->
      match uu___16_15943 with
      | FStar_Util.Inr x -> norm cfg [] [] x
      | FStar_Util.Inl l ->
          let uu____15956 =
            FStar_Syntax_DsEnv.try_lookup_lid
              (cfg.FStar_TypeChecker_Cfg.tcenv).FStar_TypeChecker_Env.dsenv l
             in
          (match uu____15956 with
           | FStar_Pervasives_Native.Some t -> t
           | FStar_Pervasives_Native.None  ->
               let uu____15960 =
=======
    fun uu___16_16161  ->
      match uu___16_16161 with
      | FStar_Util.Inr x -> norm cfg [] [] x
      | FStar_Util.Inl l ->
          let uu____16174 =
            FStar_Syntax_DsEnv.try_lookup_lid
              (cfg.FStar_TypeChecker_Cfg.tcenv).FStar_TypeChecker_Env.dsenv l
             in
          (match uu____16174 with
           | FStar_Pervasives_Native.Some t -> t
           | FStar_Pervasives_Native.None  ->
               let uu____16178 =
>>>>>>> master
                 FStar_Syntax_Syntax.lid_as_fv l
                   FStar_Syntax_Syntax.delta_constant
                   FStar_Pervasives_Native.None
                  in
<<<<<<< HEAD
               FStar_Syntax_Syntax.fv_to_tm uu____15960)
=======
               FStar_Syntax_Syntax.fv_to_tm uu____16178)
>>>>>>> master

and (maybe_simplify_aux :
  FStar_TypeChecker_Cfg.cfg ->
    env -> stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun tm  ->
          let tm1 =
<<<<<<< HEAD
            let uu____15968 = norm_cb cfg  in
            reduce_primops uu____15968 cfg env tm  in
          let uu____15973 =
            FStar_All.pipe_left Prims.op_Negation
              (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.simplify
             in
          if uu____15973
          then tm1
          else
            (let w t =
               let uu___2105_15992 = t  in
               {
                 FStar_Syntax_Syntax.n =
                   (uu___2105_15992.FStar_Syntax_Syntax.n);
                 FStar_Syntax_Syntax.pos = (tm1.FStar_Syntax_Syntax.pos);
                 FStar_Syntax_Syntax.vars =
                   (uu___2105_15992.FStar_Syntax_Syntax.vars)
               }  in
             let simp_t t =
               let uu____16004 =
                 let uu____16005 = FStar_Syntax_Util.unmeta t  in
                 uu____16005.FStar_Syntax_Syntax.n  in
               match uu____16004 with
=======
            let uu____16186 = norm_cb cfg  in
            reduce_primops uu____16186 cfg env tm  in
          let uu____16191 =
            FStar_All.pipe_left Prims.op_Negation
              (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.simplify
             in
          if uu____16191
          then tm1
          else
            (let w t =
               let uu___2115_16210 = t  in
               {
                 FStar_Syntax_Syntax.n =
                   (uu___2115_16210.FStar_Syntax_Syntax.n);
                 FStar_Syntax_Syntax.pos = (tm1.FStar_Syntax_Syntax.pos);
                 FStar_Syntax_Syntax.vars =
                   (uu___2115_16210.FStar_Syntax_Syntax.vars)
               }  in
             let simp_t t =
               let uu____16222 =
                 let uu____16223 = FStar_Syntax_Util.unmeta t  in
                 uu____16223.FStar_Syntax_Syntax.n  in
               match uu____16222 with
>>>>>>> master
               | FStar_Syntax_Syntax.Tm_fvar fv when
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.true_lid
                   -> FStar_Pervasives_Native.Some true
               | FStar_Syntax_Syntax.Tm_fvar fv when
                   FStar_Syntax_Syntax.fv_eq_lid fv
                     FStar_Parser_Const.false_lid
                   -> FStar_Pervasives_Native.Some false
<<<<<<< HEAD
               | uu____16017 -> FStar_Pervasives_Native.None  in
             let rec args_are_binders args bs =
               match (args, bs) with
               | ((t,uu____16081)::args1,(bv,uu____16084)::bs1) ->
                   let uu____16138 =
                     let uu____16139 = FStar_Syntax_Subst.compress t  in
                     uu____16139.FStar_Syntax_Syntax.n  in
                   (match uu____16138 with
                    | FStar_Syntax_Syntax.Tm_name bv' ->
                        (FStar_Syntax_Syntax.bv_eq bv bv') &&
                          (args_are_binders args1 bs1)
                    | uu____16144 -> false)
               | ([],[]) -> true
               | (uu____16175,uu____16176) -> false  in
             let is_applied bs t =
               if (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.wpe
               then
                 (let uu____16227 = FStar_Syntax_Print.term_to_string t  in
                  let uu____16229 = FStar_Syntax_Print.tag_of_term t  in
                  FStar_Util.print2 "WPE> is_applied %s -- %s\n" uu____16227
                    uu____16229)
               else ();
               (let uu____16234 = FStar_Syntax_Util.head_and_args' t  in
                match uu____16234 with
                | (hd1,args) ->
                    let uu____16273 =
                      let uu____16274 = FStar_Syntax_Subst.compress hd1  in
                      uu____16274.FStar_Syntax_Syntax.n  in
                    (match uu____16273 with
=======
               | uu____16235 -> FStar_Pervasives_Native.None  in
             let rec args_are_binders args bs =
               match (args, bs) with
               | ((t,uu____16299)::args1,(bv,uu____16302)::bs1) ->
                   let uu____16356 =
                     let uu____16357 = FStar_Syntax_Subst.compress t  in
                     uu____16357.FStar_Syntax_Syntax.n  in
                   (match uu____16356 with
                    | FStar_Syntax_Syntax.Tm_name bv' ->
                        (FStar_Syntax_Syntax.bv_eq bv bv') &&
                          (args_are_binders args1 bs1)
                    | uu____16362 -> false)
               | ([],[]) -> true
               | (uu____16393,uu____16394) -> false  in
             let is_applied bs t =
               if (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.wpe
               then
                 (let uu____16445 = FStar_Syntax_Print.term_to_string t  in
                  let uu____16447 = FStar_Syntax_Print.tag_of_term t  in
                  FStar_Util.print2 "WPE> is_applied %s -- %s\n" uu____16445
                    uu____16447)
               else ();
               (let uu____16452 = FStar_Syntax_Util.head_and_args' t  in
                match uu____16452 with
                | (hd1,args) ->
                    let uu____16491 =
                      let uu____16492 = FStar_Syntax_Subst.compress hd1  in
                      uu____16492.FStar_Syntax_Syntax.n  in
                    (match uu____16491 with
>>>>>>> master
                     | FStar_Syntax_Syntax.Tm_name bv when
                         args_are_binders args bs ->
                         (if
                            (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.wpe
                          then
<<<<<<< HEAD
                            (let uu____16282 =
                               FStar_Syntax_Print.term_to_string t  in
                             let uu____16284 =
                               FStar_Syntax_Print.bv_to_string bv  in
                             let uu____16286 =
                               FStar_Syntax_Print.term_to_string hd1  in
                             FStar_Util.print3
                               "WPE> got it\n>>>>top = %s\n>>>>b = %s\n>>>>hd = %s\n"
                               uu____16282 uu____16284 uu____16286)
                          else ();
                          FStar_Pervasives_Native.Some bv)
                     | uu____16291 -> FStar_Pervasives_Native.None))
=======
                            (let uu____16500 =
                               FStar_Syntax_Print.term_to_string t  in
                             let uu____16502 =
                               FStar_Syntax_Print.bv_to_string bv  in
                             let uu____16504 =
                               FStar_Syntax_Print.term_to_string hd1  in
                             FStar_Util.print3
                               "WPE> got it\n>>>>top = %s\n>>>>b = %s\n>>>>hd = %s\n"
                               uu____16500 uu____16502 uu____16504)
                          else ();
                          FStar_Pervasives_Native.Some bv)
                     | uu____16509 -> FStar_Pervasives_Native.None))
>>>>>>> master
                in
             let is_applied_maybe_squashed bs t =
               if (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.wpe
               then
<<<<<<< HEAD
                 (let uu____16309 = FStar_Syntax_Print.term_to_string t  in
                  let uu____16311 = FStar_Syntax_Print.tag_of_term t  in
                  FStar_Util.print2
                    "WPE> is_applied_maybe_squashed %s -- %s\n" uu____16309
                    uu____16311)
               else ();
               (let uu____16316 = FStar_Syntax_Util.is_squash t  in
                match uu____16316 with
                | FStar_Pervasives_Native.Some (uu____16327,t') ->
                    is_applied bs t'
                | uu____16339 ->
                    let uu____16348 = FStar_Syntax_Util.is_auto_squash t  in
                    (match uu____16348 with
                     | FStar_Pervasives_Native.Some (uu____16359,t') ->
                         is_applied bs t'
                     | uu____16371 -> is_applied bs t))
                in
             let is_quantified_const bv phi =
               let uu____16395 =
                 FStar_Syntax_Util.destruct_typ_as_formula phi  in
               match uu____16395 with
               | FStar_Pervasives_Native.Some (FStar_Syntax_Util.BaseConn
                   (lid,(p,uu____16402)::(q,uu____16404)::[])) when
=======
                 (let uu____16527 = FStar_Syntax_Print.term_to_string t  in
                  let uu____16529 = FStar_Syntax_Print.tag_of_term t  in
                  FStar_Util.print2
                    "WPE> is_applied_maybe_squashed %s -- %s\n" uu____16527
                    uu____16529)
               else ();
               (let uu____16534 = FStar_Syntax_Util.is_squash t  in
                match uu____16534 with
                | FStar_Pervasives_Native.Some (uu____16545,t') ->
                    is_applied bs t'
                | uu____16557 ->
                    let uu____16566 = FStar_Syntax_Util.is_auto_squash t  in
                    (match uu____16566 with
                     | FStar_Pervasives_Native.Some (uu____16577,t') ->
                         is_applied bs t'
                     | uu____16589 -> is_applied bs t))
                in
             let is_quantified_const bv phi =
               let uu____16613 =
                 FStar_Syntax_Util.destruct_typ_as_formula phi  in
               match uu____16613 with
               | FStar_Pervasives_Native.Some (FStar_Syntax_Util.BaseConn
                   (lid,(p,uu____16620)::(q,uu____16622)::[])) when
>>>>>>> master
                   FStar_Ident.lid_equals lid FStar_Parser_Const.imp_lid ->
                   (if
                      (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.wpe
                    then
<<<<<<< HEAD
                      (let uu____16447 = FStar_Syntax_Print.term_to_string p
                          in
                       let uu____16449 = FStar_Syntax_Print.term_to_string q
                          in
                       FStar_Util.print2 "WPE> p = (%s); q = (%s)\n"
                         uu____16447 uu____16449)
                    else ();
                    (let uu____16454 =
                       FStar_Syntax_Util.destruct_typ_as_formula p  in
                     match uu____16454 with
                     | FStar_Pervasives_Native.None  ->
                         let uu____16459 =
                           let uu____16460 = FStar_Syntax_Subst.compress p
                              in
                           uu____16460.FStar_Syntax_Syntax.n  in
                         (match uu____16459 with
=======
                      (let uu____16665 = FStar_Syntax_Print.term_to_string p
                          in
                       let uu____16667 = FStar_Syntax_Print.term_to_string q
                          in
                       FStar_Util.print2 "WPE> p = (%s); q = (%s)\n"
                         uu____16665 uu____16667)
                    else ();
                    (let uu____16672 =
                       FStar_Syntax_Util.destruct_typ_as_formula p  in
                     match uu____16672 with
                     | FStar_Pervasives_Native.None  ->
                         let uu____16677 =
                           let uu____16678 = FStar_Syntax_Subst.compress p
                              in
                           uu____16678.FStar_Syntax_Syntax.n  in
                         (match uu____16677 with
>>>>>>> master
                          | FStar_Syntax_Syntax.Tm_bvar bv' when
                              FStar_Syntax_Syntax.bv_eq bv bv' ->
                              (if
                                 (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.wpe
                               then FStar_Util.print_string "WPE> Case 1\n"
                               else ();
<<<<<<< HEAD
                               (let uu____16471 =
=======
                               (let uu____16689 =
>>>>>>> master
                                  FStar_Syntax_Subst.subst
                                    [FStar_Syntax_Syntax.NT
                                       (bv, FStar_Syntax_Util.t_true)] q
                                   in
<<<<<<< HEAD
                                FStar_Pervasives_Native.Some uu____16471))
                          | uu____16474 -> FStar_Pervasives_Native.None)
                     | FStar_Pervasives_Native.Some
                         (FStar_Syntax_Util.BaseConn
                         (lid1,(p1,uu____16477)::[])) when
                         FStar_Ident.lid_equals lid1
                           FStar_Parser_Const.not_lid
                         ->
                         let uu____16502 =
                           let uu____16503 = FStar_Syntax_Subst.compress p1
                              in
                           uu____16503.FStar_Syntax_Syntax.n  in
                         (match uu____16502 with
=======
                                FStar_Pervasives_Native.Some uu____16689))
                          | uu____16692 -> FStar_Pervasives_Native.None)
                     | FStar_Pervasives_Native.Some
                         (FStar_Syntax_Util.BaseConn
                         (lid1,(p1,uu____16695)::[])) when
                         FStar_Ident.lid_equals lid1
                           FStar_Parser_Const.not_lid
                         ->
                         let uu____16720 =
                           let uu____16721 = FStar_Syntax_Subst.compress p1
                              in
                           uu____16721.FStar_Syntax_Syntax.n  in
                         (match uu____16720 with
>>>>>>> master
                          | FStar_Syntax_Syntax.Tm_bvar bv' when
                              FStar_Syntax_Syntax.bv_eq bv bv' ->
                              (if
                                 (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.wpe
                               then FStar_Util.print_string "WPE> Case 2\n"
                               else ();
<<<<<<< HEAD
                               (let uu____16514 =
=======
                               (let uu____16732 =
>>>>>>> master
                                  FStar_Syntax_Subst.subst
                                    [FStar_Syntax_Syntax.NT
                                       (bv, FStar_Syntax_Util.t_false)] q
                                   in
<<<<<<< HEAD
                                FStar_Pervasives_Native.Some uu____16514))
                          | uu____16517 -> FStar_Pervasives_Native.None)
                     | FStar_Pervasives_Native.Some (FStar_Syntax_Util.QAll
                         (bs,pats,phi1)) ->
                         let uu____16521 =
                           FStar_Syntax_Util.destruct_typ_as_formula phi1  in
                         (match uu____16521 with
                          | FStar_Pervasives_Native.None  ->
                              let uu____16526 =
                                is_applied_maybe_squashed bs phi1  in
                              (match uu____16526 with
=======
                                FStar_Pervasives_Native.Some uu____16732))
                          | uu____16735 -> FStar_Pervasives_Native.None)
                     | FStar_Pervasives_Native.Some (FStar_Syntax_Util.QAll
                         (bs,pats,phi1)) ->
                         let uu____16739 =
                           FStar_Syntax_Util.destruct_typ_as_formula phi1  in
                         (match uu____16739 with
                          | FStar_Pervasives_Native.None  ->
                              let uu____16744 =
                                is_applied_maybe_squashed bs phi1  in
                              (match uu____16744 with
>>>>>>> master
                               | FStar_Pervasives_Native.Some bv' when
                                   FStar_Syntax_Syntax.bv_eq bv bv' ->
                                   (if
                                      (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.wpe
                                    then
                                      FStar_Util.print_string "WPE> Case 3\n"
                                    else ();
                                    (let ftrue =
                                       FStar_Syntax_Util.abs bs
                                         FStar_Syntax_Util.t_true
                                         (FStar_Pervasives_Native.Some
                                            (FStar_Syntax_Util.residual_tot
                                               FStar_Syntax_Util.ktype0))
                                        in
<<<<<<< HEAD
                                     let uu____16540 =
=======
                                     let uu____16758 =
>>>>>>> master
                                       FStar_Syntax_Subst.subst
                                         [FStar_Syntax_Syntax.NT (bv, ftrue)]
                                         q
                                        in
<<<<<<< HEAD
                                     FStar_Pervasives_Native.Some uu____16540))
                               | uu____16543 -> FStar_Pervasives_Native.None)
                          | FStar_Pervasives_Native.Some
                              (FStar_Syntax_Util.BaseConn
                              (lid1,(p1,uu____16548)::[])) when
                              FStar_Ident.lid_equals lid1
                                FStar_Parser_Const.not_lid
                              ->
                              let uu____16573 =
                                is_applied_maybe_squashed bs p1  in
                              (match uu____16573 with
=======
                                     FStar_Pervasives_Native.Some uu____16758))
                               | uu____16761 -> FStar_Pervasives_Native.None)
                          | FStar_Pervasives_Native.Some
                              (FStar_Syntax_Util.BaseConn
                              (lid1,(p1,uu____16766)::[])) when
                              FStar_Ident.lid_equals lid1
                                FStar_Parser_Const.not_lid
                              ->
                              let uu____16791 =
                                is_applied_maybe_squashed bs p1  in
                              (match uu____16791 with
>>>>>>> master
                               | FStar_Pervasives_Native.Some bv' when
                                   FStar_Syntax_Syntax.bv_eq bv bv' ->
                                   (if
                                      (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.wpe
                                    then
                                      FStar_Util.print_string "WPE> Case 4\n"
                                    else ();
                                    (let ffalse =
                                       FStar_Syntax_Util.abs bs
                                         FStar_Syntax_Util.t_false
                                         (FStar_Pervasives_Native.Some
                                            (FStar_Syntax_Util.residual_tot
                                               FStar_Syntax_Util.ktype0))
                                        in
<<<<<<< HEAD
                                     let uu____16587 =
=======
                                     let uu____16805 =
>>>>>>> master
                                       FStar_Syntax_Subst.subst
                                         [FStar_Syntax_Syntax.NT (bv, ffalse)]
                                         q
                                        in
<<<<<<< HEAD
                                     FStar_Pervasives_Native.Some uu____16587))
                               | uu____16590 -> FStar_Pervasives_Native.None)
                          | uu____16593 -> FStar_Pervasives_Native.None)
                     | uu____16596 -> FStar_Pervasives_Native.None))
               | uu____16599 -> FStar_Pervasives_Native.None  in
             let is_forall_const phi =
               let uu____16612 =
                 FStar_Syntax_Util.destruct_typ_as_formula phi  in
               match uu____16612 with
               | FStar_Pervasives_Native.Some (FStar_Syntax_Util.QAll
                   ((bv,uu____16618)::[],uu____16619,phi')) ->
                   (if
                      (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.wpe
                    then
                      (let uu____16639 = FStar_Syntax_Print.bv_to_string bv
                          in
                       let uu____16641 =
                         FStar_Syntax_Print.term_to_string phi'  in
                       FStar_Util.print2 "WPE> QAll [%s] %s\n" uu____16639
                         uu____16641)
                    else ();
                    is_quantified_const bv phi')
               | uu____16646 -> FStar_Pervasives_Native.None  in
             let is_const_match phi =
               let uu____16661 =
                 let uu____16662 = FStar_Syntax_Subst.compress phi  in
                 uu____16662.FStar_Syntax_Syntax.n  in
               match uu____16661 with
               | FStar_Syntax_Syntax.Tm_match (uu____16668,br::brs) ->
                   let uu____16735 = br  in
                   (match uu____16735 with
                    | (uu____16753,uu____16754,e) ->
                        let r =
                          let uu____16776 = simp_t e  in
                          match uu____16776 with
                          | FStar_Pervasives_Native.None  ->
                              FStar_Pervasives_Native.None
                          | FStar_Pervasives_Native.Some b ->
                              let uu____16788 =
                                FStar_List.for_all
                                  (fun uu____16807  ->
                                     match uu____16807 with
                                     | (uu____16821,uu____16822,e') ->
                                         let uu____16836 = simp_t e'  in
                                         uu____16836 =
                                           (FStar_Pervasives_Native.Some b))
                                  brs
                                 in
                              if uu____16788
=======
                                     FStar_Pervasives_Native.Some uu____16805))
                               | uu____16808 -> FStar_Pervasives_Native.None)
                          | uu____16811 -> FStar_Pervasives_Native.None)
                     | uu____16814 -> FStar_Pervasives_Native.None))
               | uu____16817 -> FStar_Pervasives_Native.None  in
             let is_forall_const phi =
               let uu____16830 =
                 FStar_Syntax_Util.destruct_typ_as_formula phi  in
               match uu____16830 with
               | FStar_Pervasives_Native.Some (FStar_Syntax_Util.QAll
                   ((bv,uu____16836)::[],uu____16837,phi')) ->
                   (if
                      (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.wpe
                    then
                      (let uu____16857 = FStar_Syntax_Print.bv_to_string bv
                          in
                       let uu____16859 =
                         FStar_Syntax_Print.term_to_string phi'  in
                       FStar_Util.print2 "WPE> QAll [%s] %s\n" uu____16857
                         uu____16859)
                    else ();
                    is_quantified_const bv phi')
               | uu____16864 -> FStar_Pervasives_Native.None  in
             let is_const_match phi =
               let uu____16879 =
                 let uu____16880 = FStar_Syntax_Subst.compress phi  in
                 uu____16880.FStar_Syntax_Syntax.n  in
               match uu____16879 with
               | FStar_Syntax_Syntax.Tm_match (uu____16886,br::brs) ->
                   let uu____16953 = br  in
                   (match uu____16953 with
                    | (uu____16971,uu____16972,e) ->
                        let r =
                          let uu____16994 = simp_t e  in
                          match uu____16994 with
                          | FStar_Pervasives_Native.None  ->
                              FStar_Pervasives_Native.None
                          | FStar_Pervasives_Native.Some b ->
                              let uu____17006 =
                                FStar_List.for_all
                                  (fun uu____17025  ->
                                     match uu____17025 with
                                     | (uu____17039,uu____17040,e') ->
                                         let uu____17054 = simp_t e'  in
                                         uu____17054 =
                                           (FStar_Pervasives_Native.Some b))
                                  brs
                                 in
                              if uu____17006
>>>>>>> master
                              then FStar_Pervasives_Native.Some b
                              else FStar_Pervasives_Native.None
                           in
                        r)
<<<<<<< HEAD
               | uu____16852 -> FStar_Pervasives_Native.None  in
             let maybe_auto_squash t =
               let uu____16862 = FStar_Syntax_Util.is_sub_singleton t  in
               if uu____16862
=======
               | uu____17070 -> FStar_Pervasives_Native.None  in
             let maybe_auto_squash t =
               let uu____17080 = FStar_Syntax_Util.is_sub_singleton t  in
               if uu____17080
>>>>>>> master
               then t
               else
                 FStar_Syntax_Util.mk_auto_squash FStar_Syntax_Syntax.U_zero
                   t
                in
             let squashed_head_un_auto_squash_args t =
<<<<<<< HEAD
               let maybe_un_auto_squash_arg uu____16900 =
                 match uu____16900 with
                 | (t1,q) ->
                     let uu____16921 = FStar_Syntax_Util.is_auto_squash t1
                        in
                     (match uu____16921 with
                      | FStar_Pervasives_Native.Some
                          (FStar_Syntax_Syntax.U_zero ,t2) -> (t2, q)
                      | uu____16953 -> (t1, q))
                  in
               let uu____16966 = FStar_Syntax_Util.head_and_args t  in
               match uu____16966 with
=======
               let maybe_un_auto_squash_arg uu____17118 =
                 match uu____17118 with
                 | (t1,q) ->
                     let uu____17139 = FStar_Syntax_Util.is_auto_squash t1
                        in
                     (match uu____17139 with
                      | FStar_Pervasives_Native.Some
                          (FStar_Syntax_Syntax.U_zero ,t2) -> (t2, q)
                      | uu____17171 -> (t1, q))
                  in
               let uu____17184 = FStar_Syntax_Util.head_and_args t  in
               match uu____17184 with
>>>>>>> master
               | (head1,args) ->
                   let args1 = FStar_List.map maybe_un_auto_squash_arg args
                      in
                   FStar_Syntax_Syntax.mk_Tm_app head1 args1
                     FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos
                in
             let rec clearly_inhabited ty =
<<<<<<< HEAD
               let uu____17046 =
                 let uu____17047 = FStar_Syntax_Util.unmeta ty  in
                 uu____17047.FStar_Syntax_Syntax.n  in
               match uu____17046 with
               | FStar_Syntax_Syntax.Tm_uinst (t,uu____17052) ->
                   clearly_inhabited t
               | FStar_Syntax_Syntax.Tm_arrow (uu____17057,c) ->
=======
               let uu____17264 =
                 let uu____17265 = FStar_Syntax_Util.unmeta ty  in
                 uu____17265.FStar_Syntax_Syntax.n  in
               match uu____17264 with
               | FStar_Syntax_Syntax.Tm_uinst (t,uu____17270) ->
                   clearly_inhabited t
               | FStar_Syntax_Syntax.Tm_arrow (uu____17275,c) ->
>>>>>>> master
                   clearly_inhabited (FStar_Syntax_Util.comp_result c)
               | FStar_Syntax_Syntax.Tm_fvar fv ->
                   let l = FStar_Syntax_Syntax.lid_of_fv fv  in
                   (((FStar_Ident.lid_equals l FStar_Parser_Const.int_lid) ||
                       (FStar_Ident.lid_equals l FStar_Parser_Const.bool_lid))
                      ||
                      (FStar_Ident.lid_equals l FStar_Parser_Const.string_lid))
                     || (FStar_Ident.lid_equals l FStar_Parser_Const.exn_lid)
<<<<<<< HEAD
               | uu____17081 -> false  in
             let simplify1 arg =
               let uu____17114 = simp_t (FStar_Pervasives_Native.fst arg)  in
               (uu____17114, arg)  in
             let uu____17129 = is_forall_const tm1  in
             match uu____17129 with
=======
               | uu____17299 -> false  in
             let simplify1 arg =
               let uu____17332 = simp_t (FStar_Pervasives_Native.fst arg)  in
               (uu____17332, arg)  in
             let uu____17347 = is_forall_const tm1  in
             match uu____17347 with
>>>>>>> master
             | FStar_Pervasives_Native.Some tm' ->
                 (if
                    (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.wpe
                  then
<<<<<<< HEAD
                    (let uu____17135 = FStar_Syntax_Print.term_to_string tm1
                        in
                     let uu____17137 = FStar_Syntax_Print.term_to_string tm'
                        in
                     FStar_Util.print2 "WPE> %s ~> %s\n" uu____17135
                       uu____17137)
                  else ();
                  (let uu____17142 = norm cfg env [] tm'  in
                   maybe_simplify_aux cfg env stack uu____17142))
             | FStar_Pervasives_Native.None  ->
                 let uu____17143 =
                   let uu____17144 = FStar_Syntax_Subst.compress tm1  in
                   uu____17144.FStar_Syntax_Syntax.n  in
                 (match uu____17143 with
=======
                    (let uu____17353 = FStar_Syntax_Print.term_to_string tm1
                        in
                     let uu____17355 = FStar_Syntax_Print.term_to_string tm'
                        in
                     FStar_Util.print2 "WPE> %s ~> %s\n" uu____17353
                       uu____17355)
                  else ();
                  (let uu____17360 = norm cfg env [] tm'  in
                   maybe_simplify_aux cfg env stack uu____17360))
             | FStar_Pervasives_Native.None  ->
                 let uu____17361 =
                   let uu____17362 = FStar_Syntax_Subst.compress tm1  in
                   uu____17362.FStar_Syntax_Syntax.n  in
                 (match uu____17361 with
>>>>>>> master
                  | FStar_Syntax_Syntax.Tm_app
                      ({
                         FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uinst
                           ({
                              FStar_Syntax_Syntax.n =
                                FStar_Syntax_Syntax.Tm_fvar fv;
<<<<<<< HEAD
                              FStar_Syntax_Syntax.pos = uu____17148;
                              FStar_Syntax_Syntax.vars = uu____17149;_},uu____17150);
                         FStar_Syntax_Syntax.pos = uu____17151;
                         FStar_Syntax_Syntax.vars = uu____17152;_},args)
                      ->
                      let uu____17182 =
                        FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.and_lid
                         in
                      if uu____17182
                      then
                        let uu____17185 =
                          FStar_All.pipe_right args
                            (FStar_List.map simplify1)
                           in
                        (match uu____17185 with
                         | (FStar_Pervasives_Native.Some (true ),uu____17243)::
                             (uu____17244,(arg,uu____17246))::[] ->
                             maybe_auto_squash arg
                         | (uu____17319,(arg,uu____17321))::(FStar_Pervasives_Native.Some
                                                             (true
                                                             ),uu____17322)::[]
                             -> maybe_auto_squash arg
                         | (FStar_Pervasives_Native.Some (false
                            ),uu____17395)::uu____17396::[] ->
                             w FStar_Syntax_Util.t_false
                         | uu____17466::(FStar_Pervasives_Native.Some (false
                                         ),uu____17467)::[]
                             -> w FStar_Syntax_Util.t_false
                         | uu____17537 ->
                             squashed_head_un_auto_squash_args tm1)
                      else
                        (let uu____17555 =
                           FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Parser_Const.or_lid
                            in
                         if uu____17555
                         then
                           let uu____17558 =
                             FStar_All.pipe_right args
                               (FStar_List.map simplify1)
                              in
                           match uu____17558 with
                           | (FStar_Pervasives_Native.Some (true
                              ),uu____17616)::uu____17617::[] ->
                               w FStar_Syntax_Util.t_true
                           | uu____17687::(FStar_Pervasives_Native.Some (true
                                           ),uu____17688)::[]
                               -> w FStar_Syntax_Util.t_true
                           | (FStar_Pervasives_Native.Some (false
                              ),uu____17758)::(uu____17759,(arg,uu____17761))::[]
                               -> maybe_auto_squash arg
                           | (uu____17834,(arg,uu____17836))::(FStar_Pervasives_Native.Some
                                                               (false
                                                               ),uu____17837)::[]
                               -> maybe_auto_squash arg
                           | uu____17910 ->
                               squashed_head_un_auto_squash_args tm1
                         else
                           (let uu____17928 =
                              FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Parser_Const.imp_lid
                               in
                            if uu____17928
                            then
                              let uu____17931 =
                                FStar_All.pipe_right args
                                  (FStar_List.map simplify1)
                                 in
                              match uu____17931 with
                              | uu____17989::(FStar_Pervasives_Native.Some
                                              (true ),uu____17990)::[]
                                  -> w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (false
                                 ),uu____18060)::uu____18061::[] ->
                                  w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (true
                                 ),uu____18131)::(uu____18132,(arg,uu____18134))::[]
                                  -> maybe_auto_squash arg
                              | (uu____18207,(p,uu____18209))::(uu____18210,
                                                                (q,uu____18212))::[]
                                  ->
                                  let uu____18284 =
                                    FStar_Syntax_Util.term_eq p q  in
                                  (if uu____18284
                                   then w FStar_Syntax_Util.t_true
                                   else squashed_head_un_auto_squash_args tm1)
                              | uu____18289 ->
                                  squashed_head_un_auto_squash_args tm1
                            else
                              (let uu____18307 =
                                 FStar_Syntax_Syntax.fv_eq_lid fv
                                   FStar_Parser_Const.iff_lid
                                  in
                               if uu____18307
                               then
                                 let uu____18310 =
                                   FStar_All.pipe_right args
                                     (FStar_List.map simplify1)
                                    in
                                 match uu____18310 with
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____18368)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____18369)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____18443)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____18444)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____18518)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____18519)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____18593)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____18594)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (uu____18668,(arg,uu____18670))::(FStar_Pervasives_Native.Some
                                                                    (true
                                                                    ),uu____18671)::[]
                                     -> maybe_auto_squash arg
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____18744)::(uu____18745,(arg,uu____18747))::[]
                                     -> maybe_auto_squash arg
                                 | (uu____18820,(arg,uu____18822))::(FStar_Pervasives_Native.Some
                                                                    (false
                                                                    ),uu____18823)::[]
                                     ->
                                     let uu____18896 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____18896
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____18897)::(uu____18898,(arg,uu____18900))::[]
                                     ->
                                     let uu____18973 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____18973
                                 | (uu____18974,(p,uu____18976))::(uu____18977,
                                                                   (q,uu____18979))::[]
                                     ->
                                     let uu____19051 =
                                       FStar_Syntax_Util.term_eq p q  in
                                     (if uu____19051
                                      then w FStar_Syntax_Util.t_true
                                      else
                                        squashed_head_un_auto_squash_args tm1)
                                 | uu____19056 ->
                                     squashed_head_un_auto_squash_args tm1
                               else
                                 (let uu____19074 =
                                    FStar_Syntax_Syntax.fv_eq_lid fv
                                      FStar_Parser_Const.not_lid
                                     in
                                  if uu____19074
                                  then
                                    let uu____19077 =
                                      FStar_All.pipe_right args
                                        (FStar_List.map simplify1)
                                       in
                                    match uu____19077 with
                                    | (FStar_Pervasives_Native.Some (true
                                       ),uu____19135)::[] ->
                                        w FStar_Syntax_Util.t_false
                                    | (FStar_Pervasives_Native.Some (false
                                       ),uu____19179)::[] ->
                                        w FStar_Syntax_Util.t_true
                                    | uu____19223 ->
                                        squashed_head_un_auto_squash_args tm1
                                  else
                                    (let uu____19241 =
                                       FStar_Syntax_Syntax.fv_eq_lid fv
                                         FStar_Parser_Const.forall_lid
                                        in
                                     if uu____19241
                                     then
                                       match args with
                                       | (t,uu____19245)::[] ->
                                           let uu____19270 =
                                             let uu____19271 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____19271.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____19270 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____19274::[],body,uu____19276)
                                                ->
                                                let uu____19311 = simp_t body
                                                   in
                                                (match uu____19311 with
=======
                              FStar_Syntax_Syntax.pos = uu____17366;
                              FStar_Syntax_Syntax.vars = uu____17367;_},uu____17368);
                         FStar_Syntax_Syntax.pos = uu____17369;
                         FStar_Syntax_Syntax.vars = uu____17370;_},args)
                      ->
                      let uu____17400 =
                        FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.and_lid
                         in
                      if uu____17400
                      then
                        let uu____17403 =
                          FStar_All.pipe_right args
                            (FStar_List.map simplify1)
                           in
                        (match uu____17403 with
                         | (FStar_Pervasives_Native.Some (true ),uu____17461)::
                             (uu____17462,(arg,uu____17464))::[] ->
                             maybe_auto_squash arg
                         | (uu____17537,(arg,uu____17539))::(FStar_Pervasives_Native.Some
                                                             (true
                                                             ),uu____17540)::[]
                             -> maybe_auto_squash arg
                         | (FStar_Pervasives_Native.Some (false
                            ),uu____17613)::uu____17614::[] ->
                             w FStar_Syntax_Util.t_false
                         | uu____17684::(FStar_Pervasives_Native.Some (false
                                         ),uu____17685)::[]
                             -> w FStar_Syntax_Util.t_false
                         | uu____17755 ->
                             squashed_head_un_auto_squash_args tm1)
                      else
                        (let uu____17773 =
                           FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Parser_Const.or_lid
                            in
                         if uu____17773
                         then
                           let uu____17776 =
                             FStar_All.pipe_right args
                               (FStar_List.map simplify1)
                              in
                           match uu____17776 with
                           | (FStar_Pervasives_Native.Some (true
                              ),uu____17834)::uu____17835::[] ->
                               w FStar_Syntax_Util.t_true
                           | uu____17905::(FStar_Pervasives_Native.Some (true
                                           ),uu____17906)::[]
                               -> w FStar_Syntax_Util.t_true
                           | (FStar_Pervasives_Native.Some (false
                              ),uu____17976)::(uu____17977,(arg,uu____17979))::[]
                               -> maybe_auto_squash arg
                           | (uu____18052,(arg,uu____18054))::(FStar_Pervasives_Native.Some
                                                               (false
                                                               ),uu____18055)::[]
                               -> maybe_auto_squash arg
                           | uu____18128 ->
                               squashed_head_un_auto_squash_args tm1
                         else
                           (let uu____18146 =
                              FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Parser_Const.imp_lid
                               in
                            if uu____18146
                            then
                              let uu____18149 =
                                FStar_All.pipe_right args
                                  (FStar_List.map simplify1)
                                 in
                              match uu____18149 with
                              | uu____18207::(FStar_Pervasives_Native.Some
                                              (true ),uu____18208)::[]
                                  -> w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (false
                                 ),uu____18278)::uu____18279::[] ->
                                  w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (true
                                 ),uu____18349)::(uu____18350,(arg,uu____18352))::[]
                                  -> maybe_auto_squash arg
                              | (uu____18425,(p,uu____18427))::(uu____18428,
                                                                (q,uu____18430))::[]
                                  ->
                                  let uu____18502 =
                                    FStar_Syntax_Util.term_eq p q  in
                                  (if uu____18502
                                   then w FStar_Syntax_Util.t_true
                                   else squashed_head_un_auto_squash_args tm1)
                              | uu____18507 ->
                                  squashed_head_un_auto_squash_args tm1
                            else
                              (let uu____18525 =
                                 FStar_Syntax_Syntax.fv_eq_lid fv
                                   FStar_Parser_Const.iff_lid
                                  in
                               if uu____18525
                               then
                                 let uu____18528 =
                                   FStar_All.pipe_right args
                                     (FStar_List.map simplify1)
                                    in
                                 match uu____18528 with
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____18586)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____18587)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____18661)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____18662)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____18736)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____18737)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____18811)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____18812)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (uu____18886,(arg,uu____18888))::(FStar_Pervasives_Native.Some
                                                                    (true
                                                                    ),uu____18889)::[]
                                     -> maybe_auto_squash arg
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____18962)::(uu____18963,(arg,uu____18965))::[]
                                     -> maybe_auto_squash arg
                                 | (uu____19038,(arg,uu____19040))::(FStar_Pervasives_Native.Some
                                                                    (false
                                                                    ),uu____19041)::[]
                                     ->
                                     let uu____19114 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____19114
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____19115)::(uu____19116,(arg,uu____19118))::[]
                                     ->
                                     let uu____19191 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____19191
                                 | (uu____19192,(p,uu____19194))::(uu____19195,
                                                                   (q,uu____19197))::[]
                                     ->
                                     let uu____19269 =
                                       FStar_Syntax_Util.term_eq p q  in
                                     (if uu____19269
                                      then w FStar_Syntax_Util.t_true
                                      else
                                        squashed_head_un_auto_squash_args tm1)
                                 | uu____19274 ->
                                     squashed_head_un_auto_squash_args tm1
                               else
                                 (let uu____19292 =
                                    FStar_Syntax_Syntax.fv_eq_lid fv
                                      FStar_Parser_Const.not_lid
                                     in
                                  if uu____19292
                                  then
                                    let uu____19295 =
                                      FStar_All.pipe_right args
                                        (FStar_List.map simplify1)
                                       in
                                    match uu____19295 with
                                    | (FStar_Pervasives_Native.Some (true
                                       ),uu____19353)::[] ->
                                        w FStar_Syntax_Util.t_false
                                    | (FStar_Pervasives_Native.Some (false
                                       ),uu____19397)::[] ->
                                        w FStar_Syntax_Util.t_true
                                    | uu____19441 ->
                                        squashed_head_un_auto_squash_args tm1
                                  else
                                    (let uu____19459 =
                                       FStar_Syntax_Syntax.fv_eq_lid fv
                                         FStar_Parser_Const.forall_lid
                                        in
                                     if uu____19459
                                     then
                                       match args with
                                       | (t,uu____19463)::[] ->
                                           let uu____19488 =
                                             let uu____19489 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____19489.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____19488 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____19492::[],body,uu____19494)
                                                ->
                                                let uu____19529 = simp_t body
                                                   in
                                                (match uu____19529 with
>>>>>>> master
                                                 | FStar_Pervasives_Native.Some
                                                     (true ) ->
                                                     w
                                                       FStar_Syntax_Util.t_true
<<<<<<< HEAD
                                                 | uu____19317 -> tm1)
                                            | uu____19321 -> tm1)
                                       | (ty,FStar_Pervasives_Native.Some
                                          (FStar_Syntax_Syntax.Implicit
                                          uu____19323))::(t,uu____19325)::[]
                                           ->
                                           let uu____19365 =
                                             let uu____19366 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____19366.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____19365 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____19369::[],body,uu____19371)
                                                ->
                                                let uu____19406 = simp_t body
                                                   in
                                                (match uu____19406 with
=======
                                                 | uu____19535 -> tm1)
                                            | uu____19539 -> tm1)
                                       | (ty,FStar_Pervasives_Native.Some
                                          (FStar_Syntax_Syntax.Implicit
                                          uu____19541))::(t,uu____19543)::[]
                                           ->
                                           let uu____19583 =
                                             let uu____19584 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____19584.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____19583 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____19587::[],body,uu____19589)
                                                ->
                                                let uu____19624 = simp_t body
                                                   in
                                                (match uu____19624 with
>>>>>>> master
                                                 | FStar_Pervasives_Native.Some
                                                     (true ) ->
                                                     w
                                                       FStar_Syntax_Util.t_true
                                                 | FStar_Pervasives_Native.Some
                                                     (false ) when
                                                     clearly_inhabited ty ->
                                                     w
                                                       FStar_Syntax_Util.t_false
<<<<<<< HEAD
                                                 | uu____19414 -> tm1)
                                            | uu____19418 -> tm1)
                                       | uu____19419 -> tm1
                                     else
                                       (let uu____19432 =
                                          FStar_Syntax_Syntax.fv_eq_lid fv
                                            FStar_Parser_Const.exists_lid
                                           in
                                        if uu____19432
                                        then
                                          match args with
                                          | (t,uu____19436)::[] ->
                                              let uu____19461 =
                                                let uu____19462 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____19462.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____19461 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____19465::[],body,uu____19467)
                                                   ->
                                                   let uu____19502 =
                                                     simp_t body  in
                                                   (match uu____19502 with
=======
                                                 | uu____19632 -> tm1)
                                            | uu____19636 -> tm1)
                                       | uu____19637 -> tm1
                                     else
                                       (let uu____19650 =
                                          FStar_Syntax_Syntax.fv_eq_lid fv
                                            FStar_Parser_Const.exists_lid
                                           in
                                        if uu____19650
                                        then
                                          match args with
                                          | (t,uu____19654)::[] ->
                                              let uu____19679 =
                                                let uu____19680 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____19680.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____19679 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____19683::[],body,uu____19685)
                                                   ->
                                                   let uu____19720 =
                                                     simp_t body  in
                                                   (match uu____19720 with
>>>>>>> master
                                                    | FStar_Pervasives_Native.Some
                                                        (false ) ->
                                                        w
                                                          FStar_Syntax_Util.t_false
<<<<<<< HEAD
                                                    | uu____19508 -> tm1)
                                               | uu____19512 -> tm1)
                                          | (ty,FStar_Pervasives_Native.Some
                                             (FStar_Syntax_Syntax.Implicit
                                             uu____19514))::(t,uu____19516)::[]
                                              ->
                                              let uu____19556 =
                                                let uu____19557 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____19557.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____19556 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____19560::[],body,uu____19562)
                                                   ->
                                                   let uu____19597 =
                                                     simp_t body  in
                                                   (match uu____19597 with
=======
                                                    | uu____19726 -> tm1)
                                               | uu____19730 -> tm1)
                                          | (ty,FStar_Pervasives_Native.Some
                                             (FStar_Syntax_Syntax.Implicit
                                             uu____19732))::(t,uu____19734)::[]
                                              ->
                                              let uu____19774 =
                                                let uu____19775 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____19775.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____19774 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____19778::[],body,uu____19780)
                                                   ->
                                                   let uu____19815 =
                                                     simp_t body  in
                                                   (match uu____19815 with
>>>>>>> master
                                                    | FStar_Pervasives_Native.Some
                                                        (false ) ->
                                                        w
                                                          FStar_Syntax_Util.t_false
                                                    | FStar_Pervasives_Native.Some
                                                        (true ) when
                                                        clearly_inhabited ty
                                                        ->
                                                        w
                                                          FStar_Syntax_Util.t_true
<<<<<<< HEAD
                                                    | uu____19605 -> tm1)
                                               | uu____19609 -> tm1)
                                          | uu____19610 -> tm1
                                        else
                                          (let uu____19623 =
                                             FStar_Syntax_Syntax.fv_eq_lid fv
                                               FStar_Parser_Const.b2t_lid
                                              in
                                           if uu____19623
=======
                                                    | uu____19823 -> tm1)
                                               | uu____19827 -> tm1)
                                          | uu____19828 -> tm1
                                        else
                                          (let uu____19841 =
                                             FStar_Syntax_Syntax.fv_eq_lid fv
                                               FStar_Parser_Const.b2t_lid
                                              in
                                           if uu____19841
>>>>>>> master
                                           then
                                             match args with
                                             | ({
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_constant
                                                    (FStar_Const.Const_bool
                                                    (true ));
                                                  FStar_Syntax_Syntax.pos =
<<<<<<< HEAD
                                                    uu____19626;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____19627;_},uu____19628)::[]
=======
                                                    uu____19844;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____19845;_},uu____19846)::[]
>>>>>>> master
                                                 ->
                                                 w FStar_Syntax_Util.t_true
                                             | ({
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_constant
                                                    (FStar_Const.Const_bool
                                                    (false ));
                                                  FStar_Syntax_Syntax.pos =
<<<<<<< HEAD
                                                    uu____19654;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____19655;_},uu____19656)::[]
                                                 ->
                                                 w FStar_Syntax_Util.t_false
                                             | uu____19682 -> tm1
                                           else
                                             (let uu____19695 =
=======
                                                    uu____19872;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____19873;_},uu____19874)::[]
                                                 ->
                                                 w FStar_Syntax_Util.t_false
                                             | uu____19900 -> tm1
                                           else
                                             (let uu____19913 =
>>>>>>> master
                                                FStar_Syntax_Syntax.fv_eq_lid
                                                  fv
                                                  FStar_Parser_Const.haseq_lid
                                                 in
<<<<<<< HEAD
                                              if uu____19695
=======
                                              if uu____19913
>>>>>>> master
                                              then
                                                let t_has_eq_for_sure t =
                                                  let haseq_lids =
                                                    [FStar_Parser_Const.int_lid;
                                                    FStar_Parser_Const.bool_lid;
                                                    FStar_Parser_Const.unit_lid;
                                                    FStar_Parser_Const.string_lid]
                                                     in
<<<<<<< HEAD
                                                  let uu____19709 =
                                                    let uu____19710 =
                                                      FStar_Syntax_Subst.compress
                                                        t
                                                       in
                                                    uu____19710.FStar_Syntax_Syntax.n
                                                     in
                                                  match uu____19709 with
=======
                                                  let uu____19927 =
                                                    let uu____19928 =
                                                      FStar_Syntax_Subst.compress
                                                        t
                                                       in
                                                    uu____19928.FStar_Syntax_Syntax.n
                                                     in
                                                  match uu____19927 with
>>>>>>> master
                                                  | FStar_Syntax_Syntax.Tm_fvar
                                                      fv1 when
                                                      FStar_All.pipe_right
                                                        haseq_lids
                                                        (FStar_List.existsb
                                                           (fun l  ->
                                                              FStar_Syntax_Syntax.fv_eq_lid
                                                                fv1 l))
                                                      -> true
<<<<<<< HEAD
                                                  | uu____19721 -> false  in
=======
                                                  | uu____19939 -> false  in
>>>>>>> master
                                                (if
                                                   (FStar_List.length args) =
                                                     (Prims.parse_int "1")
                                                 then
                                                   let t =
<<<<<<< HEAD
                                                     let uu____19735 =
=======
                                                     let uu____19953 =
>>>>>>> master
                                                       FStar_All.pipe_right
                                                         args FStar_List.hd
                                                        in
                                                     FStar_All.pipe_right
<<<<<<< HEAD
                                                       uu____19735
                                                       FStar_Pervasives_Native.fst
                                                      in
                                                   let uu____19774 =
                                                     FStar_All.pipe_right t
                                                       t_has_eq_for_sure
                                                      in
                                                   (if uu____19774
=======
                                                       uu____19953
                                                       FStar_Pervasives_Native.fst
                                                      in
                                                   let uu____19992 =
                                                     FStar_All.pipe_right t
                                                       t_has_eq_for_sure
                                                      in
                                                   (if uu____19992
>>>>>>> master
                                                    then
                                                      w
                                                        FStar_Syntax_Util.t_true
                                                    else
<<<<<<< HEAD
                                                      (let uu____19780 =
                                                         let uu____19781 =
                                                           FStar_Syntax_Subst.compress
                                                             t
                                                            in
                                                         uu____19781.FStar_Syntax_Syntax.n
                                                          in
                                                       match uu____19780 with
                                                       | FStar_Syntax_Syntax.Tm_refine
                                                           uu____19784 ->
=======
                                                      (let uu____19998 =
                                                         let uu____19999 =
                                                           FStar_Syntax_Subst.compress
                                                             t
                                                            in
                                                         uu____19999.FStar_Syntax_Syntax.n
                                                          in
                                                       match uu____19998 with
                                                       | FStar_Syntax_Syntax.Tm_refine
                                                           uu____20002 ->
>>>>>>> master
                                                           let t1 =
                                                             FStar_Syntax_Util.unrefine
                                                               t
                                                              in
<<<<<<< HEAD
                                                           let uu____19792 =
=======
                                                           let uu____20010 =
>>>>>>> master
                                                             FStar_All.pipe_right
                                                               t1
                                                               t_has_eq_for_sure
                                                              in
<<<<<<< HEAD
                                                           if uu____19792
=======
                                                           if uu____20010
>>>>>>> master
                                                           then
                                                             w
                                                               FStar_Syntax_Util.t_true
                                                           else
                                                             (let haseq_tm =
<<<<<<< HEAD
                                                                let uu____19801
                                                                  =
                                                                  let uu____19802
                                                                    =
                                                                    FStar_Syntax_Subst.compress
                                                                    tm1  in
                                                                  uu____19802.FStar_Syntax_Syntax.n
                                                                   in
                                                                match uu____19801
                                                                with
                                                                | FStar_Syntax_Syntax.Tm_app
                                                                    (hd1,uu____19808)
                                                                    -> hd1
                                                                | uu____19833
=======
                                                                let uu____20019
                                                                  =
                                                                  let uu____20020
                                                                    =
                                                                    FStar_Syntax_Subst.compress
                                                                    tm1  in
                                                                  uu____20020.FStar_Syntax_Syntax.n
                                                                   in
                                                                match uu____20019
                                                                with
                                                                | FStar_Syntax_Syntax.Tm_app
                                                                    (hd1,uu____20026)
                                                                    -> hd1
                                                                | uu____20051
>>>>>>> master
                                                                    ->
                                                                    failwith
                                                                    "Impossible! We have already checked that this is a Tm_app"
                                                                 in
<<<<<<< HEAD
                                                              let uu____19837
                                                                =
                                                                let uu____19848
=======
                                                              let uu____20055
                                                                =
                                                                let uu____20066
>>>>>>> master
                                                                  =
                                                                  FStar_All.pipe_right
                                                                    t1
                                                                    FStar_Syntax_Syntax.as_arg
                                                                   in
<<<<<<< HEAD
                                                                [uu____19848]
                                                                 in
                                                              FStar_Syntax_Util.mk_app
                                                                haseq_tm
                                                                uu____19837)
                                                       | uu____19881 -> tm1))
                                                 else tm1)
                                              else
                                                (let uu____19886 =
                                                   FStar_Syntax_Util.is_auto_squash
                                                     tm1
                                                    in
                                                 match uu____19886 with
=======
                                                                [uu____20066]
                                                                 in
                                                              FStar_Syntax_Util.mk_app
                                                                haseq_tm
                                                                uu____20055)
                                                       | uu____20099 -> tm1))
                                                 else tm1)
                                              else
                                                (let uu____20104 =
                                                   FStar_Syntax_Util.is_auto_squash
                                                     tm1
                                                    in
                                                 match uu____20104 with
>>>>>>> master
                                                 | FStar_Pervasives_Native.Some
                                                     (FStar_Syntax_Syntax.U_zero
                                                      ,t)
                                                     when
                                                     FStar_Syntax_Util.is_sub_singleton
                                                       t
                                                     -> t
<<<<<<< HEAD
                                                 | uu____19906 ->
                                                     let uu____19915 =
                                                       let uu____19922 =
                                                         norm_cb cfg  in
                                                       reduce_equality
                                                         uu____19922 cfg env
                                                        in
                                                     uu____19915 tm1)))))))))
=======
                                                 | uu____20124 ->
                                                     let uu____20133 =
                                                       let uu____20140 =
                                                         norm_cb cfg  in
                                                       reduce_equality
                                                         uu____20140 cfg env
                                                        in
                                                     uu____20133 tm1)))))))))
>>>>>>> master
                  | FStar_Syntax_Syntax.Tm_app
                      ({
                         FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar
                           fv;
<<<<<<< HEAD
                         FStar_Syntax_Syntax.pos = uu____19928;
                         FStar_Syntax_Syntax.vars = uu____19929;_},args)
                      ->
                      let uu____19955 =
                        FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.and_lid
                         in
                      if uu____19955
                      then
                        let uu____19958 =
                          FStar_All.pipe_right args
                            (FStar_List.map simplify1)
                           in
                        (match uu____19958 with
                         | (FStar_Pervasives_Native.Some (true ),uu____20016)::
                             (uu____20017,(arg,uu____20019))::[] ->
                             maybe_auto_squash arg
                         | (uu____20092,(arg,uu____20094))::(FStar_Pervasives_Native.Some
                                                             (true
                                                             ),uu____20095)::[]
                             -> maybe_auto_squash arg
                         | (FStar_Pervasives_Native.Some (false
                            ),uu____20168)::uu____20169::[] ->
                             w FStar_Syntax_Util.t_false
                         | uu____20239::(FStar_Pervasives_Native.Some (false
                                         ),uu____20240)::[]
                             -> w FStar_Syntax_Util.t_false
                         | uu____20310 ->
                             squashed_head_un_auto_squash_args tm1)
                      else
                        (let uu____20328 =
                           FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Parser_Const.or_lid
                            in
                         if uu____20328
                         then
                           let uu____20331 =
                             FStar_All.pipe_right args
                               (FStar_List.map simplify1)
                              in
                           match uu____20331 with
                           | (FStar_Pervasives_Native.Some (true
                              ),uu____20389)::uu____20390::[] ->
                               w FStar_Syntax_Util.t_true
                           | uu____20460::(FStar_Pervasives_Native.Some (true
                                           ),uu____20461)::[]
                               -> w FStar_Syntax_Util.t_true
                           | (FStar_Pervasives_Native.Some (false
                              ),uu____20531)::(uu____20532,(arg,uu____20534))::[]
                               -> maybe_auto_squash arg
                           | (uu____20607,(arg,uu____20609))::(FStar_Pervasives_Native.Some
                                                               (false
                                                               ),uu____20610)::[]
                               -> maybe_auto_squash arg
                           | uu____20683 ->
                               squashed_head_un_auto_squash_args tm1
                         else
                           (let uu____20701 =
                              FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Parser_Const.imp_lid
                               in
                            if uu____20701
                            then
                              let uu____20704 =
                                FStar_All.pipe_right args
                                  (FStar_List.map simplify1)
                                 in
                              match uu____20704 with
                              | uu____20762::(FStar_Pervasives_Native.Some
                                              (true ),uu____20763)::[]
                                  -> w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (false
                                 ),uu____20833)::uu____20834::[] ->
                                  w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (true
                                 ),uu____20904)::(uu____20905,(arg,uu____20907))::[]
                                  -> maybe_auto_squash arg
                              | (uu____20980,(p,uu____20982))::(uu____20983,
                                                                (q,uu____20985))::[]
                                  ->
                                  let uu____21057 =
                                    FStar_Syntax_Util.term_eq p q  in
                                  (if uu____21057
                                   then w FStar_Syntax_Util.t_true
                                   else squashed_head_un_auto_squash_args tm1)
                              | uu____21062 ->
                                  squashed_head_un_auto_squash_args tm1
                            else
                              (let uu____21080 =
                                 FStar_Syntax_Syntax.fv_eq_lid fv
                                   FStar_Parser_Const.iff_lid
                                  in
                               if uu____21080
                               then
                                 let uu____21083 =
                                   FStar_All.pipe_right args
                                     (FStar_List.map simplify1)
                                    in
                                 match uu____21083 with
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____21141)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____21142)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____21216)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____21217)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____21291)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____21292)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____21366)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____21367)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (uu____21441,(arg,uu____21443))::(FStar_Pervasives_Native.Some
                                                                    (true
                                                                    ),uu____21444)::[]
                                     -> maybe_auto_squash arg
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____21517)::(uu____21518,(arg,uu____21520))::[]
                                     -> maybe_auto_squash arg
                                 | (uu____21593,(arg,uu____21595))::(FStar_Pervasives_Native.Some
                                                                    (false
                                                                    ),uu____21596)::[]
                                     ->
                                     let uu____21669 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____21669
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____21670)::(uu____21671,(arg,uu____21673))::[]
                                     ->
                                     let uu____21746 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____21746
                                 | (uu____21747,(p,uu____21749))::(uu____21750,
                                                                   (q,uu____21752))::[]
                                     ->
                                     let uu____21824 =
                                       FStar_Syntax_Util.term_eq p q  in
                                     (if uu____21824
                                      then w FStar_Syntax_Util.t_true
                                      else
                                        squashed_head_un_auto_squash_args tm1)
                                 | uu____21829 ->
                                     squashed_head_un_auto_squash_args tm1
                               else
                                 (let uu____21847 =
                                    FStar_Syntax_Syntax.fv_eq_lid fv
                                      FStar_Parser_Const.not_lid
                                     in
                                  if uu____21847
                                  then
                                    let uu____21850 =
                                      FStar_All.pipe_right args
                                        (FStar_List.map simplify1)
                                       in
                                    match uu____21850 with
                                    | (FStar_Pervasives_Native.Some (true
                                       ),uu____21908)::[] ->
                                        w FStar_Syntax_Util.t_false
                                    | (FStar_Pervasives_Native.Some (false
                                       ),uu____21952)::[] ->
                                        w FStar_Syntax_Util.t_true
                                    | uu____21996 ->
                                        squashed_head_un_auto_squash_args tm1
                                  else
                                    (let uu____22014 =
                                       FStar_Syntax_Syntax.fv_eq_lid fv
                                         FStar_Parser_Const.forall_lid
                                        in
                                     if uu____22014
                                     then
                                       match args with
                                       | (t,uu____22018)::[] ->
                                           let uu____22043 =
                                             let uu____22044 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____22044.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____22043 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____22047::[],body,uu____22049)
                                                ->
                                                let uu____22084 = simp_t body
                                                   in
                                                (match uu____22084 with
=======
                         FStar_Syntax_Syntax.pos = uu____20146;
                         FStar_Syntax_Syntax.vars = uu____20147;_},args)
                      ->
                      let uu____20173 =
                        FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Parser_Const.and_lid
                         in
                      if uu____20173
                      then
                        let uu____20176 =
                          FStar_All.pipe_right args
                            (FStar_List.map simplify1)
                           in
                        (match uu____20176 with
                         | (FStar_Pervasives_Native.Some (true ),uu____20234)::
                             (uu____20235,(arg,uu____20237))::[] ->
                             maybe_auto_squash arg
                         | (uu____20310,(arg,uu____20312))::(FStar_Pervasives_Native.Some
                                                             (true
                                                             ),uu____20313)::[]
                             -> maybe_auto_squash arg
                         | (FStar_Pervasives_Native.Some (false
                            ),uu____20386)::uu____20387::[] ->
                             w FStar_Syntax_Util.t_false
                         | uu____20457::(FStar_Pervasives_Native.Some (false
                                         ),uu____20458)::[]
                             -> w FStar_Syntax_Util.t_false
                         | uu____20528 ->
                             squashed_head_un_auto_squash_args tm1)
                      else
                        (let uu____20546 =
                           FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Parser_Const.or_lid
                            in
                         if uu____20546
                         then
                           let uu____20549 =
                             FStar_All.pipe_right args
                               (FStar_List.map simplify1)
                              in
                           match uu____20549 with
                           | (FStar_Pervasives_Native.Some (true
                              ),uu____20607)::uu____20608::[] ->
                               w FStar_Syntax_Util.t_true
                           | uu____20678::(FStar_Pervasives_Native.Some (true
                                           ),uu____20679)::[]
                               -> w FStar_Syntax_Util.t_true
                           | (FStar_Pervasives_Native.Some (false
                              ),uu____20749)::(uu____20750,(arg,uu____20752))::[]
                               -> maybe_auto_squash arg
                           | (uu____20825,(arg,uu____20827))::(FStar_Pervasives_Native.Some
                                                               (false
                                                               ),uu____20828)::[]
                               -> maybe_auto_squash arg
                           | uu____20901 ->
                               squashed_head_un_auto_squash_args tm1
                         else
                           (let uu____20919 =
                              FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Parser_Const.imp_lid
                               in
                            if uu____20919
                            then
                              let uu____20922 =
                                FStar_All.pipe_right args
                                  (FStar_List.map simplify1)
                                 in
                              match uu____20922 with
                              | uu____20980::(FStar_Pervasives_Native.Some
                                              (true ),uu____20981)::[]
                                  -> w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (false
                                 ),uu____21051)::uu____21052::[] ->
                                  w FStar_Syntax_Util.t_true
                              | (FStar_Pervasives_Native.Some (true
                                 ),uu____21122)::(uu____21123,(arg,uu____21125))::[]
                                  -> maybe_auto_squash arg
                              | (uu____21198,(p,uu____21200))::(uu____21201,
                                                                (q,uu____21203))::[]
                                  ->
                                  let uu____21275 =
                                    FStar_Syntax_Util.term_eq p q  in
                                  (if uu____21275
                                   then w FStar_Syntax_Util.t_true
                                   else squashed_head_un_auto_squash_args tm1)
                              | uu____21280 ->
                                  squashed_head_un_auto_squash_args tm1
                            else
                              (let uu____21298 =
                                 FStar_Syntax_Syntax.fv_eq_lid fv
                                   FStar_Parser_Const.iff_lid
                                  in
                               if uu____21298
                               then
                                 let uu____21301 =
                                   FStar_All.pipe_right args
                                     (FStar_List.map simplify1)
                                    in
                                 match uu____21301 with
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____21359)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____21360)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____21434)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____21435)::[]
                                     -> w FStar_Syntax_Util.t_true
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____21509)::(FStar_Pervasives_Native.Some
                                                     (false ),uu____21510)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____21584)::(FStar_Pervasives_Native.Some
                                                     (true ),uu____21585)::[]
                                     -> w FStar_Syntax_Util.t_false
                                 | (uu____21659,(arg,uu____21661))::(FStar_Pervasives_Native.Some
                                                                    (true
                                                                    ),uu____21662)::[]
                                     -> maybe_auto_squash arg
                                 | (FStar_Pervasives_Native.Some (true
                                    ),uu____21735)::(uu____21736,(arg,uu____21738))::[]
                                     -> maybe_auto_squash arg
                                 | (uu____21811,(arg,uu____21813))::(FStar_Pervasives_Native.Some
                                                                    (false
                                                                    ),uu____21814)::[]
                                     ->
                                     let uu____21887 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____21887
                                 | (FStar_Pervasives_Native.Some (false
                                    ),uu____21888)::(uu____21889,(arg,uu____21891))::[]
                                     ->
                                     let uu____21964 =
                                       FStar_Syntax_Util.mk_neg arg  in
                                     maybe_auto_squash uu____21964
                                 | (uu____21965,(p,uu____21967))::(uu____21968,
                                                                   (q,uu____21970))::[]
                                     ->
                                     let uu____22042 =
                                       FStar_Syntax_Util.term_eq p q  in
                                     (if uu____22042
                                      then w FStar_Syntax_Util.t_true
                                      else
                                        squashed_head_un_auto_squash_args tm1)
                                 | uu____22047 ->
                                     squashed_head_un_auto_squash_args tm1
                               else
                                 (let uu____22065 =
                                    FStar_Syntax_Syntax.fv_eq_lid fv
                                      FStar_Parser_Const.not_lid
                                     in
                                  if uu____22065
                                  then
                                    let uu____22068 =
                                      FStar_All.pipe_right args
                                        (FStar_List.map simplify1)
                                       in
                                    match uu____22068 with
                                    | (FStar_Pervasives_Native.Some (true
                                       ),uu____22126)::[] ->
                                        w FStar_Syntax_Util.t_false
                                    | (FStar_Pervasives_Native.Some (false
                                       ),uu____22170)::[] ->
                                        w FStar_Syntax_Util.t_true
                                    | uu____22214 ->
                                        squashed_head_un_auto_squash_args tm1
                                  else
                                    (let uu____22232 =
                                       FStar_Syntax_Syntax.fv_eq_lid fv
                                         FStar_Parser_Const.forall_lid
                                        in
                                     if uu____22232
                                     then
                                       match args with
                                       | (t,uu____22236)::[] ->
                                           let uu____22261 =
                                             let uu____22262 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____22262.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____22261 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____22265::[],body,uu____22267)
                                                ->
                                                let uu____22302 = simp_t body
                                                   in
                                                (match uu____22302 with
>>>>>>> master
                                                 | FStar_Pervasives_Native.Some
                                                     (true ) ->
                                                     w
                                                       FStar_Syntax_Util.t_true
<<<<<<< HEAD
                                                 | uu____22090 -> tm1)
                                            | uu____22094 -> tm1)
                                       | (ty,FStar_Pervasives_Native.Some
                                          (FStar_Syntax_Syntax.Implicit
                                          uu____22096))::(t,uu____22098)::[]
                                           ->
                                           let uu____22138 =
                                             let uu____22139 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____22139.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____22138 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____22142::[],body,uu____22144)
                                                ->
                                                let uu____22179 = simp_t body
                                                   in
                                                (match uu____22179 with
=======
                                                 | uu____22308 -> tm1)
                                            | uu____22312 -> tm1)
                                       | (ty,FStar_Pervasives_Native.Some
                                          (FStar_Syntax_Syntax.Implicit
                                          uu____22314))::(t,uu____22316)::[]
                                           ->
                                           let uu____22356 =
                                             let uu____22357 =
                                               FStar_Syntax_Subst.compress t
                                                in
                                             uu____22357.FStar_Syntax_Syntax.n
                                              in
                                           (match uu____22356 with
                                            | FStar_Syntax_Syntax.Tm_abs
                                                (uu____22360::[],body,uu____22362)
                                                ->
                                                let uu____22397 = simp_t body
                                                   in
                                                (match uu____22397 with
>>>>>>> master
                                                 | FStar_Pervasives_Native.Some
                                                     (true ) ->
                                                     w
                                                       FStar_Syntax_Util.t_true
                                                 | FStar_Pervasives_Native.Some
                                                     (false ) when
                                                     clearly_inhabited ty ->
                                                     w
                                                       FStar_Syntax_Util.t_false
<<<<<<< HEAD
                                                 | uu____22187 -> tm1)
                                            | uu____22191 -> tm1)
                                       | uu____22192 -> tm1
                                     else
                                       (let uu____22205 =
                                          FStar_Syntax_Syntax.fv_eq_lid fv
                                            FStar_Parser_Const.exists_lid
                                           in
                                        if uu____22205
                                        then
                                          match args with
                                          | (t,uu____22209)::[] ->
                                              let uu____22234 =
                                                let uu____22235 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____22235.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____22234 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____22238::[],body,uu____22240)
                                                   ->
                                                   let uu____22275 =
                                                     simp_t body  in
                                                   (match uu____22275 with
=======
                                                 | uu____22405 -> tm1)
                                            | uu____22409 -> tm1)
                                       | uu____22410 -> tm1
                                     else
                                       (let uu____22423 =
                                          FStar_Syntax_Syntax.fv_eq_lid fv
                                            FStar_Parser_Const.exists_lid
                                           in
                                        if uu____22423
                                        then
                                          match args with
                                          | (t,uu____22427)::[] ->
                                              let uu____22452 =
                                                let uu____22453 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____22453.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____22452 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____22456::[],body,uu____22458)
                                                   ->
                                                   let uu____22493 =
                                                     simp_t body  in
                                                   (match uu____22493 with
>>>>>>> master
                                                    | FStar_Pervasives_Native.Some
                                                        (false ) ->
                                                        w
                                                          FStar_Syntax_Util.t_false
<<<<<<< HEAD
                                                    | uu____22281 -> tm1)
                                               | uu____22285 -> tm1)
                                          | (ty,FStar_Pervasives_Native.Some
                                             (FStar_Syntax_Syntax.Implicit
                                             uu____22287))::(t,uu____22289)::[]
                                              ->
                                              let uu____22329 =
                                                let uu____22330 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____22330.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____22329 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____22333::[],body,uu____22335)
                                                   ->
                                                   let uu____22370 =
                                                     simp_t body  in
                                                   (match uu____22370 with
=======
                                                    | uu____22499 -> tm1)
                                               | uu____22503 -> tm1)
                                          | (ty,FStar_Pervasives_Native.Some
                                             (FStar_Syntax_Syntax.Implicit
                                             uu____22505))::(t,uu____22507)::[]
                                              ->
                                              let uu____22547 =
                                                let uu____22548 =
                                                  FStar_Syntax_Subst.compress
                                                    t
                                                   in
                                                uu____22548.FStar_Syntax_Syntax.n
                                                 in
                                              (match uu____22547 with
                                               | FStar_Syntax_Syntax.Tm_abs
                                                   (uu____22551::[],body,uu____22553)
                                                   ->
                                                   let uu____22588 =
                                                     simp_t body  in
                                                   (match uu____22588 with
>>>>>>> master
                                                    | FStar_Pervasives_Native.Some
                                                        (false ) ->
                                                        w
                                                          FStar_Syntax_Util.t_false
                                                    | FStar_Pervasives_Native.Some
                                                        (true ) when
                                                        clearly_inhabited ty
                                                        ->
                                                        w
                                                          FStar_Syntax_Util.t_true
<<<<<<< HEAD
                                                    | uu____22378 -> tm1)
                                               | uu____22382 -> tm1)
                                          | uu____22383 -> tm1
                                        else
                                          (let uu____22396 =
                                             FStar_Syntax_Syntax.fv_eq_lid fv
                                               FStar_Parser_Const.b2t_lid
                                              in
                                           if uu____22396
=======
                                                    | uu____22596 -> tm1)
                                               | uu____22600 -> tm1)
                                          | uu____22601 -> tm1
                                        else
                                          (let uu____22614 =
                                             FStar_Syntax_Syntax.fv_eq_lid fv
                                               FStar_Parser_Const.b2t_lid
                                              in
                                           if uu____22614
>>>>>>> master
                                           then
                                             match args with
                                             | ({
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_constant
                                                    (FStar_Const.Const_bool
                                                    (true ));
                                                  FStar_Syntax_Syntax.pos =
<<<<<<< HEAD
                                                    uu____22399;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____22400;_},uu____22401)::[]
=======
                                                    uu____22617;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____22618;_},uu____22619)::[]
>>>>>>> master
                                                 ->
                                                 w FStar_Syntax_Util.t_true
                                             | ({
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_constant
                                                    (FStar_Const.Const_bool
                                                    (false ));
                                                  FStar_Syntax_Syntax.pos =
<<<<<<< HEAD
                                                    uu____22427;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____22428;_},uu____22429)::[]
                                                 ->
                                                 w FStar_Syntax_Util.t_false
                                             | uu____22455 -> tm1
                                           else
                                             (let uu____22468 =
=======
                                                    uu____22645;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____22646;_},uu____22647)::[]
                                                 ->
                                                 w FStar_Syntax_Util.t_false
                                             | uu____22673 -> tm1
                                           else
                                             (let uu____22686 =
>>>>>>> master
                                                FStar_Syntax_Syntax.fv_eq_lid
                                                  fv
                                                  FStar_Parser_Const.haseq_lid
                                                 in
<<<<<<< HEAD
                                              if uu____22468
=======
                                              if uu____22686
>>>>>>> master
                                              then
                                                let t_has_eq_for_sure t =
                                                  let haseq_lids =
                                                    [FStar_Parser_Const.int_lid;
                                                    FStar_Parser_Const.bool_lid;
                                                    FStar_Parser_Const.unit_lid;
                                                    FStar_Parser_Const.string_lid]
                                                     in
<<<<<<< HEAD
                                                  let uu____22482 =
                                                    let uu____22483 =
                                                      FStar_Syntax_Subst.compress
                                                        t
                                                       in
                                                    uu____22483.FStar_Syntax_Syntax.n
                                                     in
                                                  match uu____22482 with
=======
                                                  let uu____22700 =
                                                    let uu____22701 =
                                                      FStar_Syntax_Subst.compress
                                                        t
                                                       in
                                                    uu____22701.FStar_Syntax_Syntax.n
                                                     in
                                                  match uu____22700 with
>>>>>>> master
                                                  | FStar_Syntax_Syntax.Tm_fvar
                                                      fv1 when
                                                      FStar_All.pipe_right
                                                        haseq_lids
                                                        (FStar_List.existsb
                                                           (fun l  ->
                                                              FStar_Syntax_Syntax.fv_eq_lid
                                                                fv1 l))
                                                      -> true
<<<<<<< HEAD
                                                  | uu____22494 -> false  in
=======
                                                  | uu____22712 -> false  in
>>>>>>> master
                                                (if
                                                   (FStar_List.length args) =
                                                     (Prims.parse_int "1")
                                                 then
                                                   let t =
<<<<<<< HEAD
                                                     let uu____22508 =
=======
                                                     let uu____22726 =
>>>>>>> master
                                                       FStar_All.pipe_right
                                                         args FStar_List.hd
                                                        in
                                                     FStar_All.pipe_right
<<<<<<< HEAD
                                                       uu____22508
                                                       FStar_Pervasives_Native.fst
                                                      in
                                                   let uu____22543 =
                                                     FStar_All.pipe_right t
                                                       t_has_eq_for_sure
                                                      in
                                                   (if uu____22543
=======
                                                       uu____22726
                                                       FStar_Pervasives_Native.fst
                                                      in
                                                   let uu____22761 =
                                                     FStar_All.pipe_right t
                                                       t_has_eq_for_sure
                                                      in
                                                   (if uu____22761
>>>>>>> master
                                                    then
                                                      w
                                                        FStar_Syntax_Util.t_true
                                                    else
<<<<<<< HEAD
                                                      (let uu____22549 =
                                                         let uu____22550 =
                                                           FStar_Syntax_Subst.compress
                                                             t
                                                            in
                                                         uu____22550.FStar_Syntax_Syntax.n
                                                          in
                                                       match uu____22549 with
                                                       | FStar_Syntax_Syntax.Tm_refine
                                                           uu____22553 ->
=======
                                                      (let uu____22767 =
                                                         let uu____22768 =
                                                           FStar_Syntax_Subst.compress
                                                             t
                                                            in
                                                         uu____22768.FStar_Syntax_Syntax.n
                                                          in
                                                       match uu____22767 with
                                                       | FStar_Syntax_Syntax.Tm_refine
                                                           uu____22771 ->
>>>>>>> master
                                                           let t1 =
                                                             FStar_Syntax_Util.unrefine
                                                               t
                                                              in
<<<<<<< HEAD
                                                           let uu____22561 =
=======
                                                           let uu____22779 =
>>>>>>> master
                                                             FStar_All.pipe_right
                                                               t1
                                                               t_has_eq_for_sure
                                                              in
<<<<<<< HEAD
                                                           if uu____22561
=======
                                                           if uu____22779
>>>>>>> master
                                                           then
                                                             w
                                                               FStar_Syntax_Util.t_true
                                                           else
                                                             (let haseq_tm =
<<<<<<< HEAD
                                                                let uu____22570
                                                                  =
                                                                  let uu____22571
                                                                    =
                                                                    FStar_Syntax_Subst.compress
                                                                    tm1  in
                                                                  uu____22571.FStar_Syntax_Syntax.n
                                                                   in
                                                                match uu____22570
                                                                with
                                                                | FStar_Syntax_Syntax.Tm_app
                                                                    (hd1,uu____22577)
                                                                    -> hd1
                                                                | uu____22602
=======
                                                                let uu____22788
                                                                  =
                                                                  let uu____22789
                                                                    =
                                                                    FStar_Syntax_Subst.compress
                                                                    tm1  in
                                                                  uu____22789.FStar_Syntax_Syntax.n
                                                                   in
                                                                match uu____22788
                                                                with
                                                                | FStar_Syntax_Syntax.Tm_app
                                                                    (hd1,uu____22795)
                                                                    -> hd1
                                                                | uu____22820
>>>>>>> master
                                                                    ->
                                                                    failwith
                                                                    "Impossible! We have already checked that this is a Tm_app"
                                                                 in
<<<<<<< HEAD
                                                              let uu____22606
                                                                =
                                                                let uu____22617
=======
                                                              let uu____22824
                                                                =
                                                                let uu____22835
>>>>>>> master
                                                                  =
                                                                  FStar_All.pipe_right
                                                                    t1
                                                                    FStar_Syntax_Syntax.as_arg
                                                                   in
<<<<<<< HEAD
                                                                [uu____22617]
                                                                 in
                                                              FStar_Syntax_Util.mk_app
                                                                haseq_tm
                                                                uu____22606)
                                                       | uu____22650 -> tm1))
                                                 else tm1)
                                              else
                                                (let uu____22655 =
                                                   FStar_Syntax_Util.is_auto_squash
                                                     tm1
                                                    in
                                                 match uu____22655 with
=======
                                                                [uu____22835]
                                                                 in
                                                              FStar_Syntax_Util.mk_app
                                                                haseq_tm
                                                                uu____22824)
                                                       | uu____22868 -> tm1))
                                                 else tm1)
                                              else
                                                (let uu____22873 =
                                                   FStar_Syntax_Util.is_auto_squash
                                                     tm1
                                                    in
                                                 match uu____22873 with
>>>>>>> master
                                                 | FStar_Pervasives_Native.Some
                                                     (FStar_Syntax_Syntax.U_zero
                                                      ,t)
                                                     when
                                                     FStar_Syntax_Util.is_sub_singleton
                                                       t
                                                     -> t
<<<<<<< HEAD
                                                 | uu____22675 ->
                                                     let uu____22684 =
                                                       let uu____22691 =
                                                         norm_cb cfg  in
                                                       reduce_equality
                                                         uu____22691 cfg env
                                                        in
                                                     uu____22684 tm1)))))))))
                  | FStar_Syntax_Syntax.Tm_refine (bv,t) ->
                      let uu____22702 = simp_t t  in
                      (match uu____22702 with
=======
                                                 | uu____22893 ->
                                                     let uu____22902 =
                                                       let uu____22909 =
                                                         norm_cb cfg  in
                                                       reduce_equality
                                                         uu____22909 cfg env
                                                        in
                                                     uu____22902 tm1)))))))))
                  | FStar_Syntax_Syntax.Tm_refine (bv,t) ->
                      let uu____22920 = simp_t t  in
                      (match uu____22920 with
>>>>>>> master
                       | FStar_Pervasives_Native.Some (true ) ->
                           bv.FStar_Syntax_Syntax.sort
                       | FStar_Pervasives_Native.Some (false ) -> tm1
                       | FStar_Pervasives_Native.None  -> tm1)
<<<<<<< HEAD
                  | FStar_Syntax_Syntax.Tm_match uu____22711 ->
                      let uu____22734 = is_const_match tm1  in
                      (match uu____22734 with
=======
                  | FStar_Syntax_Syntax.Tm_match uu____22929 ->
                      let uu____22952 = is_const_match tm1  in
                      (match uu____22952 with
>>>>>>> master
                       | FStar_Pervasives_Native.Some (true ) ->
                           w FStar_Syntax_Util.t_true
                       | FStar_Pervasives_Native.Some (false ) ->
                           w FStar_Syntax_Util.t_false
                       | FStar_Pervasives_Native.None  -> tm1)
<<<<<<< HEAD
                  | uu____22743 -> tm1))
=======
                  | uu____22961 -> tm1))
>>>>>>> master

and (rebuild :
  FStar_TypeChecker_Cfg.cfg ->
    env -> stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun cfg  ->
    fun env  ->
      fun stack  ->
        fun t  ->
          FStar_TypeChecker_Cfg.log cfg
<<<<<<< HEAD
            (fun uu____22753  ->
               (let uu____22755 = FStar_Syntax_Print.tag_of_term t  in
                let uu____22757 = FStar_Syntax_Print.term_to_string t  in
                let uu____22759 =
                  FStar_Util.string_of_int (FStar_List.length env)  in
                let uu____22767 =
                  let uu____22769 =
                    let uu____22772 = firstn (Prims.parse_int "4") stack  in
                    FStar_All.pipe_left FStar_Pervasives_Native.fst
                      uu____22772
                     in
                  stack_to_string uu____22769  in
                FStar_Util.print4
                  ">>> %s\nRebuild %s with %s env elements and top of the stack %s \n"
                  uu____22755 uu____22757 uu____22759 uu____22767);
               (let uu____22797 =
                  FStar_TypeChecker_Env.debug cfg.FStar_TypeChecker_Cfg.tcenv
                    (FStar_Options.Other "NormRebuild")
                   in
                if uu____22797
                then
                  let uu____22801 = FStar_Syntax_Util.unbound_variables t  in
                  match uu____22801 with
                  | [] -> ()
                  | bvs ->
                      ((let uu____22808 = FStar_Syntax_Print.tag_of_term t
                           in
                        let uu____22810 = FStar_Syntax_Print.term_to_string t
                           in
                        let uu____22812 =
                          let uu____22814 =
                            FStar_All.pipe_right bvs
                              (FStar_List.map FStar_Syntax_Print.bv_to_string)
                             in
                          FStar_All.pipe_right uu____22814
                            (FStar_String.concat ", ")
                           in
                        FStar_Util.print3
                          "!!! Rebuild (%s) %s, free vars=%s\n" uu____22808
                          uu____22810 uu____22812);
                       failwith "DIE!")
                else ()));
          (let f_opt = is_fext_on_domain t  in
           let uu____22836 =
             (FStar_All.pipe_right f_opt FStar_Util.is_some) &&
               (match stack with
                | (Arg uu____22844)::uu____22845 -> true
                | uu____22855 -> false)
              in
           if uu____22836
           then
             let uu____22858 = FStar_All.pipe_right f_opt FStar_Util.must  in
             FStar_All.pipe_right uu____22858 (norm cfg env stack)
=======
            (fun uu____22971  ->
               (let uu____22973 = FStar_Syntax_Print.tag_of_term t  in
                let uu____22975 = FStar_Syntax_Print.term_to_string t  in
                let uu____22977 =
                  FStar_Util.string_of_int (FStar_List.length env)  in
                let uu____22985 =
                  let uu____22987 =
                    let uu____22990 = firstn (Prims.parse_int "4") stack  in
                    FStar_All.pipe_left FStar_Pervasives_Native.fst
                      uu____22990
                     in
                  stack_to_string uu____22987  in
                FStar_Util.print4
                  ">>> %s\nRebuild %s with %s env elements and top of the stack %s \n"
                  uu____22973 uu____22975 uu____22977 uu____22985);
               (let uu____23015 =
                  FStar_TypeChecker_Env.debug cfg.FStar_TypeChecker_Cfg.tcenv
                    (FStar_Options.Other "NormRebuild")
                   in
                if uu____23015
                then
                  let uu____23019 = FStar_Syntax_Util.unbound_variables t  in
                  match uu____23019 with
                  | [] -> ()
                  | bvs ->
                      ((let uu____23026 = FStar_Syntax_Print.tag_of_term t
                           in
                        let uu____23028 = FStar_Syntax_Print.term_to_string t
                           in
                        let uu____23030 =
                          let uu____23032 =
                            FStar_All.pipe_right bvs
                              (FStar_List.map FStar_Syntax_Print.bv_to_string)
                             in
                          FStar_All.pipe_right uu____23032
                            (FStar_String.concat ", ")
                           in
                        FStar_Util.print3
                          "!!! Rebuild (%s) %s, free vars=%s\n" uu____23026
                          uu____23028 uu____23030);
                       failwith "DIE!")
                else ()));
          (let f_opt = is_fext_on_domain t  in
           let uu____23054 =
             (FStar_All.pipe_right f_opt FStar_Util.is_some) &&
               (match stack with
                | (Arg uu____23062)::uu____23063 -> true
                | uu____23073 -> false)
              in
           if uu____23054
           then
             let uu____23076 = FStar_All.pipe_right f_opt FStar_Util.must  in
             FStar_All.pipe_right uu____23076 (norm cfg env stack)
>>>>>>> master
           else
             (let t1 = maybe_simplify cfg env stack t  in
              match stack with
              | [] -> t1
              | (Debug (tm,time_then))::stack1 ->
                  (if
                     (cfg.FStar_TypeChecker_Cfg.debug).FStar_TypeChecker_Cfg.print_normalized
                   then
                     (let time_now = FStar_Util.now ()  in
<<<<<<< HEAD
                      let uu____22872 =
                        let uu____22874 =
                          let uu____22876 =
                            FStar_Util.time_diff time_then time_now  in
                          FStar_Pervasives_Native.snd uu____22876  in
                        FStar_Util.string_of_int uu____22874  in
                      let uu____22883 = FStar_Syntax_Print.term_to_string tm
                         in
                      let uu____22885 = FStar_Syntax_Print.term_to_string t1
                         in
                      FStar_Util.print3
                        "Normalized term (%s ms) %s\n\tto term %s\n"
                        uu____22872 uu____22883 uu____22885)
                   else ();
                   rebuild cfg env stack1 t1)
              | (Cfg cfg1)::stack1 -> rebuild cfg1 env stack1 t1
              | (Meta (uu____22894,m,r))::stack1 ->
=======
                      let uu____23090 =
                        let uu____23092 =
                          let uu____23094 =
                            FStar_Util.time_diff time_then time_now  in
                          FStar_Pervasives_Native.snd uu____23094  in
                        FStar_Util.string_of_int uu____23092  in
                      let uu____23101 = FStar_Syntax_Print.term_to_string tm
                         in
                      let uu____23103 = FStar_Syntax_Print.term_to_string t1
                         in
                      FStar_Util.print3
                        "Normalized term (%s ms) %s\n\tto term %s\n"
                        uu____23090 uu____23101 uu____23103)
                   else ();
                   rebuild cfg env stack1 t1)
              | (Cfg cfg1)::stack1 -> rebuild cfg1 env stack1 t1
              | (Meta (uu____23112,m,r))::stack1 ->
>>>>>>> master
                  let t2 = mk (FStar_Syntax_Syntax.Tm_meta (t1, m)) r  in
                  rebuild cfg env stack1 t2
              | (MemoLazy r)::stack1 ->
                  (set_memo cfg r (env, t1);
                   FStar_TypeChecker_Cfg.log cfg
<<<<<<< HEAD
                     (fun uu____22923  ->
                        let uu____22924 =
                          FStar_Syntax_Print.term_to_string t1  in
                        FStar_Util.print1 "\tSet memo %s\n" uu____22924);
=======
                     (fun uu____23141  ->
                        let uu____23142 =
                          FStar_Syntax_Print.term_to_string t1  in
                        FStar_Util.print1 "\tSet memo %s\n" uu____23142);
>>>>>>> master
                   rebuild cfg env stack1 t1)
              | (Let (env',bs,lb,r))::stack1 ->
                  let body = FStar_Syntax_Subst.close bs t1  in
                  let t2 =
                    FStar_Syntax_Syntax.mk
                      (FStar_Syntax_Syntax.Tm_let ((false, [lb]), body))
                      FStar_Pervasives_Native.None r
                     in
                  rebuild cfg env' stack1 t2
              | (Abs (env',bs,env'',lopt,r))::stack1 ->
                  let bs1 = norm_binders cfg env' bs  in
                  let lopt1 = norm_lcomp_opt cfg env'' lopt  in
<<<<<<< HEAD
                  let uu____22967 =
                    let uu___2734_22968 = FStar_Syntax_Util.abs bs1 t1 lopt1
                       in
                    {
                      FStar_Syntax_Syntax.n =
                        (uu___2734_22968.FStar_Syntax_Syntax.n);
                      FStar_Syntax_Syntax.pos = r;
                      FStar_Syntax_Syntax.vars =
                        (uu___2734_22968.FStar_Syntax_Syntax.vars)
                    }  in
                  rebuild cfg env stack1 uu____22967
              | (Arg (Univ uu____22971,uu____22972,uu____22973))::uu____22974
                  -> failwith "Impossible"
              | (Arg (Dummy ,uu____22978,uu____22979))::uu____22980 ->
=======
                  let uu____23185 =
                    let uu___2744_23186 = FStar_Syntax_Util.abs bs1 t1 lopt1
                       in
                    {
                      FStar_Syntax_Syntax.n =
                        (uu___2744_23186.FStar_Syntax_Syntax.n);
                      FStar_Syntax_Syntax.pos = r;
                      FStar_Syntax_Syntax.vars =
                        (uu___2744_23186.FStar_Syntax_Syntax.vars)
                    }  in
                  rebuild cfg env stack1 uu____23185
              | (Arg (Univ uu____23189,uu____23190,uu____23191))::uu____23192
                  -> failwith "Impossible"
              | (Arg (Dummy ,uu____23196,uu____23197))::uu____23198 ->
>>>>>>> master
                  failwith "Impossible"
              | (UnivArgs (us,r))::stack1 ->
                  let t2 = FStar_Syntax_Syntax.mk_Tm_uinst t1 us  in
                  rebuild cfg env stack1 t2
              | (Arg
<<<<<<< HEAD
                  (Clos (env_arg,tm,uu____22996,uu____22997),aq,r))::stack1
                  when
                  let uu____23049 = head_of t1  in
                  FStar_Syntax_Util.is_fstar_tactics_by_tactic uu____23049 ->
                  let t2 =
                    let uu____23053 =
                      let uu____23058 =
                        let uu____23059 = closure_as_term cfg env_arg tm  in
                        (uu____23059, aq)  in
                      FStar_Syntax_Syntax.extend_app t1 uu____23058  in
                    uu____23053 FStar_Pervasives_Native.None r  in
                  rebuild cfg env stack1 t2
              | (Arg (Clos (env_arg,tm,m,uu____23069),aq,r))::stack1 ->
                  (FStar_TypeChecker_Cfg.log cfg
                     (fun uu____23124  ->
                        let uu____23125 =
                          FStar_Syntax_Print.term_to_string tm  in
                        FStar_Util.print1 "Rebuilding with arg %s\n"
                          uu____23125);
=======
                  (Clos (env_arg,tm,uu____23214,uu____23215),aq,r))::stack1
                  when
                  let uu____23267 = head_of t1  in
                  FStar_Syntax_Util.is_fstar_tactics_by_tactic uu____23267 ->
                  let t2 =
                    let uu____23271 =
                      let uu____23276 =
                        let uu____23277 = closure_as_term cfg env_arg tm  in
                        (uu____23277, aq)  in
                      FStar_Syntax_Syntax.extend_app t1 uu____23276  in
                    uu____23271 FStar_Pervasives_Native.None r  in
                  rebuild cfg env stack1 t2
              | (Arg (Clos (env_arg,tm,m,uu____23287),aq,r))::stack1 ->
                  (FStar_TypeChecker_Cfg.log cfg
                     (fun uu____23342  ->
                        let uu____23343 =
                          FStar_Syntax_Print.term_to_string tm  in
                        FStar_Util.print1 "Rebuilding with arg %s\n"
                          uu____23343);
>>>>>>> master
                   if
                     Prims.op_Negation
                       (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.iota
                   then
                     (if
                        (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.hnf
                      then
                        let arg = closure_as_term cfg env_arg tm  in
                        let t2 =
                          FStar_Syntax_Syntax.extend_app t1 (arg, aq)
                            FStar_Pervasives_Native.None r
                           in
                        rebuild cfg env_arg stack1 t2
                      else
                        (let stack2 = (App (env, t1, aq, r)) :: stack1  in
                         norm cfg env_arg stack2 tm))
                   else
<<<<<<< HEAD
                     (let uu____23145 = FStar_ST.op_Bang m  in
                      match uu____23145 with
=======
                     (let uu____23363 = FStar_ST.op_Bang m  in
                      match uu____23363 with
>>>>>>> master
                      | FStar_Pervasives_Native.None  ->
                          if
                            (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.hnf
                          then
                            let arg = closure_as_term cfg env_arg tm  in
                            let t2 =
                              FStar_Syntax_Syntax.extend_app t1 (arg, aq)
                                FStar_Pervasives_Native.None r
                               in
                            rebuild cfg env_arg stack1 t2
                          else
                            (let stack2 = (MemoLazy m) ::
                               (App (env, t1, aq, r)) :: stack1  in
                             norm cfg env_arg stack2 tm)
<<<<<<< HEAD
                      | FStar_Pervasives_Native.Some (uu____23233,a) ->
=======
                      | FStar_Pervasives_Native.Some (uu____23451,a) ->
>>>>>>> master
                          let t2 =
                            FStar_Syntax_Syntax.extend_app t1 (a, aq)
                              FStar_Pervasives_Native.None r
                             in
                          rebuild cfg env_arg stack1 t2))
              | (App (env1,head1,aq,r))::stack' when should_reify cfg stack
                  ->
                  let t0 = t1  in
<<<<<<< HEAD
                  let fallback msg uu____23289 =
                    FStar_TypeChecker_Cfg.log cfg
                      (fun uu____23294  ->
                         let uu____23295 =
                           FStar_Syntax_Print.term_to_string t1  in
                         FStar_Util.print2 "Not reifying%s: %s\n" msg
                           uu____23295);
=======
                  let fallback msg uu____23507 =
                    FStar_TypeChecker_Cfg.log cfg
                      (fun uu____23512  ->
                         let uu____23513 =
                           FStar_Syntax_Print.term_to_string t1  in
                         FStar_Util.print2 "Not reifying%s: %s\n" msg
                           uu____23513);
>>>>>>> master
                    (let t2 =
                       FStar_Syntax_Syntax.extend_app head1 (t1, aq)
                         FStar_Pervasives_Native.None r
                        in
                     rebuild cfg env1 stack' t2)
                     in
<<<<<<< HEAD
                  let uu____23305 =
                    let uu____23306 = FStar_Syntax_Subst.compress t1  in
                    uu____23306.FStar_Syntax_Syntax.n  in
                  (match uu____23305 with
=======
                  let uu____23523 =
                    let uu____23524 = FStar_Syntax_Subst.compress t1  in
                    uu____23524.FStar_Syntax_Syntax.n  in
                  (match uu____23523 with
>>>>>>> master
                   | FStar_Syntax_Syntax.Tm_meta
                       (t2,FStar_Syntax_Syntax.Meta_monadic (m,ty)) ->
                       do_reify_monadic (fallback " (1)") cfg env1 stack t2 m
                         ty
                   | FStar_Syntax_Syntax.Tm_meta
                       (t2,FStar_Syntax_Syntax.Meta_monadic_lift
                        (msrc,mtgt,ty))
                       ->
                       let lifted =
<<<<<<< HEAD
                         let uu____23334 = closure_as_term cfg env1 ty  in
                         reify_lift cfg t2 msrc mtgt uu____23334  in
                       (FStar_TypeChecker_Cfg.log cfg
                          (fun uu____23338  ->
                             let uu____23339 =
                               FStar_Syntax_Print.term_to_string lifted  in
                             FStar_Util.print1 "Reified lift to (1): %s\n"
                               uu____23339);
                        (let uu____23342 = FStar_List.tl stack  in
                         norm cfg env1 uu____23342 lifted))
=======
                         let uu____23552 = closure_as_term cfg env1 ty  in
                         reify_lift cfg t2 msrc mtgt uu____23552  in
                       (FStar_TypeChecker_Cfg.log cfg
                          (fun uu____23556  ->
                             let uu____23557 =
                               FStar_Syntax_Print.term_to_string lifted  in
                             FStar_Util.print1 "Reified lift to (1): %s\n"
                               uu____23557);
                        (let uu____23560 = FStar_List.tl stack  in
                         norm cfg env1 uu____23560 lifted))
>>>>>>> master
                   | FStar_Syntax_Syntax.Tm_app
                       ({
                          FStar_Syntax_Syntax.n =
                            FStar_Syntax_Syntax.Tm_constant
<<<<<<< HEAD
                            (FStar_Const.Const_reflect uu____23343);
                          FStar_Syntax_Syntax.pos = uu____23344;
                          FStar_Syntax_Syntax.vars = uu____23345;_},(e,uu____23347)::[])
                       -> norm cfg env1 stack' e
                   | FStar_Syntax_Syntax.Tm_app uu____23386 when
                       (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.primops
                       ->
                       let uu____23403 = FStar_Syntax_Util.head_and_args t1
                          in
                       (match uu____23403 with
                        | (hd1,args) ->
                            let uu____23446 =
                              let uu____23447 =
                                FStar_Syntax_Util.un_uinst hd1  in
                              uu____23447.FStar_Syntax_Syntax.n  in
                            (match uu____23446 with
                             | FStar_Syntax_Syntax.Tm_fvar fv ->
                                 let uu____23451 =
                                   FStar_TypeChecker_Cfg.find_prim_step cfg
                                     fv
                                    in
                                 (match uu____23451 with
                                  | FStar_Pervasives_Native.Some
                                      {
                                        FStar_TypeChecker_Cfg.name =
                                          uu____23454;
                                        FStar_TypeChecker_Cfg.arity =
                                          uu____23455;
                                        FStar_TypeChecker_Cfg.univ_arity =
                                          uu____23456;
                                        FStar_TypeChecker_Cfg.auto_reflect =
                                          FStar_Pervasives_Native.Some n1;
                                        FStar_TypeChecker_Cfg.strong_reduction_ok
                                          = uu____23458;
                                        FStar_TypeChecker_Cfg.requires_binder_substitution
                                          = uu____23459;
                                        FStar_TypeChecker_Cfg.interpretation
                                          = uu____23460;
                                        FStar_TypeChecker_Cfg.interpretation_nbe
                                          = uu____23461;_}
                                      when (FStar_List.length args) = n1 ->
                                      norm cfg env1 stack' t1
                                  | uu____23497 -> fallback " (3)" ())
                             | uu____23501 -> fallback " (4)" ()))
                   | uu____23503 -> fallback " (2)" ())
=======
                            (FStar_Const.Const_reflect uu____23561);
                          FStar_Syntax_Syntax.pos = uu____23562;
                          FStar_Syntax_Syntax.vars = uu____23563;_},(e,uu____23565)::[])
                       -> norm cfg env1 stack' e
                   | FStar_Syntax_Syntax.Tm_app uu____23604 when
                       (cfg.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.primops
                       ->
                       let uu____23621 = FStar_Syntax_Util.head_and_args t1
                          in
                       (match uu____23621 with
                        | (hd1,args) ->
                            let uu____23664 =
                              let uu____23665 =
                                FStar_Syntax_Util.un_uinst hd1  in
                              uu____23665.FStar_Syntax_Syntax.n  in
                            (match uu____23664 with
                             | FStar_Syntax_Syntax.Tm_fvar fv ->
                                 let uu____23669 =
                                   FStar_TypeChecker_Cfg.find_prim_step cfg
                                     fv
                                    in
                                 (match uu____23669 with
                                  | FStar_Pervasives_Native.Some
                                      {
                                        FStar_TypeChecker_Cfg.name =
                                          uu____23672;
                                        FStar_TypeChecker_Cfg.arity =
                                          uu____23673;
                                        FStar_TypeChecker_Cfg.univ_arity =
                                          uu____23674;
                                        FStar_TypeChecker_Cfg.auto_reflect =
                                          FStar_Pervasives_Native.Some n1;
                                        FStar_TypeChecker_Cfg.strong_reduction_ok
                                          = uu____23676;
                                        FStar_TypeChecker_Cfg.requires_binder_substitution
                                          = uu____23677;
                                        FStar_TypeChecker_Cfg.interpretation
                                          = uu____23678;
                                        FStar_TypeChecker_Cfg.interpretation_nbe
                                          = uu____23679;_}
                                      when (FStar_List.length args) = n1 ->
                                      norm cfg env1 stack' t1
                                  | uu____23715 -> fallback " (3)" ())
                             | uu____23719 -> fallback " (4)" ()))
                   | uu____23721 -> fallback " (2)" ())
>>>>>>> master
              | (App (env1,head1,aq,r))::stack1 ->
                  let t2 =
                    FStar_Syntax_Syntax.extend_app head1 (t1, aq)
                      FStar_Pervasives_Native.None r
                     in
                  rebuild cfg env1 stack1 t2
              | (Match (env',branches,cfg1,r))::stack1 ->
                  (FStar_TypeChecker_Cfg.log cfg1
<<<<<<< HEAD
                     (fun uu____23529  ->
                        let uu____23530 =
                          FStar_Syntax_Print.term_to_string t1  in
                        FStar_Util.print1
                          "Rebuilding with match, scrutinee is %s ...\n"
                          uu____23530);
                   (let scrutinee_env = env  in
                    let env1 = env'  in
                    let scrutinee = t1  in
                    let norm_and_rebuild_match uu____23541 =
                      FStar_TypeChecker_Cfg.log cfg1
                        (fun uu____23546  ->
                           let uu____23547 =
                             FStar_Syntax_Print.term_to_string scrutinee  in
                           let uu____23549 =
                             let uu____23551 =
                               FStar_All.pipe_right branches
                                 (FStar_List.map
                                    (fun uu____23581  ->
                                       match uu____23581 with
                                       | (p,uu____23592,uu____23593) ->
                                           FStar_Syntax_Print.pat_to_string p))
                                in
                             FStar_All.pipe_right uu____23551
=======
                     (fun uu____23747  ->
                        let uu____23748 =
                          FStar_Syntax_Print.term_to_string t1  in
                        FStar_Util.print1
                          "Rebuilding with match, scrutinee is %s ...\n"
                          uu____23748);
                   (let scrutinee_env = env  in
                    let env1 = env'  in
                    let scrutinee = t1  in
                    let norm_and_rebuild_match uu____23759 =
                      FStar_TypeChecker_Cfg.log cfg1
                        (fun uu____23764  ->
                           let uu____23765 =
                             FStar_Syntax_Print.term_to_string scrutinee  in
                           let uu____23767 =
                             let uu____23769 =
                               FStar_All.pipe_right branches
                                 (FStar_List.map
                                    (fun uu____23799  ->
                                       match uu____23799 with
                                       | (p,uu____23810,uu____23811) ->
                                           FStar_Syntax_Print.pat_to_string p))
                                in
                             FStar_All.pipe_right uu____23769
>>>>>>> master
                               (FStar_String.concat "\n\t")
                              in
                           FStar_Util.print2
                             "match is irreducible: scrutinee=%s\nbranches=%s\n"
<<<<<<< HEAD
                             uu____23547 uu____23549);
=======
                             uu____23765 uu____23767);
>>>>>>> master
                      (let whnf =
                         (cfg1.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak
                           ||
                           (cfg1.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.hnf
                          in
                       let cfg_exclude_zeta =
                         let new_delta =
                           FStar_All.pipe_right
                             cfg1.FStar_TypeChecker_Cfg.delta_level
                             (FStar_List.filter
<<<<<<< HEAD
                                (fun uu___17_23615  ->
                                   match uu___17_23615 with
=======
                                (fun uu___17_23833  ->
                                   match uu___17_23833 with
>>>>>>> master
                                   | FStar_TypeChecker_Env.InliningDelta  ->
                                       true
                                   | FStar_TypeChecker_Env.Eager_unfolding_only
                                        -> true
<<<<<<< HEAD
                                   | uu____23619 -> false))
                            in
                         let steps =
                           let uu___2902_23622 =
                             cfg1.FStar_TypeChecker_Cfg.steps  in
                           {
                             FStar_TypeChecker_Cfg.beta =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.beta);
                             FStar_TypeChecker_Cfg.iota =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.iota);
                             FStar_TypeChecker_Cfg.zeta = false;
                             FStar_TypeChecker_Cfg.weak =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.weak);
                             FStar_TypeChecker_Cfg.hnf =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.hnf);
                             FStar_TypeChecker_Cfg.primops =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.primops);
                             FStar_TypeChecker_Cfg.do_not_unfold_pure_lets =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.do_not_unfold_pure_lets);
=======
                                   | uu____23837 -> false))
                            in
                         let steps =
                           let uu___2912_23840 =
                             cfg1.FStar_TypeChecker_Cfg.steps  in
                           {
                             FStar_TypeChecker_Cfg.beta =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.beta);
                             FStar_TypeChecker_Cfg.iota =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.iota);
                             FStar_TypeChecker_Cfg.zeta = false;
                             FStar_TypeChecker_Cfg.weak =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.weak);
                             FStar_TypeChecker_Cfg.hnf =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.hnf);
                             FStar_TypeChecker_Cfg.primops =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.primops);
                             FStar_TypeChecker_Cfg.do_not_unfold_pure_lets =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.do_not_unfold_pure_lets);
>>>>>>> master
                             FStar_TypeChecker_Cfg.unfold_until =
                               FStar_Pervasives_Native.None;
                             FStar_TypeChecker_Cfg.unfold_only =
                               FStar_Pervasives_Native.None;
                             FStar_TypeChecker_Cfg.unfold_fully =
<<<<<<< HEAD
                               (uu___2902_23622.FStar_TypeChecker_Cfg.unfold_fully);
=======
                               (uu___2912_23840.FStar_TypeChecker_Cfg.unfold_fully);
>>>>>>> master
                             FStar_TypeChecker_Cfg.unfold_attr =
                               FStar_Pervasives_Native.None;
                             FStar_TypeChecker_Cfg.unfold_tac = false;
                             FStar_TypeChecker_Cfg.pure_subterms_within_computations
                               =
<<<<<<< HEAD
                               (uu___2902_23622.FStar_TypeChecker_Cfg.pure_subterms_within_computations);
                             FStar_TypeChecker_Cfg.simplify =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.simplify);
                             FStar_TypeChecker_Cfg.erase_universes =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.erase_universes);
                             FStar_TypeChecker_Cfg.allow_unbound_universes =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.allow_unbound_universes);
                             FStar_TypeChecker_Cfg.reify_ =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.reify_);
                             FStar_TypeChecker_Cfg.compress_uvars =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.compress_uvars);
                             FStar_TypeChecker_Cfg.no_full_norm =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.no_full_norm);
                             FStar_TypeChecker_Cfg.check_no_uvars =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.check_no_uvars);
                             FStar_TypeChecker_Cfg.unmeta =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.unmeta);
                             FStar_TypeChecker_Cfg.unascribe =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.unascribe);
                             FStar_TypeChecker_Cfg.in_full_norm_request =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.in_full_norm_request);
                             FStar_TypeChecker_Cfg.weakly_reduce_scrutinee =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.weakly_reduce_scrutinee);
                             FStar_TypeChecker_Cfg.nbe_step =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.nbe_step);
                             FStar_TypeChecker_Cfg.for_extraction =
                               (uu___2902_23622.FStar_TypeChecker_Cfg.for_extraction)
                           }  in
                         let uu___2905_23629 = cfg1  in
                         {
                           FStar_TypeChecker_Cfg.steps = steps;
                           FStar_TypeChecker_Cfg.tcenv =
                             (uu___2905_23629.FStar_TypeChecker_Cfg.tcenv);
                           FStar_TypeChecker_Cfg.debug =
                             (uu___2905_23629.FStar_TypeChecker_Cfg.debug);
                           FStar_TypeChecker_Cfg.delta_level = new_delta;
                           FStar_TypeChecker_Cfg.primitive_steps =
                             (uu___2905_23629.FStar_TypeChecker_Cfg.primitive_steps);
                           FStar_TypeChecker_Cfg.strong = true;
                           FStar_TypeChecker_Cfg.memoize_lazy =
                             (uu___2905_23629.FStar_TypeChecker_Cfg.memoize_lazy);
                           FStar_TypeChecker_Cfg.normalize_pure_lets =
                             (uu___2905_23629.FStar_TypeChecker_Cfg.normalize_pure_lets);
                           FStar_TypeChecker_Cfg.reifying =
                             (uu___2905_23629.FStar_TypeChecker_Cfg.reifying)
=======
                               (uu___2912_23840.FStar_TypeChecker_Cfg.pure_subterms_within_computations);
                             FStar_TypeChecker_Cfg.simplify =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.simplify);
                             FStar_TypeChecker_Cfg.erase_universes =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.erase_universes);
                             FStar_TypeChecker_Cfg.allow_unbound_universes =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.allow_unbound_universes);
                             FStar_TypeChecker_Cfg.reify_ =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.reify_);
                             FStar_TypeChecker_Cfg.compress_uvars =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.compress_uvars);
                             FStar_TypeChecker_Cfg.no_full_norm =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.no_full_norm);
                             FStar_TypeChecker_Cfg.check_no_uvars =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.check_no_uvars);
                             FStar_TypeChecker_Cfg.unmeta =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.unmeta);
                             FStar_TypeChecker_Cfg.unascribe =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.unascribe);
                             FStar_TypeChecker_Cfg.in_full_norm_request =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.in_full_norm_request);
                             FStar_TypeChecker_Cfg.weakly_reduce_scrutinee =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.weakly_reduce_scrutinee);
                             FStar_TypeChecker_Cfg.nbe_step =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.nbe_step);
                             FStar_TypeChecker_Cfg.for_extraction =
                               (uu___2912_23840.FStar_TypeChecker_Cfg.for_extraction)
                           }  in
                         let uu___2915_23847 = cfg1  in
                         {
                           FStar_TypeChecker_Cfg.steps = steps;
                           FStar_TypeChecker_Cfg.tcenv =
                             (uu___2915_23847.FStar_TypeChecker_Cfg.tcenv);
                           FStar_TypeChecker_Cfg.debug =
                             (uu___2915_23847.FStar_TypeChecker_Cfg.debug);
                           FStar_TypeChecker_Cfg.delta_level = new_delta;
                           FStar_TypeChecker_Cfg.primitive_steps =
                             (uu___2915_23847.FStar_TypeChecker_Cfg.primitive_steps);
                           FStar_TypeChecker_Cfg.strong = true;
                           FStar_TypeChecker_Cfg.memoize_lazy =
                             (uu___2915_23847.FStar_TypeChecker_Cfg.memoize_lazy);
                           FStar_TypeChecker_Cfg.normalize_pure_lets =
                             (uu___2915_23847.FStar_TypeChecker_Cfg.normalize_pure_lets);
                           FStar_TypeChecker_Cfg.reifying =
                             (uu___2915_23847.FStar_TypeChecker_Cfg.reifying)
>>>>>>> master
                         }  in
                       let norm_or_whnf env2 t2 =
                         if whnf
                         then closure_as_term cfg_exclude_zeta env2 t2
                         else norm cfg_exclude_zeta env2 [] t2  in
                       let rec norm_pat env2 p =
                         match p.FStar_Syntax_Syntax.v with
<<<<<<< HEAD
                         | FStar_Syntax_Syntax.Pat_constant uu____23704 ->
                             (p, env2)
                         | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
                             let uu____23735 =
                               FStar_All.pipe_right pats
                                 (FStar_List.fold_left
                                    (fun uu____23824  ->
                                       fun uu____23825  ->
                                         match (uu____23824, uu____23825)
                                         with
                                         | ((pats1,env3),(p1,b)) ->
                                             let uu____23975 =
                                               norm_pat env3 p1  in
                                             (match uu____23975 with
=======
                         | FStar_Syntax_Syntax.Pat_constant uu____23922 ->
                             (p, env2)
                         | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
                             let uu____23953 =
                               FStar_All.pipe_right pats
                                 (FStar_List.fold_left
                                    (fun uu____24042  ->
                                       fun uu____24043  ->
                                         match (uu____24042, uu____24043)
                                         with
                                         | ((pats1,env3),(p1,b)) ->
                                             let uu____24193 =
                                               norm_pat env3 p1  in
                                             (match uu____24193 with
>>>>>>> master
                                              | (p2,env4) ->
                                                  (((p2, b) :: pats1), env4)))
                                    ([], env2))
                                in
<<<<<<< HEAD
                             (match uu____23735 with
                              | (pats1,env3) ->
                                  ((let uu___2933_24145 = p  in
=======
                             (match uu____23953 with
                              | (pats1,env3) ->
                                  ((let uu___2943_24363 = p  in
>>>>>>> master
                                    {
                                      FStar_Syntax_Syntax.v =
                                        (FStar_Syntax_Syntax.Pat_cons
                                           (fv, (FStar_List.rev pats1)));
                                      FStar_Syntax_Syntax.p =
<<<<<<< HEAD
                                        (uu___2933_24145.FStar_Syntax_Syntax.p)
                                    }), env3))
                         | FStar_Syntax_Syntax.Pat_var x ->
                             let x1 =
                               let uu___2937_24166 = x  in
                               let uu____24167 =
=======
                                        (uu___2943_24363.FStar_Syntax_Syntax.p)
                                    }), env3))
                         | FStar_Syntax_Syntax.Pat_var x ->
                             let x1 =
                               let uu___2947_24384 = x  in
                               let uu____24385 =
>>>>>>> master
                                 norm_or_whnf env2 x.FStar_Syntax_Syntax.sort
                                  in
                               {
                                 FStar_Syntax_Syntax.ppname =
<<<<<<< HEAD
                                   (uu___2937_24166.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___2937_24166.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = uu____24167
                               }  in
                             ((let uu___2940_24181 = p  in
=======
                                   (uu___2947_24384.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___2947_24384.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = uu____24385
                               }  in
                             ((let uu___2950_24399 = p  in
>>>>>>> master
                               {
                                 FStar_Syntax_Syntax.v =
                                   (FStar_Syntax_Syntax.Pat_var x1);
                                 FStar_Syntax_Syntax.p =
<<<<<<< HEAD
                                   (uu___2940_24181.FStar_Syntax_Syntax.p)
                               }), (dummy :: env2))
                         | FStar_Syntax_Syntax.Pat_wild x ->
                             let x1 =
                               let uu___2944_24192 = x  in
                               let uu____24193 =
=======
                                   (uu___2950_24399.FStar_Syntax_Syntax.p)
                               }), (dummy :: env2))
                         | FStar_Syntax_Syntax.Pat_wild x ->
                             let x1 =
                               let uu___2954_24410 = x  in
                               let uu____24411 =
>>>>>>> master
                                 norm_or_whnf env2 x.FStar_Syntax_Syntax.sort
                                  in
                               {
                                 FStar_Syntax_Syntax.ppname =
<<<<<<< HEAD
                                   (uu___2944_24192.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___2944_24192.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = uu____24193
                               }  in
                             ((let uu___2947_24207 = p  in
=======
                                   (uu___2954_24410.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___2954_24410.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = uu____24411
                               }  in
                             ((let uu___2957_24425 = p  in
>>>>>>> master
                               {
                                 FStar_Syntax_Syntax.v =
                                   (FStar_Syntax_Syntax.Pat_wild x1);
                                 FStar_Syntax_Syntax.p =
<<<<<<< HEAD
                                   (uu___2947_24207.FStar_Syntax_Syntax.p)
                               }), (dummy :: env2))
                         | FStar_Syntax_Syntax.Pat_dot_term (x,t2) ->
                             let x1 =
                               let uu___2953_24223 = x  in
                               let uu____24224 =
=======
                                   (uu___2957_24425.FStar_Syntax_Syntax.p)
                               }), (dummy :: env2))
                         | FStar_Syntax_Syntax.Pat_dot_term (x,t2) ->
                             let x1 =
                               let uu___2963_24441 = x  in
                               let uu____24442 =
>>>>>>> master
                                 norm_or_whnf env2 x.FStar_Syntax_Syntax.sort
                                  in
                               {
                                 FStar_Syntax_Syntax.ppname =
<<<<<<< HEAD
                                   (uu___2953_24223.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___2953_24223.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = uu____24224
                               }  in
                             let t3 = norm_or_whnf env2 t2  in
                             ((let uu___2957_24239 = p  in
=======
                                   (uu___2963_24441.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___2963_24441.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = uu____24442
                               }  in
                             let t3 = norm_or_whnf env2 t2  in
                             ((let uu___2967_24457 = p  in
>>>>>>> master
                               {
                                 FStar_Syntax_Syntax.v =
                                   (FStar_Syntax_Syntax.Pat_dot_term (x1, t3));
                                 FStar_Syntax_Syntax.p =
<<<<<<< HEAD
                                   (uu___2957_24239.FStar_Syntax_Syntax.p)
=======
                                   (uu___2967_24457.FStar_Syntax_Syntax.p)
>>>>>>> master
                               }), env2)
                          in
                       let branches1 =
                         match env1 with
                         | [] when whnf -> branches
<<<<<<< HEAD
                         | uu____24283 ->
                             FStar_All.pipe_right branches
                               (FStar_List.map
                                  (fun branch1  ->
                                     let uu____24313 =
                                       FStar_Syntax_Subst.open_branch branch1
                                        in
                                     match uu____24313 with
                                     | (p,wopt,e) ->
                                         let uu____24333 = norm_pat env1 p
                                            in
                                         (match uu____24333 with
=======
                         | uu____24501 ->
                             FStar_All.pipe_right branches
                               (FStar_List.map
                                  (fun branch1  ->
                                     let uu____24531 =
                                       FStar_Syntax_Subst.open_branch branch1
                                        in
                                     match uu____24531 with
                                     | (p,wopt,e) ->
                                         let uu____24551 = norm_pat env1 p
                                            in
                                         (match uu____24551 with
>>>>>>> master
                                          | (p1,env2) ->
                                              let wopt1 =
                                                match wopt with
                                                | FStar_Pervasives_Native.None
                                                     ->
                                                    FStar_Pervasives_Native.None
                                                | FStar_Pervasives_Native.Some
                                                    w ->
<<<<<<< HEAD
                                                    let uu____24388 =
                                                      norm_or_whnf env2 w  in
                                                    FStar_Pervasives_Native.Some
                                                      uu____24388
=======
                                                    let uu____24606 =
                                                      norm_or_whnf env2 w  in
                                                    FStar_Pervasives_Native.Some
                                                      uu____24606
>>>>>>> master
                                                 in
                                              let e1 = norm_or_whnf env2 e
                                                 in
                                              FStar_Syntax_Util.branch
                                                (p1, wopt1, e1))))
                          in
                       let scrutinee1 =
<<<<<<< HEAD
                         let uu____24405 =
=======
                         let uu____24623 =
>>>>>>> master
                           ((((cfg1.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.iota
                                &&
                                (Prims.op_Negation
                                   (cfg1.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weak))
                               &&
                               (Prims.op_Negation
                                  (cfg1.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.compress_uvars))
                              &&
                              (cfg1.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.weakly_reduce_scrutinee)
                             && (maybe_weakly_reduced scrutinee)
                            in
<<<<<<< HEAD
                         if uu____24405
                         then
                           norm
                             (let uu___2976_24412 = cfg1  in
                              {
                                FStar_TypeChecker_Cfg.steps =
                                  (let uu___2978_24415 =
                                     cfg1.FStar_TypeChecker_Cfg.steps  in
                                   {
                                     FStar_TypeChecker_Cfg.beta =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.beta);
                                     FStar_TypeChecker_Cfg.iota =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.iota);
                                     FStar_TypeChecker_Cfg.zeta =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.zeta);
                                     FStar_TypeChecker_Cfg.weak =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.weak);
                                     FStar_TypeChecker_Cfg.hnf =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.hnf);
                                     FStar_TypeChecker_Cfg.primops =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.primops);
                                     FStar_TypeChecker_Cfg.do_not_unfold_pure_lets
                                       =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.do_not_unfold_pure_lets);
                                     FStar_TypeChecker_Cfg.unfold_until =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.unfold_until);
                                     FStar_TypeChecker_Cfg.unfold_only =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.unfold_only);
                                     FStar_TypeChecker_Cfg.unfold_fully =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.unfold_fully);
                                     FStar_TypeChecker_Cfg.unfold_attr =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.unfold_attr);
                                     FStar_TypeChecker_Cfg.unfold_tac =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.unfold_tac);
                                     FStar_TypeChecker_Cfg.pure_subterms_within_computations
                                       =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.pure_subterms_within_computations);
                                     FStar_TypeChecker_Cfg.simplify =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.simplify);
                                     FStar_TypeChecker_Cfg.erase_universes =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.erase_universes);
                                     FStar_TypeChecker_Cfg.allow_unbound_universes
                                       =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.allow_unbound_universes);
                                     FStar_TypeChecker_Cfg.reify_ =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.reify_);
                                     FStar_TypeChecker_Cfg.compress_uvars =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.compress_uvars);
                                     FStar_TypeChecker_Cfg.no_full_norm =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.no_full_norm);
                                     FStar_TypeChecker_Cfg.check_no_uvars =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.check_no_uvars);
                                     FStar_TypeChecker_Cfg.unmeta =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.unmeta);
                                     FStar_TypeChecker_Cfg.unascribe =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.unascribe);
                                     FStar_TypeChecker_Cfg.in_full_norm_request
                                       =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.in_full_norm_request);
                                     FStar_TypeChecker_Cfg.weakly_reduce_scrutinee
                                       = false;
                                     FStar_TypeChecker_Cfg.nbe_step =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.nbe_step);
                                     FStar_TypeChecker_Cfg.for_extraction =
                                       (uu___2978_24415.FStar_TypeChecker_Cfg.for_extraction)
                                   });
                                FStar_TypeChecker_Cfg.tcenv =
                                  (uu___2976_24412.FStar_TypeChecker_Cfg.tcenv);
                                FStar_TypeChecker_Cfg.debug =
                                  (uu___2976_24412.FStar_TypeChecker_Cfg.debug);
                                FStar_TypeChecker_Cfg.delta_level =
                                  (uu___2976_24412.FStar_TypeChecker_Cfg.delta_level);
                                FStar_TypeChecker_Cfg.primitive_steps =
                                  (uu___2976_24412.FStar_TypeChecker_Cfg.primitive_steps);
                                FStar_TypeChecker_Cfg.strong =
                                  (uu___2976_24412.FStar_TypeChecker_Cfg.strong);
                                FStar_TypeChecker_Cfg.memoize_lazy =
                                  (uu___2976_24412.FStar_TypeChecker_Cfg.memoize_lazy);
                                FStar_TypeChecker_Cfg.normalize_pure_lets =
                                  (uu___2976_24412.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                FStar_TypeChecker_Cfg.reifying =
                                  (uu___2976_24412.FStar_TypeChecker_Cfg.reifying)
                              }) scrutinee_env [] scrutinee
                         else scrutinee  in
                       let uu____24419 =
=======
                         if uu____24623
                         then
                           norm
                             (let uu___2986_24630 = cfg1  in
                              {
                                FStar_TypeChecker_Cfg.steps =
                                  (let uu___2988_24633 =
                                     cfg1.FStar_TypeChecker_Cfg.steps  in
                                   {
                                     FStar_TypeChecker_Cfg.beta =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.beta);
                                     FStar_TypeChecker_Cfg.iota =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.iota);
                                     FStar_TypeChecker_Cfg.zeta =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.zeta);
                                     FStar_TypeChecker_Cfg.weak =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.weak);
                                     FStar_TypeChecker_Cfg.hnf =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.hnf);
                                     FStar_TypeChecker_Cfg.primops =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.primops);
                                     FStar_TypeChecker_Cfg.do_not_unfold_pure_lets
                                       =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.do_not_unfold_pure_lets);
                                     FStar_TypeChecker_Cfg.unfold_until =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.unfold_until);
                                     FStar_TypeChecker_Cfg.unfold_only =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.unfold_only);
                                     FStar_TypeChecker_Cfg.unfold_fully =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.unfold_fully);
                                     FStar_TypeChecker_Cfg.unfold_attr =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.unfold_attr);
                                     FStar_TypeChecker_Cfg.unfold_tac =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.unfold_tac);
                                     FStar_TypeChecker_Cfg.pure_subterms_within_computations
                                       =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.pure_subterms_within_computations);
                                     FStar_TypeChecker_Cfg.simplify =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.simplify);
                                     FStar_TypeChecker_Cfg.erase_universes =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.erase_universes);
                                     FStar_TypeChecker_Cfg.allow_unbound_universes
                                       =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.allow_unbound_universes);
                                     FStar_TypeChecker_Cfg.reify_ =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.reify_);
                                     FStar_TypeChecker_Cfg.compress_uvars =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.compress_uvars);
                                     FStar_TypeChecker_Cfg.no_full_norm =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.no_full_norm);
                                     FStar_TypeChecker_Cfg.check_no_uvars =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.check_no_uvars);
                                     FStar_TypeChecker_Cfg.unmeta =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.unmeta);
                                     FStar_TypeChecker_Cfg.unascribe =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.unascribe);
                                     FStar_TypeChecker_Cfg.in_full_norm_request
                                       =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.in_full_norm_request);
                                     FStar_TypeChecker_Cfg.weakly_reduce_scrutinee
                                       = false;
                                     FStar_TypeChecker_Cfg.nbe_step =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.nbe_step);
                                     FStar_TypeChecker_Cfg.for_extraction =
                                       (uu___2988_24633.FStar_TypeChecker_Cfg.for_extraction)
                                   });
                                FStar_TypeChecker_Cfg.tcenv =
                                  (uu___2986_24630.FStar_TypeChecker_Cfg.tcenv);
                                FStar_TypeChecker_Cfg.debug =
                                  (uu___2986_24630.FStar_TypeChecker_Cfg.debug);
                                FStar_TypeChecker_Cfg.delta_level =
                                  (uu___2986_24630.FStar_TypeChecker_Cfg.delta_level);
                                FStar_TypeChecker_Cfg.primitive_steps =
                                  (uu___2986_24630.FStar_TypeChecker_Cfg.primitive_steps);
                                FStar_TypeChecker_Cfg.strong =
                                  (uu___2986_24630.FStar_TypeChecker_Cfg.strong);
                                FStar_TypeChecker_Cfg.memoize_lazy =
                                  (uu___2986_24630.FStar_TypeChecker_Cfg.memoize_lazy);
                                FStar_TypeChecker_Cfg.normalize_pure_lets =
                                  (uu___2986_24630.FStar_TypeChecker_Cfg.normalize_pure_lets);
                                FStar_TypeChecker_Cfg.reifying =
                                  (uu___2986_24630.FStar_TypeChecker_Cfg.reifying)
                              }) scrutinee_env [] scrutinee
                         else scrutinee  in
                       let uu____24637 =
>>>>>>> master
                         mk
                           (FStar_Syntax_Syntax.Tm_match
                              (scrutinee1, branches1)) r
                          in
<<<<<<< HEAD
                       rebuild cfg1 env1 stack1 uu____24419)
                       in
                    let rec is_cons head1 =
                      let uu____24445 =
                        let uu____24446 = FStar_Syntax_Subst.compress head1
                           in
                        uu____24446.FStar_Syntax_Syntax.n  in
                      match uu____24445 with
                      | FStar_Syntax_Syntax.Tm_uinst (h,uu____24451) ->
                          is_cons h
                      | FStar_Syntax_Syntax.Tm_constant uu____24456 -> true
                      | FStar_Syntax_Syntax.Tm_fvar
                          { FStar_Syntax_Syntax.fv_name = uu____24458;
                            FStar_Syntax_Syntax.fv_delta = uu____24459;
=======
                       rebuild cfg1 env1 stack1 uu____24637)
                       in
                    let rec is_cons head1 =
                      let uu____24663 =
                        let uu____24664 = FStar_Syntax_Subst.compress head1
                           in
                        uu____24664.FStar_Syntax_Syntax.n  in
                      match uu____24663 with
                      | FStar_Syntax_Syntax.Tm_uinst (h,uu____24669) ->
                          is_cons h
                      | FStar_Syntax_Syntax.Tm_constant uu____24674 -> true
                      | FStar_Syntax_Syntax.Tm_fvar
                          { FStar_Syntax_Syntax.fv_name = uu____24676;
                            FStar_Syntax_Syntax.fv_delta = uu____24677;
>>>>>>> master
                            FStar_Syntax_Syntax.fv_qual =
                              FStar_Pervasives_Native.Some
                              (FStar_Syntax_Syntax.Data_ctor );_}
                          -> true
                      | FStar_Syntax_Syntax.Tm_fvar
<<<<<<< HEAD
                          { FStar_Syntax_Syntax.fv_name = uu____24461;
                            FStar_Syntax_Syntax.fv_delta = uu____24462;
                            FStar_Syntax_Syntax.fv_qual =
                              FStar_Pervasives_Native.Some
                              (FStar_Syntax_Syntax.Record_ctor uu____24463);_}
                          -> true
                      | uu____24471 -> false  in
=======
                          { FStar_Syntax_Syntax.fv_name = uu____24679;
                            FStar_Syntax_Syntax.fv_delta = uu____24680;
                            FStar_Syntax_Syntax.fv_qual =
                              FStar_Pervasives_Native.Some
                              (FStar_Syntax_Syntax.Record_ctor uu____24681);_}
                          -> true
                      | uu____24689 -> false  in
>>>>>>> master
                    let guard_when_clause wopt b rest =
                      match wopt with
                      | FStar_Pervasives_Native.None  -> b
                      | FStar_Pervasives_Native.Some w ->
                          let then_branch = b  in
                          let else_branch =
                            mk
                              (FStar_Syntax_Syntax.Tm_match (scrutinee, rest))
                              r
                             in
                          FStar_Syntax_Util.if_then_else w then_branch
                            else_branch
                       in
                    let rec matches_pat scrutinee_orig p =
                      let scrutinee1 =
                        FStar_Syntax_Util.unmeta scrutinee_orig  in
                      let scrutinee2 = FStar_Syntax_Util.unlazy scrutinee1
                         in
<<<<<<< HEAD
                      let uu____24640 =
                        FStar_Syntax_Util.head_and_args scrutinee2  in
                      match uu____24640 with
=======
                      let uu____24858 =
                        FStar_Syntax_Util.head_and_args scrutinee2  in
                      match uu____24858 with
>>>>>>> master
                      | (head1,args) ->
                          (match p.FStar_Syntax_Syntax.v with
                           | FStar_Syntax_Syntax.Pat_var bv ->
                               FStar_Util.Inl [(bv, scrutinee_orig)]
                           | FStar_Syntax_Syntax.Pat_wild bv ->
                               FStar_Util.Inl [(bv, scrutinee_orig)]
<<<<<<< HEAD
                           | FStar_Syntax_Syntax.Pat_dot_term uu____24737 ->
=======
                           | FStar_Syntax_Syntax.Pat_dot_term uu____24955 ->
>>>>>>> master
                               FStar_Util.Inl []
                           | FStar_Syntax_Syntax.Pat_constant s ->
                               (match scrutinee2.FStar_Syntax_Syntax.n with
                                | FStar_Syntax_Syntax.Tm_constant s' when
                                    FStar_Const.eq_const s s' ->
                                    FStar_Util.Inl []
<<<<<<< HEAD
                                | uu____24779 ->
                                    let uu____24780 =
                                      let uu____24782 = is_cons head1  in
                                      Prims.op_Negation uu____24782  in
                                    FStar_Util.Inr uu____24780)
                           | FStar_Syntax_Syntax.Pat_cons (fv,arg_pats) ->
                               let uu____24811 =
                                 let uu____24812 =
                                   FStar_Syntax_Util.un_uinst head1  in
                                 uu____24812.FStar_Syntax_Syntax.n  in
                               (match uu____24811 with
                                | FStar_Syntax_Syntax.Tm_fvar fv' when
                                    FStar_Syntax_Syntax.fv_eq fv fv' ->
                                    matches_args [] args arg_pats
                                | uu____24831 ->
                                    let uu____24832 =
                                      let uu____24834 = is_cons head1  in
                                      Prims.op_Negation uu____24834  in
                                    FStar_Util.Inr uu____24832))
=======
                                | uu____24997 ->
                                    let uu____24998 =
                                      let uu____25000 = is_cons head1  in
                                      Prims.op_Negation uu____25000  in
                                    FStar_Util.Inr uu____24998)
                           | FStar_Syntax_Syntax.Pat_cons (fv,arg_pats) ->
                               let uu____25029 =
                                 let uu____25030 =
                                   FStar_Syntax_Util.un_uinst head1  in
                                 uu____25030.FStar_Syntax_Syntax.n  in
                               (match uu____25029 with
                                | FStar_Syntax_Syntax.Tm_fvar fv' when
                                    FStar_Syntax_Syntax.fv_eq fv fv' ->
                                    matches_args [] args arg_pats
                                | uu____25049 ->
                                    let uu____25050 =
                                      let uu____25052 = is_cons head1  in
                                      Prims.op_Negation uu____25052  in
                                    FStar_Util.Inr uu____25050))
>>>>>>> master
                    
                    and matches_args out a p =
                      match (a, p) with
                      | ([],[]) -> FStar_Util.Inl out
<<<<<<< HEAD
                      | ((t2,uu____24925)::rest_a,(p1,uu____24928)::rest_p)
                          ->
                          let uu____24987 = matches_pat t2 p1  in
                          (match uu____24987 with
=======
                      | ((t2,uu____25143)::rest_a,(p1,uu____25146)::rest_p)
                          ->
                          let uu____25205 = matches_pat t2 p1  in
                          (match uu____25205 with
>>>>>>> master
                           | FStar_Util.Inl s ->
                               matches_args (FStar_List.append out s) rest_a
                                 rest_p
                           | m -> m)
<<<<<<< HEAD
                      | uu____25040 -> FStar_Util.Inr false
=======
                      | uu____25258 -> FStar_Util.Inr false
>>>>>>> master
                     in
                    let rec matches scrutinee1 p =
                      match p with
                      | [] -> norm_and_rebuild_match ()
                      | (p1,wopt,b)::rest ->
<<<<<<< HEAD
                          let uu____25163 = matches_pat scrutinee1 p1  in
                          (match uu____25163 with
=======
                          let uu____25381 = matches_pat scrutinee1 p1  in
                          (match uu____25381 with
>>>>>>> master
                           | FStar_Util.Inr (false ) ->
                               matches scrutinee1 rest
                           | FStar_Util.Inr (true ) ->
                               norm_and_rebuild_match ()
                           | FStar_Util.Inl s ->
                               (FStar_TypeChecker_Cfg.log cfg1
<<<<<<< HEAD
                                  (fun uu____25209  ->
                                     let uu____25210 =
                                       FStar_Syntax_Print.pat_to_string p1
                                        in
                                     let uu____25212 =
                                       let uu____25214 =
                                         FStar_List.map
                                           (fun uu____25226  ->
                                              match uu____25226 with
                                              | (uu____25232,t2) ->
                                                  FStar_Syntax_Print.term_to_string
                                                    t2) s
                                          in
                                       FStar_All.pipe_right uu____25214
=======
                                  (fun uu____25427  ->
                                     let uu____25428 =
                                       FStar_Syntax_Print.pat_to_string p1
                                        in
                                     let uu____25430 =
                                       let uu____25432 =
                                         FStar_List.map
                                           (fun uu____25444  ->
                                              match uu____25444 with
                                              | (uu____25450,t2) ->
                                                  FStar_Syntax_Print.term_to_string
                                                    t2) s
                                          in
                                       FStar_All.pipe_right uu____25432
>>>>>>> master
                                         (FStar_String.concat "; ")
                                        in
                                     FStar_Util.print2
                                       "Matches pattern %s with subst = %s\n"
<<<<<<< HEAD
                                       uu____25210 uu____25212);
=======
                                       uu____25428 uu____25430);
>>>>>>> master
                                (let env0 = env1  in
                                 let env2 =
                                   FStar_List.fold_left
                                     (fun env2  ->
<<<<<<< HEAD
                                        fun uu____25268  ->
                                          match uu____25268 with
                                          | (bv,t2) ->
                                              let uu____25291 =
                                                let uu____25298 =
                                                  let uu____25301 =
=======
                                        fun uu____25486  ->
                                          match uu____25486 with
                                          | (bv,t2) ->
                                              let uu____25509 =
                                                let uu____25516 =
                                                  let uu____25519 =
>>>>>>> master
                                                    FStar_Syntax_Syntax.mk_binder
                                                      bv
                                                     in
                                                  FStar_Pervasives_Native.Some
<<<<<<< HEAD
                                                    uu____25301
                                                   in
                                                let uu____25302 =
                                                  let uu____25303 =
                                                    let uu____25335 =
=======
                                                    uu____25519
                                                   in
                                                let uu____25520 =
                                                  let uu____25521 =
                                                    let uu____25553 =
>>>>>>> master
                                                      FStar_Util.mk_ref
                                                        (FStar_Pervasives_Native.Some
                                                           ([], t2))
                                                       in
<<<<<<< HEAD
                                                    ([], t2, uu____25335,
                                                      false)
                                                     in
                                                  Clos uu____25303  in
                                                (uu____25298, uu____25302)
                                                 in
                                              uu____25291 :: env2) env1 s
                                    in
                                 let uu____25428 =
                                   guard_when_clause wopt b rest  in
                                 norm cfg1 env2 stack1 uu____25428)))
=======
                                                    ([], t2, uu____25553,
                                                      false)
                                                     in
                                                  Clos uu____25521  in
                                                (uu____25516, uu____25520)
                                                 in
                                              uu____25509 :: env2) env1 s
                                    in
                                 let uu____25646 =
                                   guard_when_clause wopt b rest  in
                                 norm cfg1 env2 stack1 uu____25646)))
>>>>>>> master
                       in
                    if
                      (cfg1.FStar_TypeChecker_Cfg.steps).FStar_TypeChecker_Cfg.iota
                    then matches scrutinee branches
                    else norm_and_rebuild_match ()))))

let (normalize_with_primitive_steps :
  FStar_TypeChecker_Cfg.primitive_step Prims.list ->
    FStar_TypeChecker_Env.steps ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun ps  ->
    fun s  ->
      fun e  ->
        fun t  ->
          let c = FStar_TypeChecker_Cfg.config' ps s e  in
          FStar_TypeChecker_Cfg.log_cfg c
<<<<<<< HEAD
            (fun uu____25461  ->
               let uu____25462 = FStar_TypeChecker_Cfg.cfg_to_string c  in
               FStar_Util.print1 "Cfg = %s\n" uu____25462);
          (let uu____25465 = is_nbe_request s  in
           if uu____25465
           then
             (FStar_TypeChecker_Cfg.log_top c
                (fun uu____25471  ->
                   let uu____25472 = FStar_Syntax_Print.term_to_string t  in
                   FStar_Util.print1 "Starting NBE for (%s) {\n" uu____25472);
              FStar_TypeChecker_Cfg.log_top c
                (fun uu____25478  ->
                   let uu____25479 = FStar_TypeChecker_Cfg.cfg_to_string c
                      in
                   FStar_Util.print1 ">>> cfg = %s\n" uu____25479);
              (let uu____25482 =
                 FStar_Util.record_time (fun uu____25489  -> nbe_eval c s t)
                  in
               match uu____25482 with
               | (r,ms) ->
                   (FStar_TypeChecker_Cfg.log_top c
                      (fun uu____25498  ->
                         let uu____25499 =
                           FStar_Syntax_Print.term_to_string r  in
                         let uu____25501 = FStar_Util.string_of_int ms  in
                         FStar_Util.print2
                           "}\nNormalization result = (%s) in %s ms\n"
                           uu____25499 uu____25501);
                    r)))
           else
             (FStar_TypeChecker_Cfg.log_top c
                (fun uu____25509  ->
                   let uu____25510 = FStar_Syntax_Print.term_to_string t  in
                   FStar_Util.print1 "Starting normalizer for (%s) {\n"
                     uu____25510);
              FStar_TypeChecker_Cfg.log_top c
                (fun uu____25516  ->
                   let uu____25517 = FStar_TypeChecker_Cfg.cfg_to_string c
                      in
                   FStar_Util.print1 ">>> cfg = %s\n" uu____25517);
              (let uu____25520 =
                 FStar_Util.record_time (fun uu____25527  -> norm c [] [] t)
                  in
               match uu____25520 with
               | (r,ms) ->
                   (FStar_TypeChecker_Cfg.log_top c
                      (fun uu____25542  ->
                         let uu____25543 =
                           FStar_Syntax_Print.term_to_string r  in
                         let uu____25545 = FStar_Util.string_of_int ms  in
                         FStar_Util.print2
                           "}\nNormalization result = (%s) in %s ms\n"
                           uu____25543 uu____25545);
=======
            (fun uu____25679  ->
               let uu____25680 = FStar_TypeChecker_Cfg.cfg_to_string c  in
               FStar_Util.print1 "Cfg = %s\n" uu____25680);
          (let uu____25683 = is_nbe_request s  in
           if uu____25683
           then
             (FStar_TypeChecker_Cfg.log_top c
                (fun uu____25689  ->
                   let uu____25690 = FStar_Syntax_Print.term_to_string t  in
                   FStar_Util.print1 "Starting NBE for (%s) {\n" uu____25690);
              FStar_TypeChecker_Cfg.log_top c
                (fun uu____25696  ->
                   let uu____25697 = FStar_TypeChecker_Cfg.cfg_to_string c
                      in
                   FStar_Util.print1 ">>> cfg = %s\n" uu____25697);
              (let uu____25700 =
                 FStar_Util.record_time (fun uu____25707  -> nbe_eval c s t)
                  in
               match uu____25700 with
               | (r,ms) ->
                   (FStar_TypeChecker_Cfg.log_top c
                      (fun uu____25716  ->
                         let uu____25717 =
                           FStar_Syntax_Print.term_to_string r  in
                         let uu____25719 = FStar_Util.string_of_int ms  in
                         FStar_Util.print2
                           "}\nNormalization result = (%s) in %s ms\n"
                           uu____25717 uu____25719);
                    r)))
           else
             (FStar_TypeChecker_Cfg.log_top c
                (fun uu____25727  ->
                   let uu____25728 = FStar_Syntax_Print.term_to_string t  in
                   FStar_Util.print1 "Starting normalizer for (%s) {\n"
                     uu____25728);
              FStar_TypeChecker_Cfg.log_top c
                (fun uu____25734  ->
                   let uu____25735 = FStar_TypeChecker_Cfg.cfg_to_string c
                      in
                   FStar_Util.print1 ">>> cfg = %s\n" uu____25735);
              (let uu____25738 =
                 FStar_Util.record_time (fun uu____25745  -> norm c [] [] t)
                  in
               match uu____25738 with
               | (r,ms) ->
                   (FStar_TypeChecker_Cfg.log_top c
                      (fun uu____25760  ->
                         let uu____25761 =
                           FStar_Syntax_Print.term_to_string r  in
                         let uu____25763 = FStar_Util.string_of_int ms  in
                         FStar_Util.print2
                           "}\nNormalization result = (%s) in %s ms\n"
                           uu____25761 uu____25763);
>>>>>>> master
                    r))))
  
let (normalize :
  FStar_TypeChecker_Env.steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun s  -> fun e  -> fun t  -> normalize_with_primitive_steps [] s e t 
let (normalize_comp :
  FStar_TypeChecker_Env.steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun s  ->
    fun e  ->
      fun t  ->
<<<<<<< HEAD
        let uu____25580 = FStar_TypeChecker_Cfg.config s e  in
        norm_comp uu____25580 [] t
=======
        let uu____25798 = FStar_TypeChecker_Cfg.config s e  in
        norm_comp uu____25798 [] t
>>>>>>> master
  
let (normalize_universe :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe)
  =
  fun env  ->
    fun u  ->
<<<<<<< HEAD
      let uu____25598 = FStar_TypeChecker_Cfg.config [] env  in
      norm_universe uu____25598 [] u
=======
      let uu____25816 = FStar_TypeChecker_Cfg.config [] env  in
      norm_universe uu____25816 [] u
>>>>>>> master
  
let (ghost_to_pure :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun c  ->
      let cfg =
        FStar_TypeChecker_Cfg.config
          [FStar_TypeChecker_Env.UnfoldUntil
             FStar_Syntax_Syntax.delta_constant;
          FStar_TypeChecker_Env.AllowUnboundUniverses;
          FStar_TypeChecker_Env.EraseUniverses;
          FStar_TypeChecker_Env.Unascribe;
          FStar_TypeChecker_Env.ForExtraction] env
         in
      let non_info t =
<<<<<<< HEAD
        let uu____25624 = norm cfg [] [] t  in
        FStar_Syntax_Util.non_informative uu____25624  in
      match c.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Total uu____25631 -> c
      | FStar_Syntax_Syntax.GTotal (t,uopt) when non_info t ->
          let uu___3134_25650 = c  in
          {
            FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Total (t, uopt));
            FStar_Syntax_Syntax.pos =
              (uu___3134_25650.FStar_Syntax_Syntax.pos);
            FStar_Syntax_Syntax.vars =
              (uu___3134_25650.FStar_Syntax_Syntax.vars)
=======
        let uu____25842 = norm cfg [] [] t  in
        FStar_Syntax_Util.non_informative uu____25842  in
      match c.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Total uu____25849 -> c
      | FStar_Syntax_Syntax.GTotal (t,uopt) when non_info t ->
          let uu___3144_25868 = c  in
          {
            FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Total (t, uopt));
            FStar_Syntax_Syntax.pos =
              (uu___3144_25868.FStar_Syntax_Syntax.pos);
            FStar_Syntax_Syntax.vars =
              (uu___3144_25868.FStar_Syntax_Syntax.vars)
>>>>>>> master
          }
      | FStar_Syntax_Syntax.Comp ct ->
          let l =
            FStar_TypeChecker_Env.norm_eff_name
              cfg.FStar_TypeChecker_Cfg.tcenv
              ct.FStar_Syntax_Syntax.effect_name
             in
<<<<<<< HEAD
          let uu____25657 =
            (FStar_Syntax_Util.is_ghost_effect l) &&
              (non_info ct.FStar_Syntax_Syntax.result_typ)
             in
          if uu____25657
          then
            let ct1 =
              let uu____25661 =
                downgrade_ghost_effect_name
                  ct.FStar_Syntax_Syntax.effect_name
                 in
              match uu____25661 with
              | FStar_Pervasives_Native.Some pure_eff ->
                  let flags =
                    let uu____25668 =
                      FStar_Ident.lid_equals pure_eff
                        FStar_Parser_Const.effect_Tot_lid
                       in
                    if uu____25668
                    then FStar_Syntax_Syntax.TOTAL ::
                      (ct.FStar_Syntax_Syntax.flags)
                    else ct.FStar_Syntax_Syntax.flags  in
                  let uu___3144_25675 = ct  in
                  {
                    FStar_Syntax_Syntax.comp_univs =
                      (uu___3144_25675.FStar_Syntax_Syntax.comp_univs);
                    FStar_Syntax_Syntax.effect_name = pure_eff;
                    FStar_Syntax_Syntax.result_typ =
                      (uu___3144_25675.FStar_Syntax_Syntax.result_typ);
                    FStar_Syntax_Syntax.effect_args =
                      (uu___3144_25675.FStar_Syntax_Syntax.effect_args);
=======
          let uu____25875 =
            (FStar_Syntax_Util.is_ghost_effect l) &&
              (non_info ct.FStar_Syntax_Syntax.result_typ)
             in
          if uu____25875
          then
            let ct1 =
              let uu____25879 =
                downgrade_ghost_effect_name
                  ct.FStar_Syntax_Syntax.effect_name
                 in
              match uu____25879 with
              | FStar_Pervasives_Native.Some pure_eff ->
                  let flags =
                    let uu____25886 =
                      FStar_Ident.lid_equals pure_eff
                        FStar_Parser_Const.effect_Tot_lid
                       in
                    if uu____25886
                    then FStar_Syntax_Syntax.TOTAL ::
                      (ct.FStar_Syntax_Syntax.flags)
                    else ct.FStar_Syntax_Syntax.flags  in
                  let uu___3154_25893 = ct  in
                  {
                    FStar_Syntax_Syntax.comp_univs =
                      (uu___3154_25893.FStar_Syntax_Syntax.comp_univs);
                    FStar_Syntax_Syntax.effect_name = pure_eff;
                    FStar_Syntax_Syntax.result_typ =
                      (uu___3154_25893.FStar_Syntax_Syntax.result_typ);
                    FStar_Syntax_Syntax.effect_args =
                      (uu___3154_25893.FStar_Syntax_Syntax.effect_args);
>>>>>>> master
                    FStar_Syntax_Syntax.flags = flags
                  }
              | FStar_Pervasives_Native.None  ->
                  let ct1 =
                    FStar_TypeChecker_Env.unfold_effect_abbrev
                      cfg.FStar_TypeChecker_Cfg.tcenv c
                     in
<<<<<<< HEAD
                  let uu___3148_25677 = ct1  in
                  {
                    FStar_Syntax_Syntax.comp_univs =
                      (uu___3148_25677.FStar_Syntax_Syntax.comp_univs);
                    FStar_Syntax_Syntax.effect_name =
                      FStar_Parser_Const.effect_PURE_lid;
                    FStar_Syntax_Syntax.result_typ =
                      (uu___3148_25677.FStar_Syntax_Syntax.result_typ);
                    FStar_Syntax_Syntax.effect_args =
                      (uu___3148_25677.FStar_Syntax_Syntax.effect_args);
                    FStar_Syntax_Syntax.flags =
                      (uu___3148_25677.FStar_Syntax_Syntax.flags)
                  }
               in
            let uu___3151_25678 = c  in
            {
              FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Comp ct1);
              FStar_Syntax_Syntax.pos =
                (uu___3151_25678.FStar_Syntax_Syntax.pos);
              FStar_Syntax_Syntax.vars =
                (uu___3151_25678.FStar_Syntax_Syntax.vars)
            }
          else c
      | uu____25681 -> c
=======
                  let uu___3158_25895 = ct1  in
                  {
                    FStar_Syntax_Syntax.comp_univs =
                      (uu___3158_25895.FStar_Syntax_Syntax.comp_univs);
                    FStar_Syntax_Syntax.effect_name =
                      FStar_Parser_Const.effect_PURE_lid;
                    FStar_Syntax_Syntax.result_typ =
                      (uu___3158_25895.FStar_Syntax_Syntax.result_typ);
                    FStar_Syntax_Syntax.effect_args =
                      (uu___3158_25895.FStar_Syntax_Syntax.effect_args);
                    FStar_Syntax_Syntax.flags =
                      (uu___3158_25895.FStar_Syntax_Syntax.flags)
                  }
               in
            let uu___3161_25896 = c  in
            {
              FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Comp ct1);
              FStar_Syntax_Syntax.pos =
                (uu___3161_25896.FStar_Syntax_Syntax.pos);
              FStar_Syntax_Syntax.vars =
                (uu___3161_25896.FStar_Syntax_Syntax.vars)
            }
          else c
      | uu____25899 -> c
>>>>>>> master
  
let (ghost_to_pure_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.lcomp)
  =
  fun env  ->
    fun lc  ->
      let cfg =
        FStar_TypeChecker_Cfg.config
          [FStar_TypeChecker_Env.Eager_unfolding;
          FStar_TypeChecker_Env.UnfoldUntil
            FStar_Syntax_Syntax.delta_constant;
          FStar_TypeChecker_Env.EraseUniverses;
          FStar_TypeChecker_Env.AllowUnboundUniverses;
          FStar_TypeChecker_Env.Unascribe;
          FStar_TypeChecker_Env.ForExtraction] env
         in
      let non_info t =
<<<<<<< HEAD
        let uu____25701 = norm cfg [] [] t  in
        FStar_Syntax_Util.non_informative uu____25701  in
      let uu____25708 =
        (FStar_Syntax_Util.is_ghost_effect lc.FStar_Syntax_Syntax.eff_name)
          && (non_info lc.FStar_Syntax_Syntax.res_typ)
         in
      if uu____25708
      then
        let uu____25711 =
          downgrade_ghost_effect_name lc.FStar_Syntax_Syntax.eff_name  in
        match uu____25711 with
        | FStar_Pervasives_Native.Some pure_eff ->
            FStar_Syntax_Syntax.mk_lcomp pure_eff
              lc.FStar_Syntax_Syntax.res_typ lc.FStar_Syntax_Syntax.cflags
              (fun uu____25717  ->
                 let uu____25718 = FStar_Syntax_Syntax.lcomp_comp lc  in
                 ghost_to_pure env uu____25718)
=======
        let uu____25919 = norm cfg [] [] t  in
        FStar_Syntax_Util.non_informative uu____25919  in
      let uu____25926 =
        (FStar_Syntax_Util.is_ghost_effect lc.FStar_Syntax_Syntax.eff_name)
          && (non_info lc.FStar_Syntax_Syntax.res_typ)
         in
      if uu____25926
      then
        let uu____25929 =
          downgrade_ghost_effect_name lc.FStar_Syntax_Syntax.eff_name  in
        match uu____25929 with
        | FStar_Pervasives_Native.Some pure_eff ->
            FStar_Syntax_Syntax.mk_lcomp pure_eff
              lc.FStar_Syntax_Syntax.res_typ lc.FStar_Syntax_Syntax.cflags
              (fun uu____25935  ->
                 let uu____25936 = FStar_Syntax_Syntax.lcomp_comp lc  in
                 ghost_to_pure env uu____25936)
>>>>>>> master
        | FStar_Pervasives_Native.None  -> lc
      else lc
  
let (term_to_string :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.string) =
  fun env  ->
    fun t  ->
      let t1 =
        try
<<<<<<< HEAD
          (fun uu___3167_25735  ->
=======
          (fun uu___3177_25953  ->
>>>>>>> master
             match () with
             | () ->
                 normalize [FStar_TypeChecker_Env.AllowUnboundUniverses] env
                   t) ()
        with
<<<<<<< HEAD
        | uu___3166_25738 ->
            ((let uu____25740 =
                let uu____25746 =
                  let uu____25748 = FStar_Util.message_of_exn uu___3166_25738
                     in
                  FStar_Util.format1 "Normalization failed with error %s\n"
                    uu____25748
                   in
                (FStar_Errors.Warning_NormalizationFailure, uu____25746)  in
              FStar_Errors.log_issue t.FStar_Syntax_Syntax.pos uu____25740);
=======
        | uu___3176_25956 ->
            ((let uu____25958 =
                let uu____25964 =
                  let uu____25966 = FStar_Util.message_of_exn uu___3176_25956
                     in
                  FStar_Util.format1 "Normalization failed with error %s\n"
                    uu____25966
                   in
                (FStar_Errors.Warning_NormalizationFailure, uu____25964)  in
              FStar_Errors.log_issue t.FStar_Syntax_Syntax.pos uu____25958);
>>>>>>> master
             t)
         in
      FStar_Syntax_Print.term_to_string' env.FStar_TypeChecker_Env.dsenv t1
  
let (comp_to_string :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.comp -> Prims.string) =
  fun env  ->
    fun c  ->
      let c1 =
        try
<<<<<<< HEAD
          (fun uu___3177_25767  ->
             match () with
             | () ->
                 let uu____25768 =
                   FStar_TypeChecker_Cfg.config
                     [FStar_TypeChecker_Env.AllowUnboundUniverses] env
                    in
                 norm_comp uu____25768 [] c) ()
        with
        | uu___3176_25777 ->
            ((let uu____25779 =
                let uu____25785 =
                  let uu____25787 = FStar_Util.message_of_exn uu___3176_25777
                     in
                  FStar_Util.format1 "Normalization failed with error %s\n"
                    uu____25787
                   in
                (FStar_Errors.Warning_NormalizationFailure, uu____25785)  in
              FStar_Errors.log_issue c.FStar_Syntax_Syntax.pos uu____25779);
=======
          (fun uu___3187_25985  ->
             match () with
             | () ->
                 let uu____25986 =
                   FStar_TypeChecker_Cfg.config
                     [FStar_TypeChecker_Env.AllowUnboundUniverses] env
                    in
                 norm_comp uu____25986 [] c) ()
        with
        | uu___3186_25995 ->
            ((let uu____25997 =
                let uu____26003 =
                  let uu____26005 = FStar_Util.message_of_exn uu___3186_25995
                     in
                  FStar_Util.format1 "Normalization failed with error %s\n"
                    uu____26005
                   in
                (FStar_Errors.Warning_NormalizationFailure, uu____26003)  in
              FStar_Errors.log_issue c.FStar_Syntax_Syntax.pos uu____25997);
>>>>>>> master
             c)
         in
      FStar_Syntax_Print.comp_to_string' env.FStar_TypeChecker_Env.dsenv c1
  
let (normalize_refinement :
  FStar_TypeChecker_Env.steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun steps  ->
    fun env  ->
      fun t0  ->
        let t =
          normalize (FStar_List.append steps [FStar_TypeChecker_Env.Beta])
            env t0
           in
        let rec aux t1 =
          let t2 = FStar_Syntax_Subst.compress t1  in
          match t2.FStar_Syntax_Syntax.n with
          | FStar_Syntax_Syntax.Tm_refine (x,phi) ->
              let t01 = aux x.FStar_Syntax_Syntax.sort  in
              (match t01.FStar_Syntax_Syntax.n with
               | FStar_Syntax_Syntax.Tm_refine (y,phi1) ->
<<<<<<< HEAD
                   let uu____25836 =
                     let uu____25837 =
                       let uu____25844 =
                         FStar_Syntax_Util.mk_conj_simp phi1 phi  in
                       (y, uu____25844)  in
                     FStar_Syntax_Syntax.Tm_refine uu____25837  in
                   mk uu____25836 t01.FStar_Syntax_Syntax.pos
               | uu____25849 -> t2)
          | uu____25850 -> t2  in
=======
                   let uu____26054 =
                     let uu____26055 =
                       let uu____26062 =
                         FStar_Syntax_Util.mk_conj_simp phi1 phi  in
                       (y, uu____26062)  in
                     FStar_Syntax_Syntax.Tm_refine uu____26055  in
                   mk uu____26054 t01.FStar_Syntax_Syntax.pos
               | uu____26067 -> t2)
          | uu____26068 -> t2  in
>>>>>>> master
        aux t
  
let (whnf_steps : FStar_TypeChecker_Env.step Prims.list) =
  [FStar_TypeChecker_Env.Primops;
  FStar_TypeChecker_Env.Weak;
  FStar_TypeChecker_Env.HNF;
  FStar_TypeChecker_Env.UnfoldUntil FStar_Syntax_Syntax.delta_constant;
  FStar_TypeChecker_Env.Beta] 
let (unfold_whnf' :
  FStar_TypeChecker_Env.steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun steps  ->
    fun env  ->
      fun t  -> normalize (FStar_List.append steps whnf_steps) env t
  
let (unfold_whnf :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun env  -> fun t  -> unfold_whnf' [] env t 
let (reduce_or_remove_uvar_solutions :
  Prims.bool ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun remove  ->
    fun env  ->
      fun t  ->
        normalize
          (FStar_List.append
             (if remove then [FStar_TypeChecker_Env.CheckNoUvars] else [])
             [FStar_TypeChecker_Env.Beta;
             FStar_TypeChecker_Env.DoNotUnfoldPureLets;
             FStar_TypeChecker_Env.CompressUvars;
             FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
             FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Iota;
             FStar_TypeChecker_Env.NoFullNorm]) env t
  
let (reduce_uvar_solutions :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun env  -> fun t  -> reduce_or_remove_uvar_solutions false env t 
let (remove_uvar_solutions :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  = fun env  -> fun t  -> reduce_or_remove_uvar_solutions true env t 
let (eta_expand_with_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      fun t_e  ->
<<<<<<< HEAD
        let uu____25944 = FStar_Syntax_Util.arrow_formals_comp t_e  in
        match uu____25944 with
        | (formals,c) ->
            (match formals with
             | [] -> e
             | uu____25981 ->
                 let uu____25990 = FStar_Syntax_Util.abs_formals e  in
                 (match uu____25990 with
                  | (actuals,uu____26000,uu____26001) ->
=======
        let uu____26162 = FStar_Syntax_Util.arrow_formals_comp t_e  in
        match uu____26162 with
        | (formals,c) ->
            (match formals with
             | [] -> e
             | uu____26199 ->
                 let uu____26208 = FStar_Syntax_Util.abs_formals e  in
                 (match uu____26208 with
                  | (actuals,uu____26218,uu____26219) ->
>>>>>>> master
                      if
                        (FStar_List.length actuals) =
                          (FStar_List.length formals)
                      then e
                      else
<<<<<<< HEAD
                        (let uu____26021 =
                           FStar_All.pipe_right formals
                             FStar_Syntax_Util.args_of_binders
                            in
                         match uu____26021 with
                         | (binders,args) ->
                             let uu____26032 =
=======
                        (let uu____26239 =
                           FStar_All.pipe_right formals
                             FStar_Syntax_Util.args_of_binders
                            in
                         match uu____26239 with
                         | (binders,args) ->
                             let uu____26250 =
>>>>>>> master
                               FStar_Syntax_Syntax.mk_Tm_app e args
                                 FStar_Pervasives_Native.None
                                 e.FStar_Syntax_Syntax.pos
                                in
<<<<<<< HEAD
                             FStar_Syntax_Util.abs binders uu____26032
=======
                             FStar_Syntax_Util.abs binders uu____26250
>>>>>>> master
                               (FStar_Pervasives_Native.Some
                                  (FStar_Syntax_Util.residual_comp_of_comp c)))))
  
let (eta_expand :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      match t.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_name x ->
          eta_expand_with_type env t x.FStar_Syntax_Syntax.sort
<<<<<<< HEAD
      | uu____26047 ->
          let uu____26048 = FStar_Syntax_Util.head_and_args t  in
          (match uu____26048 with
           | (head1,args) ->
               let uu____26091 =
                 let uu____26092 = FStar_Syntax_Subst.compress head1  in
                 uu____26092.FStar_Syntax_Syntax.n  in
               (match uu____26091 with
                | FStar_Syntax_Syntax.Tm_uvar (u,s) ->
                    let uu____26113 =
                      let uu____26128 =
                        FStar_Syntax_Subst.subst' s
                          u.FStar_Syntax_Syntax.ctx_uvar_typ
                         in
                      FStar_Syntax_Util.arrow_formals uu____26128  in
                    (match uu____26113 with
=======
      | uu____26265 ->
          let uu____26266 = FStar_Syntax_Util.head_and_args t  in
          (match uu____26266 with
           | (head1,args) ->
               let uu____26309 =
                 let uu____26310 = FStar_Syntax_Subst.compress head1  in
                 uu____26310.FStar_Syntax_Syntax.n  in
               (match uu____26309 with
                | FStar_Syntax_Syntax.Tm_uvar (u,s) ->
                    let uu____26331 =
                      let uu____26346 =
                        FStar_Syntax_Subst.subst' s
                          u.FStar_Syntax_Syntax.ctx_uvar_typ
                         in
                      FStar_Syntax_Util.arrow_formals uu____26346  in
                    (match uu____26331 with
>>>>>>> master
                     | (formals,_tres) ->
                         if
                           (FStar_List.length formals) =
                             (FStar_List.length args)
                         then t
                         else
<<<<<<< HEAD
                           (let uu____26168 =
                              env.FStar_TypeChecker_Env.type_of
                                (let uu___3247_26176 = env  in
                                 {
                                   FStar_TypeChecker_Env.solver =
                                     (uu___3247_26176.FStar_TypeChecker_Env.solver);
                                   FStar_TypeChecker_Env.range =
                                     (uu___3247_26176.FStar_TypeChecker_Env.range);
                                   FStar_TypeChecker_Env.curmodule =
                                     (uu___3247_26176.FStar_TypeChecker_Env.curmodule);
                                   FStar_TypeChecker_Env.gamma =
                                     (uu___3247_26176.FStar_TypeChecker_Env.gamma);
                                   FStar_TypeChecker_Env.gamma_sig =
                                     (uu___3247_26176.FStar_TypeChecker_Env.gamma_sig);
                                   FStar_TypeChecker_Env.gamma_cache =
                                     (uu___3247_26176.FStar_TypeChecker_Env.gamma_cache);
                                   FStar_TypeChecker_Env.modules =
                                     (uu___3247_26176.FStar_TypeChecker_Env.modules);
                                   FStar_TypeChecker_Env.expected_typ =
                                     FStar_Pervasives_Native.None;
                                   FStar_TypeChecker_Env.sigtab =
                                     (uu___3247_26176.FStar_TypeChecker_Env.sigtab);
                                   FStar_TypeChecker_Env.attrtab =
                                     (uu___3247_26176.FStar_TypeChecker_Env.attrtab);
                                   FStar_TypeChecker_Env.is_pattern =
                                     (uu___3247_26176.FStar_TypeChecker_Env.is_pattern);
                                   FStar_TypeChecker_Env.instantiate_imp =
                                     (uu___3247_26176.FStar_TypeChecker_Env.instantiate_imp);
                                   FStar_TypeChecker_Env.effects =
                                     (uu___3247_26176.FStar_TypeChecker_Env.effects);
                                   FStar_TypeChecker_Env.generalize =
                                     (uu___3247_26176.FStar_TypeChecker_Env.generalize);
                                   FStar_TypeChecker_Env.letrecs =
                                     (uu___3247_26176.FStar_TypeChecker_Env.letrecs);
                                   FStar_TypeChecker_Env.top_level =
                                     (uu___3247_26176.FStar_TypeChecker_Env.top_level);
                                   FStar_TypeChecker_Env.check_uvars =
                                     (uu___3247_26176.FStar_TypeChecker_Env.check_uvars);
                                   FStar_TypeChecker_Env.use_eq =
                                     (uu___3247_26176.FStar_TypeChecker_Env.use_eq);
                                   FStar_TypeChecker_Env.is_iface =
                                     (uu___3247_26176.FStar_TypeChecker_Env.is_iface);
                                   FStar_TypeChecker_Env.admit =
                                     (uu___3247_26176.FStar_TypeChecker_Env.admit);
                                   FStar_TypeChecker_Env.lax = true;
                                   FStar_TypeChecker_Env.lax_universes =
                                     (uu___3247_26176.FStar_TypeChecker_Env.lax_universes);
                                   FStar_TypeChecker_Env.phase1 =
                                     (uu___3247_26176.FStar_TypeChecker_Env.phase1);
                                   FStar_TypeChecker_Env.failhard =
                                     (uu___3247_26176.FStar_TypeChecker_Env.failhard);
                                   FStar_TypeChecker_Env.nosynth =
                                     (uu___3247_26176.FStar_TypeChecker_Env.nosynth);
                                   FStar_TypeChecker_Env.uvar_subtyping =
                                     (uu___3247_26176.FStar_TypeChecker_Env.uvar_subtyping);
                                   FStar_TypeChecker_Env.tc_term =
                                     (uu___3247_26176.FStar_TypeChecker_Env.tc_term);
                                   FStar_TypeChecker_Env.type_of =
                                     (uu___3247_26176.FStar_TypeChecker_Env.type_of);
                                   FStar_TypeChecker_Env.universe_of =
                                     (uu___3247_26176.FStar_TypeChecker_Env.universe_of);
                                   FStar_TypeChecker_Env.check_type_of =
                                     (uu___3247_26176.FStar_TypeChecker_Env.check_type_of);
                                   FStar_TypeChecker_Env.use_bv_sorts = true;
                                   FStar_TypeChecker_Env.qtbl_name_and_index
                                     =
                                     (uu___3247_26176.FStar_TypeChecker_Env.qtbl_name_and_index);
                                   FStar_TypeChecker_Env.normalized_eff_names
                                     =
                                     (uu___3247_26176.FStar_TypeChecker_Env.normalized_eff_names);
                                   FStar_TypeChecker_Env.fv_delta_depths =
                                     (uu___3247_26176.FStar_TypeChecker_Env.fv_delta_depths);
                                   FStar_TypeChecker_Env.proof_ns =
                                     (uu___3247_26176.FStar_TypeChecker_Env.proof_ns);
                                   FStar_TypeChecker_Env.synth_hook =
                                     (uu___3247_26176.FStar_TypeChecker_Env.synth_hook);
                                   FStar_TypeChecker_Env.splice =
                                     (uu___3247_26176.FStar_TypeChecker_Env.splice);
                                   FStar_TypeChecker_Env.postprocess =
                                     (uu___3247_26176.FStar_TypeChecker_Env.postprocess);
                                   FStar_TypeChecker_Env.is_native_tactic =
                                     (uu___3247_26176.FStar_TypeChecker_Env.is_native_tactic);
                                   FStar_TypeChecker_Env.identifier_info =
                                     (uu___3247_26176.FStar_TypeChecker_Env.identifier_info);
                                   FStar_TypeChecker_Env.tc_hooks =
                                     (uu___3247_26176.FStar_TypeChecker_Env.tc_hooks);
                                   FStar_TypeChecker_Env.dsenv =
                                     (uu___3247_26176.FStar_TypeChecker_Env.dsenv);
                                   FStar_TypeChecker_Env.nbe =
                                     (uu___3247_26176.FStar_TypeChecker_Env.nbe)
                                 }) t
                               in
                            match uu____26168 with
                            | (uu____26179,ty,uu____26181) ->
                                eta_expand_with_type env t ty))
                | uu____26182 ->
                    let uu____26183 =
                      env.FStar_TypeChecker_Env.type_of
                        (let uu___3254_26191 = env  in
                         {
                           FStar_TypeChecker_Env.solver =
                             (uu___3254_26191.FStar_TypeChecker_Env.solver);
                           FStar_TypeChecker_Env.range =
                             (uu___3254_26191.FStar_TypeChecker_Env.range);
                           FStar_TypeChecker_Env.curmodule =
                             (uu___3254_26191.FStar_TypeChecker_Env.curmodule);
                           FStar_TypeChecker_Env.gamma =
                             (uu___3254_26191.FStar_TypeChecker_Env.gamma);
                           FStar_TypeChecker_Env.gamma_sig =
                             (uu___3254_26191.FStar_TypeChecker_Env.gamma_sig);
                           FStar_TypeChecker_Env.gamma_cache =
                             (uu___3254_26191.FStar_TypeChecker_Env.gamma_cache);
                           FStar_TypeChecker_Env.modules =
                             (uu___3254_26191.FStar_TypeChecker_Env.modules);
                           FStar_TypeChecker_Env.expected_typ =
                             FStar_Pervasives_Native.None;
                           FStar_TypeChecker_Env.sigtab =
                             (uu___3254_26191.FStar_TypeChecker_Env.sigtab);
                           FStar_TypeChecker_Env.attrtab =
                             (uu___3254_26191.FStar_TypeChecker_Env.attrtab);
                           FStar_TypeChecker_Env.is_pattern =
                             (uu___3254_26191.FStar_TypeChecker_Env.is_pattern);
                           FStar_TypeChecker_Env.instantiate_imp =
                             (uu___3254_26191.FStar_TypeChecker_Env.instantiate_imp);
                           FStar_TypeChecker_Env.effects =
                             (uu___3254_26191.FStar_TypeChecker_Env.effects);
                           FStar_TypeChecker_Env.generalize =
                             (uu___3254_26191.FStar_TypeChecker_Env.generalize);
                           FStar_TypeChecker_Env.letrecs =
                             (uu___3254_26191.FStar_TypeChecker_Env.letrecs);
                           FStar_TypeChecker_Env.top_level =
                             (uu___3254_26191.FStar_TypeChecker_Env.top_level);
                           FStar_TypeChecker_Env.check_uvars =
                             (uu___3254_26191.FStar_TypeChecker_Env.check_uvars);
                           FStar_TypeChecker_Env.use_eq =
                             (uu___3254_26191.FStar_TypeChecker_Env.use_eq);
                           FStar_TypeChecker_Env.is_iface =
                             (uu___3254_26191.FStar_TypeChecker_Env.is_iface);
                           FStar_TypeChecker_Env.admit =
                             (uu___3254_26191.FStar_TypeChecker_Env.admit);
                           FStar_TypeChecker_Env.lax = true;
                           FStar_TypeChecker_Env.lax_universes =
                             (uu___3254_26191.FStar_TypeChecker_Env.lax_universes);
                           FStar_TypeChecker_Env.phase1 =
                             (uu___3254_26191.FStar_TypeChecker_Env.phase1);
                           FStar_TypeChecker_Env.failhard =
                             (uu___3254_26191.FStar_TypeChecker_Env.failhard);
                           FStar_TypeChecker_Env.nosynth =
                             (uu___3254_26191.FStar_TypeChecker_Env.nosynth);
                           FStar_TypeChecker_Env.uvar_subtyping =
                             (uu___3254_26191.FStar_TypeChecker_Env.uvar_subtyping);
                           FStar_TypeChecker_Env.tc_term =
                             (uu___3254_26191.FStar_TypeChecker_Env.tc_term);
                           FStar_TypeChecker_Env.type_of =
                             (uu___3254_26191.FStar_TypeChecker_Env.type_of);
                           FStar_TypeChecker_Env.universe_of =
                             (uu___3254_26191.FStar_TypeChecker_Env.universe_of);
                           FStar_TypeChecker_Env.check_type_of =
                             (uu___3254_26191.FStar_TypeChecker_Env.check_type_of);
                           FStar_TypeChecker_Env.use_bv_sorts = true;
                           FStar_TypeChecker_Env.qtbl_name_and_index =
                             (uu___3254_26191.FStar_TypeChecker_Env.qtbl_name_and_index);
                           FStar_TypeChecker_Env.normalized_eff_names =
                             (uu___3254_26191.FStar_TypeChecker_Env.normalized_eff_names);
                           FStar_TypeChecker_Env.fv_delta_depths =
                             (uu___3254_26191.FStar_TypeChecker_Env.fv_delta_depths);
                           FStar_TypeChecker_Env.proof_ns =
                             (uu___3254_26191.FStar_TypeChecker_Env.proof_ns);
                           FStar_TypeChecker_Env.synth_hook =
                             (uu___3254_26191.FStar_TypeChecker_Env.synth_hook);
                           FStar_TypeChecker_Env.splice =
                             (uu___3254_26191.FStar_TypeChecker_Env.splice);
                           FStar_TypeChecker_Env.postprocess =
                             (uu___3254_26191.FStar_TypeChecker_Env.postprocess);
                           FStar_TypeChecker_Env.is_native_tactic =
                             (uu___3254_26191.FStar_TypeChecker_Env.is_native_tactic);
                           FStar_TypeChecker_Env.identifier_info =
                             (uu___3254_26191.FStar_TypeChecker_Env.identifier_info);
                           FStar_TypeChecker_Env.tc_hooks =
                             (uu___3254_26191.FStar_TypeChecker_Env.tc_hooks);
                           FStar_TypeChecker_Env.dsenv =
                             (uu___3254_26191.FStar_TypeChecker_Env.dsenv);
                           FStar_TypeChecker_Env.nbe =
                             (uu___3254_26191.FStar_TypeChecker_Env.nbe)
                         }) t
                       in
                    (match uu____26183 with
                     | (uu____26194,ty,uu____26196) ->
=======
                           (let uu____26386 =
                              env.FStar_TypeChecker_Env.type_of
                                (let uu___3257_26394 = env  in
                                 {
                                   FStar_TypeChecker_Env.solver =
                                     (uu___3257_26394.FStar_TypeChecker_Env.solver);
                                   FStar_TypeChecker_Env.range =
                                     (uu___3257_26394.FStar_TypeChecker_Env.range);
                                   FStar_TypeChecker_Env.curmodule =
                                     (uu___3257_26394.FStar_TypeChecker_Env.curmodule);
                                   FStar_TypeChecker_Env.gamma =
                                     (uu___3257_26394.FStar_TypeChecker_Env.gamma);
                                   FStar_TypeChecker_Env.gamma_sig =
                                     (uu___3257_26394.FStar_TypeChecker_Env.gamma_sig);
                                   FStar_TypeChecker_Env.gamma_cache =
                                     (uu___3257_26394.FStar_TypeChecker_Env.gamma_cache);
                                   FStar_TypeChecker_Env.modules =
                                     (uu___3257_26394.FStar_TypeChecker_Env.modules);
                                   FStar_TypeChecker_Env.expected_typ =
                                     FStar_Pervasives_Native.None;
                                   FStar_TypeChecker_Env.sigtab =
                                     (uu___3257_26394.FStar_TypeChecker_Env.sigtab);
                                   FStar_TypeChecker_Env.attrtab =
                                     (uu___3257_26394.FStar_TypeChecker_Env.attrtab);
                                   FStar_TypeChecker_Env.is_pattern =
                                     (uu___3257_26394.FStar_TypeChecker_Env.is_pattern);
                                   FStar_TypeChecker_Env.instantiate_imp =
                                     (uu___3257_26394.FStar_TypeChecker_Env.instantiate_imp);
                                   FStar_TypeChecker_Env.effects =
                                     (uu___3257_26394.FStar_TypeChecker_Env.effects);
                                   FStar_TypeChecker_Env.generalize =
                                     (uu___3257_26394.FStar_TypeChecker_Env.generalize);
                                   FStar_TypeChecker_Env.letrecs =
                                     (uu___3257_26394.FStar_TypeChecker_Env.letrecs);
                                   FStar_TypeChecker_Env.top_level =
                                     (uu___3257_26394.FStar_TypeChecker_Env.top_level);
                                   FStar_TypeChecker_Env.check_uvars =
                                     (uu___3257_26394.FStar_TypeChecker_Env.check_uvars);
                                   FStar_TypeChecker_Env.use_eq =
                                     (uu___3257_26394.FStar_TypeChecker_Env.use_eq);
                                   FStar_TypeChecker_Env.is_iface =
                                     (uu___3257_26394.FStar_TypeChecker_Env.is_iface);
                                   FStar_TypeChecker_Env.admit =
                                     (uu___3257_26394.FStar_TypeChecker_Env.admit);
                                   FStar_TypeChecker_Env.lax = true;
                                   FStar_TypeChecker_Env.lax_universes =
                                     (uu___3257_26394.FStar_TypeChecker_Env.lax_universes);
                                   FStar_TypeChecker_Env.phase1 =
                                     (uu___3257_26394.FStar_TypeChecker_Env.phase1);
                                   FStar_TypeChecker_Env.failhard =
                                     (uu___3257_26394.FStar_TypeChecker_Env.failhard);
                                   FStar_TypeChecker_Env.nosynth =
                                     (uu___3257_26394.FStar_TypeChecker_Env.nosynth);
                                   FStar_TypeChecker_Env.uvar_subtyping =
                                     (uu___3257_26394.FStar_TypeChecker_Env.uvar_subtyping);
                                   FStar_TypeChecker_Env.tc_term =
                                     (uu___3257_26394.FStar_TypeChecker_Env.tc_term);
                                   FStar_TypeChecker_Env.type_of =
                                     (uu___3257_26394.FStar_TypeChecker_Env.type_of);
                                   FStar_TypeChecker_Env.universe_of =
                                     (uu___3257_26394.FStar_TypeChecker_Env.universe_of);
                                   FStar_TypeChecker_Env.check_type_of =
                                     (uu___3257_26394.FStar_TypeChecker_Env.check_type_of);
                                   FStar_TypeChecker_Env.use_bv_sorts = true;
                                   FStar_TypeChecker_Env.qtbl_name_and_index
                                     =
                                     (uu___3257_26394.FStar_TypeChecker_Env.qtbl_name_and_index);
                                   FStar_TypeChecker_Env.normalized_eff_names
                                     =
                                     (uu___3257_26394.FStar_TypeChecker_Env.normalized_eff_names);
                                   FStar_TypeChecker_Env.fv_delta_depths =
                                     (uu___3257_26394.FStar_TypeChecker_Env.fv_delta_depths);
                                   FStar_TypeChecker_Env.proof_ns =
                                     (uu___3257_26394.FStar_TypeChecker_Env.proof_ns);
                                   FStar_TypeChecker_Env.synth_hook =
                                     (uu___3257_26394.FStar_TypeChecker_Env.synth_hook);
                                   FStar_TypeChecker_Env.splice =
                                     (uu___3257_26394.FStar_TypeChecker_Env.splice);
                                   FStar_TypeChecker_Env.postprocess =
                                     (uu___3257_26394.FStar_TypeChecker_Env.postprocess);
                                   FStar_TypeChecker_Env.is_native_tactic =
                                     (uu___3257_26394.FStar_TypeChecker_Env.is_native_tactic);
                                   FStar_TypeChecker_Env.identifier_info =
                                     (uu___3257_26394.FStar_TypeChecker_Env.identifier_info);
                                   FStar_TypeChecker_Env.tc_hooks =
                                     (uu___3257_26394.FStar_TypeChecker_Env.tc_hooks);
                                   FStar_TypeChecker_Env.dsenv =
                                     (uu___3257_26394.FStar_TypeChecker_Env.dsenv);
                                   FStar_TypeChecker_Env.nbe =
                                     (uu___3257_26394.FStar_TypeChecker_Env.nbe)
                                 }) t
                               in
                            match uu____26386 with
                            | (uu____26397,ty,uu____26399) ->
                                eta_expand_with_type env t ty))
                | uu____26400 ->
                    let uu____26401 =
                      env.FStar_TypeChecker_Env.type_of
                        (let uu___3264_26409 = env  in
                         {
                           FStar_TypeChecker_Env.solver =
                             (uu___3264_26409.FStar_TypeChecker_Env.solver);
                           FStar_TypeChecker_Env.range =
                             (uu___3264_26409.FStar_TypeChecker_Env.range);
                           FStar_TypeChecker_Env.curmodule =
                             (uu___3264_26409.FStar_TypeChecker_Env.curmodule);
                           FStar_TypeChecker_Env.gamma =
                             (uu___3264_26409.FStar_TypeChecker_Env.gamma);
                           FStar_TypeChecker_Env.gamma_sig =
                             (uu___3264_26409.FStar_TypeChecker_Env.gamma_sig);
                           FStar_TypeChecker_Env.gamma_cache =
                             (uu___3264_26409.FStar_TypeChecker_Env.gamma_cache);
                           FStar_TypeChecker_Env.modules =
                             (uu___3264_26409.FStar_TypeChecker_Env.modules);
                           FStar_TypeChecker_Env.expected_typ =
                             FStar_Pervasives_Native.None;
                           FStar_TypeChecker_Env.sigtab =
                             (uu___3264_26409.FStar_TypeChecker_Env.sigtab);
                           FStar_TypeChecker_Env.attrtab =
                             (uu___3264_26409.FStar_TypeChecker_Env.attrtab);
                           FStar_TypeChecker_Env.is_pattern =
                             (uu___3264_26409.FStar_TypeChecker_Env.is_pattern);
                           FStar_TypeChecker_Env.instantiate_imp =
                             (uu___3264_26409.FStar_TypeChecker_Env.instantiate_imp);
                           FStar_TypeChecker_Env.effects =
                             (uu___3264_26409.FStar_TypeChecker_Env.effects);
                           FStar_TypeChecker_Env.generalize =
                             (uu___3264_26409.FStar_TypeChecker_Env.generalize);
                           FStar_TypeChecker_Env.letrecs =
                             (uu___3264_26409.FStar_TypeChecker_Env.letrecs);
                           FStar_TypeChecker_Env.top_level =
                             (uu___3264_26409.FStar_TypeChecker_Env.top_level);
                           FStar_TypeChecker_Env.check_uvars =
                             (uu___3264_26409.FStar_TypeChecker_Env.check_uvars);
                           FStar_TypeChecker_Env.use_eq =
                             (uu___3264_26409.FStar_TypeChecker_Env.use_eq);
                           FStar_TypeChecker_Env.is_iface =
                             (uu___3264_26409.FStar_TypeChecker_Env.is_iface);
                           FStar_TypeChecker_Env.admit =
                             (uu___3264_26409.FStar_TypeChecker_Env.admit);
                           FStar_TypeChecker_Env.lax = true;
                           FStar_TypeChecker_Env.lax_universes =
                             (uu___3264_26409.FStar_TypeChecker_Env.lax_universes);
                           FStar_TypeChecker_Env.phase1 =
                             (uu___3264_26409.FStar_TypeChecker_Env.phase1);
                           FStar_TypeChecker_Env.failhard =
                             (uu___3264_26409.FStar_TypeChecker_Env.failhard);
                           FStar_TypeChecker_Env.nosynth =
                             (uu___3264_26409.FStar_TypeChecker_Env.nosynth);
                           FStar_TypeChecker_Env.uvar_subtyping =
                             (uu___3264_26409.FStar_TypeChecker_Env.uvar_subtyping);
                           FStar_TypeChecker_Env.tc_term =
                             (uu___3264_26409.FStar_TypeChecker_Env.tc_term);
                           FStar_TypeChecker_Env.type_of =
                             (uu___3264_26409.FStar_TypeChecker_Env.type_of);
                           FStar_TypeChecker_Env.universe_of =
                             (uu___3264_26409.FStar_TypeChecker_Env.universe_of);
                           FStar_TypeChecker_Env.check_type_of =
                             (uu___3264_26409.FStar_TypeChecker_Env.check_type_of);
                           FStar_TypeChecker_Env.use_bv_sorts = true;
                           FStar_TypeChecker_Env.qtbl_name_and_index =
                             (uu___3264_26409.FStar_TypeChecker_Env.qtbl_name_and_index);
                           FStar_TypeChecker_Env.normalized_eff_names =
                             (uu___3264_26409.FStar_TypeChecker_Env.normalized_eff_names);
                           FStar_TypeChecker_Env.fv_delta_depths =
                             (uu___3264_26409.FStar_TypeChecker_Env.fv_delta_depths);
                           FStar_TypeChecker_Env.proof_ns =
                             (uu___3264_26409.FStar_TypeChecker_Env.proof_ns);
                           FStar_TypeChecker_Env.synth_hook =
                             (uu___3264_26409.FStar_TypeChecker_Env.synth_hook);
                           FStar_TypeChecker_Env.splice =
                             (uu___3264_26409.FStar_TypeChecker_Env.splice);
                           FStar_TypeChecker_Env.postprocess =
                             (uu___3264_26409.FStar_TypeChecker_Env.postprocess);
                           FStar_TypeChecker_Env.is_native_tactic =
                             (uu___3264_26409.FStar_TypeChecker_Env.is_native_tactic);
                           FStar_TypeChecker_Env.identifier_info =
                             (uu___3264_26409.FStar_TypeChecker_Env.identifier_info);
                           FStar_TypeChecker_Env.tc_hooks =
                             (uu___3264_26409.FStar_TypeChecker_Env.tc_hooks);
                           FStar_TypeChecker_Env.dsenv =
                             (uu___3264_26409.FStar_TypeChecker_Env.dsenv);
                           FStar_TypeChecker_Env.nbe =
                             (uu___3264_26409.FStar_TypeChecker_Env.nbe)
                         }) t
                       in
                    (match uu____26401 with
                     | (uu____26412,ty,uu____26414) ->
>>>>>>> master
                         eta_expand_with_type env t ty)))
  
let rec (elim_delayed_subst_term :
  FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t  ->
    let mk1 x =
      FStar_Syntax_Syntax.mk x FStar_Pervasives_Native.None
        t.FStar_Syntax_Syntax.pos
       in
    let t1 = FStar_Syntax_Subst.compress t  in
    let elim_bv x =
<<<<<<< HEAD
      let uu___3266_26278 = x  in
      let uu____26279 = elim_delayed_subst_term x.FStar_Syntax_Syntax.sort
         in
      {
        FStar_Syntax_Syntax.ppname =
          (uu___3266_26278.FStar_Syntax_Syntax.ppname);
        FStar_Syntax_Syntax.index =
          (uu___3266_26278.FStar_Syntax_Syntax.index);
        FStar_Syntax_Syntax.sort = uu____26279
      }  in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_delayed uu____26282 -> failwith "Impossible"
    | FStar_Syntax_Syntax.Tm_bvar uu____26306 -> t1
    | FStar_Syntax_Syntax.Tm_name uu____26307 -> t1
    | FStar_Syntax_Syntax.Tm_fvar uu____26308 -> t1
    | FStar_Syntax_Syntax.Tm_uinst uu____26309 -> t1
    | FStar_Syntax_Syntax.Tm_constant uu____26316 -> t1
    | FStar_Syntax_Syntax.Tm_type uu____26317 -> t1
    | FStar_Syntax_Syntax.Tm_lazy uu____26318 -> t1
    | FStar_Syntax_Syntax.Tm_unknown  -> t1
    | FStar_Syntax_Syntax.Tm_abs (bs,t2,rc_opt) ->
        let elim_rc rc =
          let uu___3292_26352 = rc  in
          let uu____26353 =
            FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
              elim_delayed_subst_term
             in
          let uu____26362 =
=======
      let uu___3276_26496 = x  in
      let uu____26497 = elim_delayed_subst_term x.FStar_Syntax_Syntax.sort
         in
      {
        FStar_Syntax_Syntax.ppname =
          (uu___3276_26496.FStar_Syntax_Syntax.ppname);
        FStar_Syntax_Syntax.index =
          (uu___3276_26496.FStar_Syntax_Syntax.index);
        FStar_Syntax_Syntax.sort = uu____26497
      }  in
    match t1.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Tm_delayed uu____26500 -> failwith "Impossible"
    | FStar_Syntax_Syntax.Tm_bvar uu____26524 -> t1
    | FStar_Syntax_Syntax.Tm_name uu____26525 -> t1
    | FStar_Syntax_Syntax.Tm_fvar uu____26526 -> t1
    | FStar_Syntax_Syntax.Tm_uinst uu____26527 -> t1
    | FStar_Syntax_Syntax.Tm_constant uu____26534 -> t1
    | FStar_Syntax_Syntax.Tm_type uu____26535 -> t1
    | FStar_Syntax_Syntax.Tm_lazy uu____26536 -> t1
    | FStar_Syntax_Syntax.Tm_unknown  -> t1
    | FStar_Syntax_Syntax.Tm_abs (bs,t2,rc_opt) ->
        let elim_rc rc =
          let uu___3302_26570 = rc  in
          let uu____26571 =
            FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
              elim_delayed_subst_term
             in
          let uu____26580 =
>>>>>>> master
            elim_delayed_subst_cflags rc.FStar_Syntax_Syntax.residual_flags
             in
          {
            FStar_Syntax_Syntax.residual_effect =
<<<<<<< HEAD
              (uu___3292_26352.FStar_Syntax_Syntax.residual_effect);
            FStar_Syntax_Syntax.residual_typ = uu____26353;
            FStar_Syntax_Syntax.residual_flags = uu____26362
          }  in
        let uu____26365 =
          let uu____26366 =
            let uu____26385 = elim_delayed_subst_binders bs  in
            let uu____26394 = elim_delayed_subst_term t2  in
            let uu____26397 = FStar_Util.map_opt rc_opt elim_rc  in
            (uu____26385, uu____26394, uu____26397)  in
          FStar_Syntax_Syntax.Tm_abs uu____26366  in
        mk1 uu____26365
    | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
        let uu____26434 =
          let uu____26435 =
            let uu____26450 = elim_delayed_subst_binders bs  in
            let uu____26459 = elim_delayed_subst_comp c  in
            (uu____26450, uu____26459)  in
          FStar_Syntax_Syntax.Tm_arrow uu____26435  in
        mk1 uu____26434
    | FStar_Syntax_Syntax.Tm_refine (bv,phi) ->
        let uu____26478 =
          let uu____26479 =
            let uu____26486 = elim_bv bv  in
            let uu____26487 = elim_delayed_subst_term phi  in
            (uu____26486, uu____26487)  in
          FStar_Syntax_Syntax.Tm_refine uu____26479  in
        mk1 uu____26478
    | FStar_Syntax_Syntax.Tm_app (t2,args) ->
        let uu____26518 =
          let uu____26519 =
            let uu____26536 = elim_delayed_subst_term t2  in
            let uu____26539 = elim_delayed_subst_args args  in
            (uu____26536, uu____26539)  in
          FStar_Syntax_Syntax.Tm_app uu____26519  in
        mk1 uu____26518
=======
              (uu___3302_26570.FStar_Syntax_Syntax.residual_effect);
            FStar_Syntax_Syntax.residual_typ = uu____26571;
            FStar_Syntax_Syntax.residual_flags = uu____26580
          }  in
        let uu____26583 =
          let uu____26584 =
            let uu____26603 = elim_delayed_subst_binders bs  in
            let uu____26612 = elim_delayed_subst_term t2  in
            let uu____26615 = FStar_Util.map_opt rc_opt elim_rc  in
            (uu____26603, uu____26612, uu____26615)  in
          FStar_Syntax_Syntax.Tm_abs uu____26584  in
        mk1 uu____26583
    | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
        let uu____26652 =
          let uu____26653 =
            let uu____26668 = elim_delayed_subst_binders bs  in
            let uu____26677 = elim_delayed_subst_comp c  in
            (uu____26668, uu____26677)  in
          FStar_Syntax_Syntax.Tm_arrow uu____26653  in
        mk1 uu____26652
    | FStar_Syntax_Syntax.Tm_refine (bv,phi) ->
        let uu____26696 =
          let uu____26697 =
            let uu____26704 = elim_bv bv  in
            let uu____26705 = elim_delayed_subst_term phi  in
            (uu____26704, uu____26705)  in
          FStar_Syntax_Syntax.Tm_refine uu____26697  in
        mk1 uu____26696
    | FStar_Syntax_Syntax.Tm_app (t2,args) ->
        let uu____26736 =
          let uu____26737 =
            let uu____26754 = elim_delayed_subst_term t2  in
            let uu____26757 = elim_delayed_subst_args args  in
            (uu____26754, uu____26757)  in
          FStar_Syntax_Syntax.Tm_app uu____26737  in
        mk1 uu____26736
>>>>>>> master
    | FStar_Syntax_Syntax.Tm_match (t2,branches) ->
        let rec elim_pat p =
          match p.FStar_Syntax_Syntax.v with
          | FStar_Syntax_Syntax.Pat_var x ->
<<<<<<< HEAD
              let uu___3314_26611 = p  in
              let uu____26612 =
                let uu____26613 = elim_bv x  in
                FStar_Syntax_Syntax.Pat_var uu____26613  in
              {
                FStar_Syntax_Syntax.v = uu____26612;
                FStar_Syntax_Syntax.p =
                  (uu___3314_26611.FStar_Syntax_Syntax.p)
              }
          | FStar_Syntax_Syntax.Pat_wild x ->
              let uu___3318_26615 = p  in
              let uu____26616 =
                let uu____26617 = elim_bv x  in
                FStar_Syntax_Syntax.Pat_wild uu____26617  in
              {
                FStar_Syntax_Syntax.v = uu____26616;
                FStar_Syntax_Syntax.p =
                  (uu___3318_26615.FStar_Syntax_Syntax.p)
              }
          | FStar_Syntax_Syntax.Pat_dot_term (x,t0) ->
              let uu___3324_26624 = p  in
              let uu____26625 =
                let uu____26626 =
                  let uu____26633 = elim_bv x  in
                  let uu____26634 = elim_delayed_subst_term t0  in
                  (uu____26633, uu____26634)  in
                FStar_Syntax_Syntax.Pat_dot_term uu____26626  in
              {
                FStar_Syntax_Syntax.v = uu____26625;
                FStar_Syntax_Syntax.p =
                  (uu___3324_26624.FStar_Syntax_Syntax.p)
              }
          | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
              let uu___3330_26659 = p  in
              let uu____26660 =
                let uu____26661 =
                  let uu____26675 =
                    FStar_List.map
                      (fun uu____26701  ->
                         match uu____26701 with
                         | (x,b) ->
                             let uu____26718 = elim_pat x  in
                             (uu____26718, b)) pats
                     in
                  (fv, uu____26675)  in
                FStar_Syntax_Syntax.Pat_cons uu____26661  in
              {
                FStar_Syntax_Syntax.v = uu____26660;
                FStar_Syntax_Syntax.p =
                  (uu___3330_26659.FStar_Syntax_Syntax.p)
              }
          | uu____26733 -> p  in
        let elim_branch uu____26757 =
          match uu____26757 with
          | (pat,wopt,t3) ->
              let uu____26783 = elim_pat pat  in
              let uu____26786 =
                FStar_Util.map_opt wopt elim_delayed_subst_term  in
              let uu____26789 = elim_delayed_subst_term t3  in
              (uu____26783, uu____26786, uu____26789)
           in
        let uu____26794 =
          let uu____26795 =
            let uu____26818 = elim_delayed_subst_term t2  in
            let uu____26821 = FStar_List.map elim_branch branches  in
            (uu____26818, uu____26821)  in
          FStar_Syntax_Syntax.Tm_match uu____26795  in
        mk1 uu____26794
    | FStar_Syntax_Syntax.Tm_ascribed (t2,a,lopt) ->
        let elim_ascription uu____26952 =
          match uu____26952 with
          | (tc,topt) ->
              let uu____26987 =
                match tc with
                | FStar_Util.Inl t3 ->
                    let uu____26997 = elim_delayed_subst_term t3  in
                    FStar_Util.Inl uu____26997
                | FStar_Util.Inr c ->
                    let uu____26999 = elim_delayed_subst_comp c  in
                    FStar_Util.Inr uu____26999
                 in
              let uu____27000 =
                FStar_Util.map_opt topt elim_delayed_subst_term  in
              (uu____26987, uu____27000)
           in
        let uu____27009 =
          let uu____27010 =
            let uu____27037 = elim_delayed_subst_term t2  in
            let uu____27040 = elim_ascription a  in
            (uu____27037, uu____27040, lopt)  in
          FStar_Syntax_Syntax.Tm_ascribed uu____27010  in
        mk1 uu____27009
    | FStar_Syntax_Syntax.Tm_let (lbs,t2) ->
        let elim_lb lb =
          let uu___3360_27103 = lb  in
          let uu____27104 =
            elim_delayed_subst_term lb.FStar_Syntax_Syntax.lbtyp  in
          let uu____27107 =
            elim_delayed_subst_term lb.FStar_Syntax_Syntax.lbdef  in
          {
            FStar_Syntax_Syntax.lbname =
              (uu___3360_27103.FStar_Syntax_Syntax.lbname);
            FStar_Syntax_Syntax.lbunivs =
              (uu___3360_27103.FStar_Syntax_Syntax.lbunivs);
            FStar_Syntax_Syntax.lbtyp = uu____27104;
            FStar_Syntax_Syntax.lbeff =
              (uu___3360_27103.FStar_Syntax_Syntax.lbeff);
            FStar_Syntax_Syntax.lbdef = uu____27107;
            FStar_Syntax_Syntax.lbattrs =
              (uu___3360_27103.FStar_Syntax_Syntax.lbattrs);
            FStar_Syntax_Syntax.lbpos =
              (uu___3360_27103.FStar_Syntax_Syntax.lbpos)
          }  in
        let uu____27110 =
          let uu____27111 =
            let uu____27125 =
              let uu____27133 =
                FStar_List.map elim_lb (FStar_Pervasives_Native.snd lbs)  in
              ((FStar_Pervasives_Native.fst lbs), uu____27133)  in
            let uu____27145 = elim_delayed_subst_term t2  in
            (uu____27125, uu____27145)  in
          FStar_Syntax_Syntax.Tm_let uu____27111  in
        mk1 uu____27110
=======
              let uu___3324_26829 = p  in
              let uu____26830 =
                let uu____26831 = elim_bv x  in
                FStar_Syntax_Syntax.Pat_var uu____26831  in
              {
                FStar_Syntax_Syntax.v = uu____26830;
                FStar_Syntax_Syntax.p =
                  (uu___3324_26829.FStar_Syntax_Syntax.p)
              }
          | FStar_Syntax_Syntax.Pat_wild x ->
              let uu___3328_26833 = p  in
              let uu____26834 =
                let uu____26835 = elim_bv x  in
                FStar_Syntax_Syntax.Pat_wild uu____26835  in
              {
                FStar_Syntax_Syntax.v = uu____26834;
                FStar_Syntax_Syntax.p =
                  (uu___3328_26833.FStar_Syntax_Syntax.p)
              }
          | FStar_Syntax_Syntax.Pat_dot_term (x,t0) ->
              let uu___3334_26842 = p  in
              let uu____26843 =
                let uu____26844 =
                  let uu____26851 = elim_bv x  in
                  let uu____26852 = elim_delayed_subst_term t0  in
                  (uu____26851, uu____26852)  in
                FStar_Syntax_Syntax.Pat_dot_term uu____26844  in
              {
                FStar_Syntax_Syntax.v = uu____26843;
                FStar_Syntax_Syntax.p =
                  (uu___3334_26842.FStar_Syntax_Syntax.p)
              }
          | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
              let uu___3340_26877 = p  in
              let uu____26878 =
                let uu____26879 =
                  let uu____26893 =
                    FStar_List.map
                      (fun uu____26919  ->
                         match uu____26919 with
                         | (x,b) ->
                             let uu____26936 = elim_pat x  in
                             (uu____26936, b)) pats
                     in
                  (fv, uu____26893)  in
                FStar_Syntax_Syntax.Pat_cons uu____26879  in
              {
                FStar_Syntax_Syntax.v = uu____26878;
                FStar_Syntax_Syntax.p =
                  (uu___3340_26877.FStar_Syntax_Syntax.p)
              }
          | uu____26951 -> p  in
        let elim_branch uu____26975 =
          match uu____26975 with
          | (pat,wopt,t3) ->
              let uu____27001 = elim_pat pat  in
              let uu____27004 =
                FStar_Util.map_opt wopt elim_delayed_subst_term  in
              let uu____27007 = elim_delayed_subst_term t3  in
              (uu____27001, uu____27004, uu____27007)
           in
        let uu____27012 =
          let uu____27013 =
            let uu____27036 = elim_delayed_subst_term t2  in
            let uu____27039 = FStar_List.map elim_branch branches  in
            (uu____27036, uu____27039)  in
          FStar_Syntax_Syntax.Tm_match uu____27013  in
        mk1 uu____27012
    | FStar_Syntax_Syntax.Tm_ascribed (t2,a,lopt) ->
        let elim_ascription uu____27170 =
          match uu____27170 with
          | (tc,topt) ->
              let uu____27205 =
                match tc with
                | FStar_Util.Inl t3 ->
                    let uu____27215 = elim_delayed_subst_term t3  in
                    FStar_Util.Inl uu____27215
                | FStar_Util.Inr c ->
                    let uu____27217 = elim_delayed_subst_comp c  in
                    FStar_Util.Inr uu____27217
                 in
              let uu____27218 =
                FStar_Util.map_opt topt elim_delayed_subst_term  in
              (uu____27205, uu____27218)
           in
        let uu____27227 =
          let uu____27228 =
            let uu____27255 = elim_delayed_subst_term t2  in
            let uu____27258 = elim_ascription a  in
            (uu____27255, uu____27258, lopt)  in
          FStar_Syntax_Syntax.Tm_ascribed uu____27228  in
        mk1 uu____27227
    | FStar_Syntax_Syntax.Tm_let (lbs,t2) ->
        let elim_lb lb =
          let uu___3370_27321 = lb  in
          let uu____27322 =
            elim_delayed_subst_term lb.FStar_Syntax_Syntax.lbtyp  in
          let uu____27325 =
            elim_delayed_subst_term lb.FStar_Syntax_Syntax.lbdef  in
          {
            FStar_Syntax_Syntax.lbname =
              (uu___3370_27321.FStar_Syntax_Syntax.lbname);
            FStar_Syntax_Syntax.lbunivs =
              (uu___3370_27321.FStar_Syntax_Syntax.lbunivs);
            FStar_Syntax_Syntax.lbtyp = uu____27322;
            FStar_Syntax_Syntax.lbeff =
              (uu___3370_27321.FStar_Syntax_Syntax.lbeff);
            FStar_Syntax_Syntax.lbdef = uu____27325;
            FStar_Syntax_Syntax.lbattrs =
              (uu___3370_27321.FStar_Syntax_Syntax.lbattrs);
            FStar_Syntax_Syntax.lbpos =
              (uu___3370_27321.FStar_Syntax_Syntax.lbpos)
          }  in
        let uu____27328 =
          let uu____27329 =
            let uu____27343 =
              let uu____27351 =
                FStar_List.map elim_lb (FStar_Pervasives_Native.snd lbs)  in
              ((FStar_Pervasives_Native.fst lbs), uu____27351)  in
            let uu____27363 = elim_delayed_subst_term t2  in
            (uu____27343, uu____27363)  in
          FStar_Syntax_Syntax.Tm_let uu____27329  in
        mk1 uu____27328
>>>>>>> master
    | FStar_Syntax_Syntax.Tm_uvar (u,s) ->
        mk1 (FStar_Syntax_Syntax.Tm_uvar (u, s))
    | FStar_Syntax_Syntax.Tm_quoted (tm,qi) ->
        let qi1 =
          FStar_Syntax_Syntax.on_antiquoted elim_delayed_subst_term qi  in
<<<<<<< HEAD
        let uu____27190 =
          let uu____27191 =
            let uu____27198 = elim_delayed_subst_term tm  in
            (uu____27198, qi1)  in
          FStar_Syntax_Syntax.Tm_quoted uu____27191  in
        mk1 uu____27190
    | FStar_Syntax_Syntax.Tm_meta (t2,md) ->
        let uu____27209 =
          let uu____27210 =
            let uu____27217 = elim_delayed_subst_term t2  in
            let uu____27220 = elim_delayed_subst_meta md  in
            (uu____27217, uu____27220)  in
          FStar_Syntax_Syntax.Tm_meta uu____27210  in
        mk1 uu____27209
=======
        let uu____27408 =
          let uu____27409 =
            let uu____27416 = elim_delayed_subst_term tm  in
            (uu____27416, qi1)  in
          FStar_Syntax_Syntax.Tm_quoted uu____27409  in
        mk1 uu____27408
    | FStar_Syntax_Syntax.Tm_meta (t2,md) ->
        let uu____27427 =
          let uu____27428 =
            let uu____27435 = elim_delayed_subst_term t2  in
            let uu____27438 = elim_delayed_subst_meta md  in
            (uu____27435, uu____27438)  in
          FStar_Syntax_Syntax.Tm_meta uu____27428  in
        mk1 uu____27427
>>>>>>> master

and (elim_delayed_subst_cflags :
  FStar_Syntax_Syntax.cflag Prims.list ->
    FStar_Syntax_Syntax.cflag Prims.list)
  =
  fun flags  ->
    FStar_List.map
<<<<<<< HEAD
      (fun uu___18_27229  ->
         match uu___18_27229 with
         | FStar_Syntax_Syntax.DECREASES t ->
             let uu____27233 = elim_delayed_subst_term t  in
             FStar_Syntax_Syntax.DECREASES uu____27233
=======
      (fun uu___18_27447  ->
         match uu___18_27447 with
         | FStar_Syntax_Syntax.DECREASES t ->
             let uu____27451 = elim_delayed_subst_term t  in
             FStar_Syntax_Syntax.DECREASES uu____27451
>>>>>>> master
         | f -> f) flags

and (elim_delayed_subst_comp :
  FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp) =
  fun c  ->
    let mk1 x =
      FStar_Syntax_Syntax.mk x FStar_Pervasives_Native.None
        c.FStar_Syntax_Syntax.pos
       in
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Total (t,uopt) ->
<<<<<<< HEAD
        let uu____27256 =
          let uu____27257 =
            let uu____27266 = elim_delayed_subst_term t  in
            (uu____27266, uopt)  in
          FStar_Syntax_Syntax.Total uu____27257  in
        mk1 uu____27256
    | FStar_Syntax_Syntax.GTotal (t,uopt) ->
        let uu____27283 =
          let uu____27284 =
            let uu____27293 = elim_delayed_subst_term t  in
            (uu____27293, uopt)  in
          FStar_Syntax_Syntax.GTotal uu____27284  in
        mk1 uu____27283
    | FStar_Syntax_Syntax.Comp ct ->
        let ct1 =
          let uu___3393_27302 = ct  in
          let uu____27303 =
            elim_delayed_subst_term ct.FStar_Syntax_Syntax.result_typ  in
          let uu____27306 =
            elim_delayed_subst_args ct.FStar_Syntax_Syntax.effect_args  in
          let uu____27317 =
            elim_delayed_subst_cflags ct.FStar_Syntax_Syntax.flags  in
          {
            FStar_Syntax_Syntax.comp_univs =
              (uu___3393_27302.FStar_Syntax_Syntax.comp_univs);
            FStar_Syntax_Syntax.effect_name =
              (uu___3393_27302.FStar_Syntax_Syntax.effect_name);
            FStar_Syntax_Syntax.result_typ = uu____27303;
            FStar_Syntax_Syntax.effect_args = uu____27306;
            FStar_Syntax_Syntax.flags = uu____27317
=======
        let uu____27474 =
          let uu____27475 =
            let uu____27484 = elim_delayed_subst_term t  in
            (uu____27484, uopt)  in
          FStar_Syntax_Syntax.Total uu____27475  in
        mk1 uu____27474
    | FStar_Syntax_Syntax.GTotal (t,uopt) ->
        let uu____27501 =
          let uu____27502 =
            let uu____27511 = elim_delayed_subst_term t  in
            (uu____27511, uopt)  in
          FStar_Syntax_Syntax.GTotal uu____27502  in
        mk1 uu____27501
    | FStar_Syntax_Syntax.Comp ct ->
        let ct1 =
          let uu___3403_27520 = ct  in
          let uu____27521 =
            elim_delayed_subst_term ct.FStar_Syntax_Syntax.result_typ  in
          let uu____27524 =
            elim_delayed_subst_args ct.FStar_Syntax_Syntax.effect_args  in
          let uu____27535 =
            elim_delayed_subst_cflags ct.FStar_Syntax_Syntax.flags  in
          {
            FStar_Syntax_Syntax.comp_univs =
              (uu___3403_27520.FStar_Syntax_Syntax.comp_univs);
            FStar_Syntax_Syntax.effect_name =
              (uu___3403_27520.FStar_Syntax_Syntax.effect_name);
            FStar_Syntax_Syntax.result_typ = uu____27521;
            FStar_Syntax_Syntax.effect_args = uu____27524;
            FStar_Syntax_Syntax.flags = uu____27535
>>>>>>> master
          }  in
        mk1 (FStar_Syntax_Syntax.Comp ct1)

and (elim_delayed_subst_meta :
  FStar_Syntax_Syntax.metadata -> FStar_Syntax_Syntax.metadata) =
<<<<<<< HEAD
  fun uu___19_27320  ->
    match uu___19_27320 with
    | FStar_Syntax_Syntax.Meta_pattern args ->
        let uu____27334 = FStar_List.map elim_delayed_subst_args args  in
        FStar_Syntax_Syntax.Meta_pattern uu____27334
    | FStar_Syntax_Syntax.Meta_monadic (m,t) ->
        let uu____27373 =
          let uu____27380 = elim_delayed_subst_term t  in (m, uu____27380)
           in
        FStar_Syntax_Syntax.Meta_monadic uu____27373
    | FStar_Syntax_Syntax.Meta_monadic_lift (m1,m2,t) ->
        let uu____27392 =
          let uu____27401 = elim_delayed_subst_term t  in
          (m1, m2, uu____27401)  in
        FStar_Syntax_Syntax.Meta_monadic_lift uu____27392
=======
  fun uu___19_27538  ->
    match uu___19_27538 with
    | FStar_Syntax_Syntax.Meta_pattern (names1,args) ->
        let uu____27573 =
          let uu____27594 = FStar_List.map elim_delayed_subst_term names1  in
          let uu____27603 = FStar_List.map elim_delayed_subst_args args  in
          (uu____27594, uu____27603)  in
        FStar_Syntax_Syntax.Meta_pattern uu____27573
    | FStar_Syntax_Syntax.Meta_monadic (m,t) ->
        let uu____27658 =
          let uu____27665 = elim_delayed_subst_term t  in (m, uu____27665)
           in
        FStar_Syntax_Syntax.Meta_monadic uu____27658
    | FStar_Syntax_Syntax.Meta_monadic_lift (m1,m2,t) ->
        let uu____27677 =
          let uu____27686 = elim_delayed_subst_term t  in
          (m1, m2, uu____27686)  in
        FStar_Syntax_Syntax.Meta_monadic_lift uu____27677
>>>>>>> master
    | m -> m

and (elim_delayed_subst_args :
  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax *
    FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)
    Prims.list ->
    (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax *
      FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)
      Prims.list)
  =
  fun args  ->
    FStar_List.map
<<<<<<< HEAD
      (fun uu____27434  ->
         match uu____27434 with
         | (t,q) ->
             let uu____27453 = elim_delayed_subst_term t  in (uu____27453, q))
=======
      (fun uu____27719  ->
         match uu____27719 with
         | (t,q) ->
             let uu____27738 = elim_delayed_subst_term t  in (uu____27738, q))
>>>>>>> master
      args

and (elim_delayed_subst_binders :
  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier
    FStar_Pervasives_Native.option) Prims.list ->
    (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier
      FStar_Pervasives_Native.option) Prims.list)
  =
  fun bs  ->
    FStar_List.map
<<<<<<< HEAD
      (fun uu____27481  ->
         match uu____27481 with
         | (x,q) ->
             let uu____27500 =
               let uu___3417_27501 = x  in
               let uu____27502 =
                 elim_delayed_subst_term x.FStar_Syntax_Syntax.sort  in
               {
                 FStar_Syntax_Syntax.ppname =
                   (uu___3417_27501.FStar_Syntax_Syntax.ppname);
                 FStar_Syntax_Syntax.index =
                   (uu___3417_27501.FStar_Syntax_Syntax.index);
                 FStar_Syntax_Syntax.sort = uu____27502
               }  in
             (uu____27500, q)) bs
=======
      (fun uu____27766  ->
         match uu____27766 with
         | (x,q) ->
             let uu____27785 =
               let uu___3429_27786 = x  in
               let uu____27787 =
                 elim_delayed_subst_term x.FStar_Syntax_Syntax.sort  in
               {
                 FStar_Syntax_Syntax.ppname =
                   (uu___3429_27786.FStar_Syntax_Syntax.ppname);
                 FStar_Syntax_Syntax.index =
                   (uu___3429_27786.FStar_Syntax_Syntax.index);
                 FStar_Syntax_Syntax.sort = uu____27787
               }  in
             (uu____27785, q)) bs
>>>>>>> master

let (elim_uvars_aux_tc :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.univ_names ->
      FStar_Syntax_Syntax.binders ->
        (FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.comp) FStar_Util.either
          ->
          (FStar_Syntax_Syntax.univ_names * (FStar_Syntax_Syntax.bv *
            FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)
            Prims.list *
            (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax,FStar_Syntax_Syntax.comp'
                                                                    FStar_Syntax_Syntax.syntax)
            FStar_Util.either))
  =
  fun env  ->
    fun univ_names  ->
      fun binders  ->
        fun tc  ->
          let t =
            match (binders, tc) with
            | ([],FStar_Util.Inl t) -> t
            | ([],FStar_Util.Inr c) ->
                failwith "Impossible: empty bindes with a comp"
<<<<<<< HEAD
            | (uu____27610,FStar_Util.Inr c) ->
                FStar_Syntax_Syntax.mk
                  (FStar_Syntax_Syntax.Tm_arrow (binders, c))
                  FStar_Pervasives_Native.None c.FStar_Syntax_Syntax.pos
            | (uu____27642,FStar_Util.Inl t) ->
                let uu____27664 =
                  let uu____27671 =
                    let uu____27672 =
                      let uu____27687 = FStar_Syntax_Syntax.mk_Total t  in
                      (binders, uu____27687)  in
                    FStar_Syntax_Syntax.Tm_arrow uu____27672  in
                  FStar_Syntax_Syntax.mk uu____27671  in
                uu____27664 FStar_Pervasives_Native.None
                  t.FStar_Syntax_Syntax.pos
             in
          let uu____27700 = FStar_Syntax_Subst.open_univ_vars univ_names t
             in
          match uu____27700 with
=======
            | (uu____27895,FStar_Util.Inr c) ->
                FStar_Syntax_Syntax.mk
                  (FStar_Syntax_Syntax.Tm_arrow (binders, c))
                  FStar_Pervasives_Native.None c.FStar_Syntax_Syntax.pos
            | (uu____27927,FStar_Util.Inl t) ->
                let uu____27949 =
                  let uu____27956 =
                    let uu____27957 =
                      let uu____27972 = FStar_Syntax_Syntax.mk_Total t  in
                      (binders, uu____27972)  in
                    FStar_Syntax_Syntax.Tm_arrow uu____27957  in
                  FStar_Syntax_Syntax.mk uu____27956  in
                uu____27949 FStar_Pervasives_Native.None
                  t.FStar_Syntax_Syntax.pos
             in
          let uu____27985 = FStar_Syntax_Subst.open_univ_vars univ_names t
             in
          match uu____27985 with
>>>>>>> master
          | (univ_names1,t1) ->
              let t2 = remove_uvar_solutions env t1  in
              let t3 = FStar_Syntax_Subst.close_univ_vars univ_names1 t2  in
              let t4 = elim_delayed_subst_term t3  in
<<<<<<< HEAD
              let uu____27732 =
                match binders with
                | [] -> ([], (FStar_Util.Inl t4))
                | uu____27805 ->
                    let uu____27806 =
                      let uu____27815 =
                        let uu____27816 = FStar_Syntax_Subst.compress t4  in
                        uu____27816.FStar_Syntax_Syntax.n  in
                      (uu____27815, tc)  in
                    (match uu____27806 with
                     | (FStar_Syntax_Syntax.Tm_arrow
                        (binders1,c),FStar_Util.Inr uu____27845) ->
                         (binders1, (FStar_Util.Inr c))
                     | (FStar_Syntax_Syntax.Tm_arrow
                        (binders1,c),FStar_Util.Inl uu____27892) ->
                         (binders1,
                           (FStar_Util.Inl (FStar_Syntax_Util.comp_result c)))
                     | (uu____27937,FStar_Util.Inl uu____27938) ->
                         ([], (FStar_Util.Inl t4))
                     | uu____27969 -> failwith "Impossible")
                 in
              (match uu____27732 with
=======
              let uu____28017 =
                match binders with
                | [] -> ([], (FStar_Util.Inl t4))
                | uu____28090 ->
                    let uu____28091 =
                      let uu____28100 =
                        let uu____28101 = FStar_Syntax_Subst.compress t4  in
                        uu____28101.FStar_Syntax_Syntax.n  in
                      (uu____28100, tc)  in
                    (match uu____28091 with
                     | (FStar_Syntax_Syntax.Tm_arrow
                        (binders1,c),FStar_Util.Inr uu____28130) ->
                         (binders1, (FStar_Util.Inr c))
                     | (FStar_Syntax_Syntax.Tm_arrow
                        (binders1,c),FStar_Util.Inl uu____28177) ->
                         (binders1,
                           (FStar_Util.Inl (FStar_Syntax_Util.comp_result c)))
                     | (uu____28222,FStar_Util.Inl uu____28223) ->
                         ([], (FStar_Util.Inl t4))
                     | uu____28254 -> failwith "Impossible")
                 in
              (match uu____28017 with
>>>>>>> master
               | (binders1,tc1) -> (univ_names1, binders1, tc1))
  
let (elim_uvars_aux_t :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.univ_names ->
      FStar_Syntax_Syntax.binders ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.univ_names * (FStar_Syntax_Syntax.bv *
            FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)
            Prims.list * FStar_Syntax_Syntax.term'
            FStar_Syntax_Syntax.syntax))
  =
  fun env  ->
    fun univ_names  ->
      fun binders  ->
        fun t  ->
<<<<<<< HEAD
          let uu____28108 =
            elim_uvars_aux_tc env univ_names binders (FStar_Util.Inl t)  in
          match uu____28108 with
          | (univ_names1,binders1,tc) ->
              let uu____28182 = FStar_Util.left tc  in
              (univ_names1, binders1, uu____28182)
=======
          let uu____28393 =
            elim_uvars_aux_tc env univ_names binders (FStar_Util.Inl t)  in
          match uu____28393 with
          | (univ_names1,binders1,tc) ->
              let uu____28467 = FStar_Util.left tc  in
              (univ_names1, binders1, uu____28467)
>>>>>>> master
  
let (elim_uvars_aux_c :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.univ_names ->
      FStar_Syntax_Syntax.binders ->
        FStar_Syntax_Syntax.comp ->
          (FStar_Syntax_Syntax.univ_names * (FStar_Syntax_Syntax.bv *
            FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)
            Prims.list * FStar_Syntax_Syntax.comp'
            FStar_Syntax_Syntax.syntax))
  =
  fun env  ->
    fun univ_names  ->
      fun binders  ->
        fun c  ->
<<<<<<< HEAD
          let uu____28236 =
            elim_uvars_aux_tc env univ_names binders (FStar_Util.Inr c)  in
          match uu____28236 with
          | (univ_names1,binders1,tc) ->
              let uu____28310 = FStar_Util.right tc  in
              (univ_names1, binders1, uu____28310)
=======
          let uu____28521 =
            elim_uvars_aux_tc env univ_names binders (FStar_Util.Inr c)  in
          match uu____28521 with
          | (univ_names1,binders1,tc) ->
              let uu____28595 = FStar_Util.right tc  in
              (univ_names1, binders1, uu____28595)
>>>>>>> master
  
let rec (elim_uvars :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.sigelt -> FStar_Syntax_Syntax.sigelt)
  =
  fun env  ->
    fun s  ->
      match s.FStar_Syntax_Syntax.sigel with
      | FStar_Syntax_Syntax.Sig_inductive_typ
          (lid,univ_names,binders,typ,lids,lids') ->
<<<<<<< HEAD
          let uu____28352 = elim_uvars_aux_t env univ_names binders typ  in
          (match uu____28352 with
           | (univ_names1,binders1,typ1) ->
               let uu___3500_28392 = s  in
=======
          let uu____28637 = elim_uvars_aux_t env univ_names binders typ  in
          (match uu____28637 with
           | (univ_names1,binders1,typ1) ->
               let uu___3512_28677 = s  in
>>>>>>> master
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_inductive_typ
                      (lid, univ_names1, binders1, typ1, lids, lids'));
                 FStar_Syntax_Syntax.sigrng =
<<<<<<< HEAD
                   (uu___3500_28392.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___3500_28392.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___3500_28392.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___3500_28392.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_bundle (sigs,lids) ->
          let uu___3506_28407 = s  in
          let uu____28408 =
            let uu____28409 =
              let uu____28418 = FStar_List.map (elim_uvars env) sigs  in
              (uu____28418, lids)  in
            FStar_Syntax_Syntax.Sig_bundle uu____28409  in
          {
            FStar_Syntax_Syntax.sigel = uu____28408;
            FStar_Syntax_Syntax.sigrng =
              (uu___3506_28407.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___3506_28407.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___3506_28407.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___3506_28407.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_datacon (lid,univ_names,typ,lident,i,lids) ->
          let uu____28437 = elim_uvars_aux_t env univ_names [] typ  in
          (match uu____28437 with
           | (univ_names1,uu____28461,typ1) ->
               let uu___3520_28483 = s  in
=======
                   (uu___3512_28677.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___3512_28677.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___3512_28677.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___3512_28677.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_bundle (sigs,lids) ->
          let uu___3518_28692 = s  in
          let uu____28693 =
            let uu____28694 =
              let uu____28703 = FStar_List.map (elim_uvars env) sigs  in
              (uu____28703, lids)  in
            FStar_Syntax_Syntax.Sig_bundle uu____28694  in
          {
            FStar_Syntax_Syntax.sigel = uu____28693;
            FStar_Syntax_Syntax.sigrng =
              (uu___3518_28692.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___3518_28692.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___3518_28692.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___3518_28692.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_datacon (lid,univ_names,typ,lident,i,lids) ->
          let uu____28722 = elim_uvars_aux_t env univ_names [] typ  in
          (match uu____28722 with
           | (univ_names1,uu____28746,typ1) ->
               let uu___3532_28768 = s  in
>>>>>>> master
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_datacon
                      (lid, univ_names1, typ1, lident, i, lids));
                 FStar_Syntax_Syntax.sigrng =
<<<<<<< HEAD
                   (uu___3520_28483.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___3520_28483.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___3520_28483.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___3520_28483.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_declare_typ (lid,univ_names,typ) ->
          let uu____28490 = elim_uvars_aux_t env univ_names [] typ  in
          (match uu____28490 with
           | (univ_names1,uu____28514,typ1) ->
               let uu___3531_28536 = s  in
=======
                   (uu___3532_28768.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___3532_28768.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___3532_28768.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___3532_28768.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_declare_typ (lid,univ_names,typ) ->
          let uu____28775 = elim_uvars_aux_t env univ_names [] typ  in
          (match uu____28775 with
           | (univ_names1,uu____28799,typ1) ->
               let uu___3543_28821 = s  in
>>>>>>> master
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_declare_typ
                      (lid, univ_names1, typ1));
                 FStar_Syntax_Syntax.sigrng =
<<<<<<< HEAD
                   (uu___3531_28536.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___3531_28536.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___3531_28536.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___3531_28536.FStar_Syntax_Syntax.sigattrs)
=======
                   (uu___3543_28821.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___3543_28821.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___3543_28821.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___3543_28821.FStar_Syntax_Syntax.sigattrs)
>>>>>>> master
               })
      | FStar_Syntax_Syntax.Sig_let ((b,lbs),lids) ->
          let lbs1 =
            FStar_All.pipe_right lbs
              (FStar_List.map
                 (fun lb  ->
<<<<<<< HEAD
                    let uu____28566 =
                      FStar_Syntax_Subst.univ_var_opening
                        lb.FStar_Syntax_Syntax.lbunivs
                       in
                    match uu____28566 with
                    | (opening,lbunivs) ->
                        let elim t =
                          let uu____28591 =
                            let uu____28592 =
                              let uu____28593 =
                                FStar_Syntax_Subst.subst opening t  in
                              remove_uvar_solutions env uu____28593  in
                            FStar_Syntax_Subst.close_univ_vars lbunivs
                              uu____28592
                             in
                          elim_delayed_subst_term uu____28591  in
                        let lbtyp = elim lb.FStar_Syntax_Syntax.lbtyp  in
                        let lbdef = elim lb.FStar_Syntax_Syntax.lbdef  in
                        let uu___3547_28596 = lb  in
                        {
                          FStar_Syntax_Syntax.lbname =
                            (uu___3547_28596.FStar_Syntax_Syntax.lbname);
                          FStar_Syntax_Syntax.lbunivs = lbunivs;
                          FStar_Syntax_Syntax.lbtyp = lbtyp;
                          FStar_Syntax_Syntax.lbeff =
                            (uu___3547_28596.FStar_Syntax_Syntax.lbeff);
                          FStar_Syntax_Syntax.lbdef = lbdef;
                          FStar_Syntax_Syntax.lbattrs =
                            (uu___3547_28596.FStar_Syntax_Syntax.lbattrs);
                          FStar_Syntax_Syntax.lbpos =
                            (uu___3547_28596.FStar_Syntax_Syntax.lbpos)
                        }))
             in
          let uu___3550_28597 = s  in
=======
                    let uu____28851 =
                      FStar_Syntax_Subst.univ_var_opening
                        lb.FStar_Syntax_Syntax.lbunivs
                       in
                    match uu____28851 with
                    | (opening,lbunivs) ->
                        let elim t =
                          let uu____28876 =
                            let uu____28877 =
                              let uu____28878 =
                                FStar_Syntax_Subst.subst opening t  in
                              remove_uvar_solutions env uu____28878  in
                            FStar_Syntax_Subst.close_univ_vars lbunivs
                              uu____28877
                             in
                          elim_delayed_subst_term uu____28876  in
                        let lbtyp = elim lb.FStar_Syntax_Syntax.lbtyp  in
                        let lbdef = elim lb.FStar_Syntax_Syntax.lbdef  in
                        let uu___3559_28881 = lb  in
                        {
                          FStar_Syntax_Syntax.lbname =
                            (uu___3559_28881.FStar_Syntax_Syntax.lbname);
                          FStar_Syntax_Syntax.lbunivs = lbunivs;
                          FStar_Syntax_Syntax.lbtyp = lbtyp;
                          FStar_Syntax_Syntax.lbeff =
                            (uu___3559_28881.FStar_Syntax_Syntax.lbeff);
                          FStar_Syntax_Syntax.lbdef = lbdef;
                          FStar_Syntax_Syntax.lbattrs =
                            (uu___3559_28881.FStar_Syntax_Syntax.lbattrs);
                          FStar_Syntax_Syntax.lbpos =
                            (uu___3559_28881.FStar_Syntax_Syntax.lbpos)
                        }))
             in
          let uu___3562_28882 = s  in
>>>>>>> master
          {
            FStar_Syntax_Syntax.sigel =
              (FStar_Syntax_Syntax.Sig_let ((b, lbs1), lids));
            FStar_Syntax_Syntax.sigrng =
<<<<<<< HEAD
              (uu___3550_28597.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___3550_28597.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___3550_28597.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___3550_28597.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_main t ->
          let uu___3554_28604 = s  in
          let uu____28605 =
            let uu____28606 = remove_uvar_solutions env t  in
            FStar_Syntax_Syntax.Sig_main uu____28606  in
          {
            FStar_Syntax_Syntax.sigel = uu____28605;
            FStar_Syntax_Syntax.sigrng =
              (uu___3554_28604.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___3554_28604.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___3554_28604.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___3554_28604.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_assume (l,us,t) ->
          let uu____28610 = elim_uvars_aux_t env us [] t  in
          (match uu____28610 with
           | (us1,uu____28634,t1) ->
               let uu___3565_28656 = s  in
=======
              (uu___3562_28882.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___3562_28882.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___3562_28882.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___3562_28882.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_main t ->
          let uu___3566_28889 = s  in
          let uu____28890 =
            let uu____28891 = remove_uvar_solutions env t  in
            FStar_Syntax_Syntax.Sig_main uu____28891  in
          {
            FStar_Syntax_Syntax.sigel = uu____28890;
            FStar_Syntax_Syntax.sigrng =
              (uu___3566_28889.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___3566_28889.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___3566_28889.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___3566_28889.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_assume (l,us,t) ->
          let uu____28895 = elim_uvars_aux_t env us [] t  in
          (match uu____28895 with
           | (us1,uu____28919,t1) ->
               let uu___3577_28941 = s  in
>>>>>>> master
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_assume (l, us1, t1));
                 FStar_Syntax_Syntax.sigrng =
<<<<<<< HEAD
                   (uu___3565_28656.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___3565_28656.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___3565_28656.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___3565_28656.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____28657 ->
          failwith "Impossible: should have been desugared already"
      | FStar_Syntax_Syntax.Sig_new_effect ed ->
          let uu____28660 =
            elim_uvars_aux_t env ed.FStar_Syntax_Syntax.univs
              ed.FStar_Syntax_Syntax.binders ed.FStar_Syntax_Syntax.signature
             in
          (match uu____28660 with
           | (univs1,binders,signature) ->
               let uu____28700 =
                 let uu____28705 = FStar_Syntax_Subst.univ_var_opening univs1
                    in
                 match uu____28705 with
                 | (univs_opening,univs2) ->
                     let uu____28728 =
                       FStar_Syntax_Subst.univ_var_closing univs2  in
                     (univs_opening, uu____28728)
                  in
               (match uu____28700 with
                | (univs_opening,univs_closing) ->
                    let uu____28731 =
                      let binders1 = FStar_Syntax_Subst.open_binders binders
                         in
                      let uu____28737 =
                        FStar_Syntax_Subst.opening_of_binders binders1  in
                      let uu____28738 =
                        FStar_Syntax_Subst.closing_of_binders binders1  in
                      (uu____28737, uu____28738)  in
                    (match uu____28731 with
                     | (b_opening,b_closing) ->
                         let n1 = FStar_List.length univs1  in
                         let n_binders = FStar_List.length binders  in
                         let elim_tscheme uu____28764 =
                           match uu____28764 with
                           | (us,t) ->
                               let n_us = FStar_List.length us  in
                               let uu____28782 =
                                 FStar_Syntax_Subst.open_univ_vars us t  in
                               (match uu____28782 with
                                | (us1,t1) ->
                                    let uu____28793 =
                                      let uu____28802 =
=======
                   (uu___3577_28941.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___3577_28941.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___3577_28941.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___3577_28941.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____28942 ->
          failwith "Impossible: should have been desugared already"
      | FStar_Syntax_Syntax.Sig_new_effect ed ->
          let uu____28945 =
            elim_uvars_aux_t env ed.FStar_Syntax_Syntax.univs
              ed.FStar_Syntax_Syntax.binders ed.FStar_Syntax_Syntax.signature
             in
          (match uu____28945 with
           | (univs1,binders,signature) ->
               let uu____28985 =
                 let uu____28990 = FStar_Syntax_Subst.univ_var_opening univs1
                    in
                 match uu____28990 with
                 | (univs_opening,univs2) ->
                     let uu____29013 =
                       FStar_Syntax_Subst.univ_var_closing univs2  in
                     (univs_opening, uu____29013)
                  in
               (match uu____28985 with
                | (univs_opening,univs_closing) ->
                    let uu____29016 =
                      let binders1 = FStar_Syntax_Subst.open_binders binders
                         in
                      let uu____29022 =
                        FStar_Syntax_Subst.opening_of_binders binders1  in
                      let uu____29023 =
                        FStar_Syntax_Subst.closing_of_binders binders1  in
                      (uu____29022, uu____29023)  in
                    (match uu____29016 with
                     | (b_opening,b_closing) ->
                         let n1 = FStar_List.length univs1  in
                         let n_binders = FStar_List.length binders  in
                         let elim_tscheme uu____29049 =
                           match uu____29049 with
                           | (us,t) ->
                               let n_us = FStar_List.length us  in
                               let uu____29067 =
                                 FStar_Syntax_Subst.open_univ_vars us t  in
                               (match uu____29067 with
                                | (us1,t1) ->
                                    let uu____29078 =
                                      let uu____29087 =
>>>>>>> master
                                        FStar_All.pipe_right b_opening
                                          (FStar_Syntax_Subst.shift_subst
                                             n_us)
                                         in
<<<<<<< HEAD
                                      let uu____28807 =
=======
                                      let uu____29092 =
>>>>>>> master
                                        FStar_All.pipe_right b_closing
                                          (FStar_Syntax_Subst.shift_subst
                                             n_us)
                                         in
<<<<<<< HEAD
                                      (uu____28802, uu____28807)  in
                                    (match uu____28793 with
                                     | (b_opening1,b_closing1) ->
                                         let uu____28830 =
                                           let uu____28839 =
=======
                                      (uu____29087, uu____29092)  in
                                    (match uu____29078 with
                                     | (b_opening1,b_closing1) ->
                                         let uu____29115 =
                                           let uu____29124 =
>>>>>>> master
                                             FStar_All.pipe_right
                                               univs_opening
                                               (FStar_Syntax_Subst.shift_subst
                                                  n_us)
                                              in
<<<<<<< HEAD
                                           let uu____28844 =
=======
                                           let uu____29129 =
>>>>>>> master
                                             FStar_All.pipe_right
                                               univs_closing
                                               (FStar_Syntax_Subst.shift_subst
                                                  n_us)
                                              in
<<<<<<< HEAD
                                           (uu____28839, uu____28844)  in
                                         (match uu____28830 with
                                          | (univs_opening1,univs_closing1)
                                              ->
                                              let t2 =
                                                let uu____28868 =
=======
                                           (uu____29124, uu____29129)  in
                                         (match uu____29115 with
                                          | (univs_opening1,univs_closing1)
                                              ->
                                              let t2 =
                                                let uu____29153 =
>>>>>>> master
                                                  FStar_Syntax_Subst.subst
                                                    b_opening1 t1
                                                   in
                                                FStar_Syntax_Subst.subst
<<<<<<< HEAD
                                                  univs_opening1 uu____28868
                                                 in
                                              let uu____28869 =
                                                elim_uvars_aux_t env [] [] t2
                                                 in
                                              (match uu____28869 with
                                               | (uu____28896,uu____28897,t3)
                                                   ->
                                                   let t4 =
                                                     let uu____28920 =
                                                       let uu____28921 =
=======
                                                  univs_opening1 uu____29153
                                                 in
                                              let uu____29154 =
                                                elim_uvars_aux_t env [] [] t2
                                                 in
                                              (match uu____29154 with
                                               | (uu____29181,uu____29182,t3)
                                                   ->
                                                   let t4 =
                                                     let uu____29205 =
                                                       let uu____29206 =
>>>>>>> master
                                                         FStar_Syntax_Subst.close_univ_vars
                                                           us1 t3
                                                          in
                                                       FStar_Syntax_Subst.subst
                                                         b_closing1
<<<<<<< HEAD
                                                         uu____28921
                                                        in
                                                     FStar_Syntax_Subst.subst
                                                       univs_closing1
                                                       uu____28920
=======
                                                         uu____29206
                                                        in
                                                     FStar_Syntax_Subst.subst
                                                       univs_closing1
                                                       uu____29205
>>>>>>> master
                                                      in
                                                   (us1, t4)))))
                            in
                         let elim_term t =
<<<<<<< HEAD
                           let uu____28930 =
                             elim_uvars_aux_t env univs1 binders t  in
                           match uu____28930 with
                           | (uu____28949,uu____28950,t1) -> t1  in
=======
                           let uu____29215 =
                             elim_uvars_aux_t env univs1 binders t  in
                           match uu____29215 with
                           | (uu____29234,uu____29235,t1) -> t1  in
>>>>>>> master
                         let elim_action a =
                           let action_typ_templ =
                             let body =
                               FStar_Syntax_Syntax.mk
                                 (FStar_Syntax_Syntax.Tm_ascribed
                                    ((a.FStar_Syntax_Syntax.action_defn),
                                      ((FStar_Util.Inl
                                          (a.FStar_Syntax_Syntax.action_typ)),
                                        FStar_Pervasives_Native.None),
                                      FStar_Pervasives_Native.None))
                                 FStar_Pervasives_Native.None
                                 (a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos
                                in
                             match a.FStar_Syntax_Syntax.action_params with
                             | [] -> body
<<<<<<< HEAD
                             | uu____29026 ->
=======
                             | uu____29311 ->
>>>>>>> master
                                 FStar_Syntax_Syntax.mk
                                   (FStar_Syntax_Syntax.Tm_abs
                                      ((a.FStar_Syntax_Syntax.action_params),
                                        body, FStar_Pervasives_Native.None))
                                   FStar_Pervasives_Native.None
                                   (a.FStar_Syntax_Syntax.action_defn).FStar_Syntax_Syntax.pos
                              in
                           let destruct_action_body body =
<<<<<<< HEAD
                             let uu____29053 =
                               let uu____29054 =
                                 FStar_Syntax_Subst.compress body  in
                               uu____29054.FStar_Syntax_Syntax.n  in
                             match uu____29053 with
=======
                             let uu____29338 =
                               let uu____29339 =
                                 FStar_Syntax_Subst.compress body  in
                               uu____29339.FStar_Syntax_Syntax.n  in
                             match uu____29338 with
>>>>>>> master
                             | FStar_Syntax_Syntax.Tm_ascribed
                                 (defn,(FStar_Util.Inl
                                        typ,FStar_Pervasives_Native.None ),FStar_Pervasives_Native.None
                                  )
                                 -> (defn, typ)
<<<<<<< HEAD
                             | uu____29113 -> failwith "Impossible"  in
                           let destruct_action_typ_templ t =
                             let uu____29147 =
                               let uu____29148 =
                                 FStar_Syntax_Subst.compress t  in
                               uu____29148.FStar_Syntax_Syntax.n  in
                             match uu____29147 with
                             | FStar_Syntax_Syntax.Tm_abs
                                 (pars,body,uu____29171) ->
                                 let uu____29196 = destruct_action_body body
                                    in
                                 (match uu____29196 with
                                  | (defn,typ) -> (pars, defn, typ))
                             | uu____29245 ->
                                 let uu____29246 = destruct_action_body t  in
                                 (match uu____29246 with
                                  | (defn,typ) -> ([], defn, typ))
                              in
                           let uu____29301 =
=======
                             | uu____29398 -> failwith "Impossible"  in
                           let destruct_action_typ_templ t =
                             let uu____29432 =
                               let uu____29433 =
                                 FStar_Syntax_Subst.compress t  in
                               uu____29433.FStar_Syntax_Syntax.n  in
                             match uu____29432 with
                             | FStar_Syntax_Syntax.Tm_abs
                                 (pars,body,uu____29456) ->
                                 let uu____29481 = destruct_action_body body
                                    in
                                 (match uu____29481 with
                                  | (defn,typ) -> (pars, defn, typ))
                             | uu____29530 ->
                                 let uu____29531 = destruct_action_body t  in
                                 (match uu____29531 with
                                  | (defn,typ) -> ([], defn, typ))
                              in
                           let uu____29586 =
>>>>>>> master
                             elim_tscheme
                               ((a.FStar_Syntax_Syntax.action_univs),
                                 action_typ_templ)
                              in
<<<<<<< HEAD
                           match uu____29301 with
                           | (action_univs,t) ->
                               let uu____29310 = destruct_action_typ_templ t
                                  in
                               (match uu____29310 with
                                | (action_params,action_defn,action_typ) ->
                                    let a' =
                                      let uu___3651_29357 = a  in
                                      {
                                        FStar_Syntax_Syntax.action_name =
                                          (uu___3651_29357.FStar_Syntax_Syntax.action_name);
                                        FStar_Syntax_Syntax.action_unqualified_name
                                          =
                                          (uu___3651_29357.FStar_Syntax_Syntax.action_unqualified_name);
=======
                           match uu____29586 with
                           | (action_univs,t) ->
                               let uu____29595 = destruct_action_typ_templ t
                                  in
                               (match uu____29595 with
                                | (action_params,action_defn,action_typ) ->
                                    let a' =
                                      let uu___3663_29642 = a  in
                                      {
                                        FStar_Syntax_Syntax.action_name =
                                          (uu___3663_29642.FStar_Syntax_Syntax.action_name);
                                        FStar_Syntax_Syntax.action_unqualified_name
                                          =
                                          (uu___3663_29642.FStar_Syntax_Syntax.action_unqualified_name);
>>>>>>> master
                                        FStar_Syntax_Syntax.action_univs =
                                          action_univs;
                                        FStar_Syntax_Syntax.action_params =
                                          action_params;
                                        FStar_Syntax_Syntax.action_defn =
                                          action_defn;
                                        FStar_Syntax_Syntax.action_typ =
                                          action_typ
                                      }  in
                                    a')
                            in
                         let ed1 =
<<<<<<< HEAD
                           let uu___3654_29359 = ed  in
                           let uu____29360 =
                             elim_tscheme ed.FStar_Syntax_Syntax.ret_wp  in
                           let uu____29361 =
                             elim_tscheme ed.FStar_Syntax_Syntax.bind_wp  in
                           let uu____29362 =
                             elim_tscheme ed.FStar_Syntax_Syntax.if_then_else
                              in
                           let uu____29363 =
                             elim_tscheme ed.FStar_Syntax_Syntax.ite_wp  in
                           let uu____29364 =
                             elim_tscheme ed.FStar_Syntax_Syntax.stronger  in
                           let uu____29365 =
                             elim_tscheme ed.FStar_Syntax_Syntax.close_wp  in
                           let uu____29366 =
                             elim_tscheme ed.FStar_Syntax_Syntax.assert_p  in
                           let uu____29367 =
                             elim_tscheme ed.FStar_Syntax_Syntax.assume_p  in
                           let uu____29368 =
                             elim_tscheme ed.FStar_Syntax_Syntax.null_wp  in
                           let uu____29369 =
                             elim_tscheme ed.FStar_Syntax_Syntax.trivial  in
                           let uu____29370 =
                             elim_term ed.FStar_Syntax_Syntax.repr  in
                           let uu____29371 =
                             elim_tscheme ed.FStar_Syntax_Syntax.return_repr
                              in
                           let uu____29372 =
                             elim_tscheme ed.FStar_Syntax_Syntax.bind_repr
                              in
                           let uu____29373 =
=======
                           let uu___3666_29644 = ed  in
                           let uu____29645 =
                             elim_tscheme ed.FStar_Syntax_Syntax.ret_wp  in
                           let uu____29646 =
                             elim_tscheme ed.FStar_Syntax_Syntax.bind_wp  in
                           let uu____29647 =
                             elim_tscheme ed.FStar_Syntax_Syntax.if_then_else
                              in
                           let uu____29648 =
                             elim_tscheme ed.FStar_Syntax_Syntax.ite_wp  in
                           let uu____29649 =
                             elim_tscheme ed.FStar_Syntax_Syntax.stronger  in
                           let uu____29650 =
                             elim_tscheme ed.FStar_Syntax_Syntax.close_wp  in
                           let uu____29651 =
                             elim_tscheme ed.FStar_Syntax_Syntax.assert_p  in
                           let uu____29652 =
                             elim_tscheme ed.FStar_Syntax_Syntax.assume_p  in
                           let uu____29653 =
                             elim_tscheme ed.FStar_Syntax_Syntax.null_wp  in
                           let uu____29654 =
                             elim_tscheme ed.FStar_Syntax_Syntax.trivial  in
                           let uu____29655 =
                             elim_term ed.FStar_Syntax_Syntax.repr  in
                           let uu____29656 =
                             elim_tscheme ed.FStar_Syntax_Syntax.return_repr
                              in
                           let uu____29657 =
                             elim_tscheme ed.FStar_Syntax_Syntax.bind_repr
                              in
                           let uu____29658 =
>>>>>>> master
                             FStar_List.map elim_action
                               ed.FStar_Syntax_Syntax.actions
                              in
                           {
                             FStar_Syntax_Syntax.cattributes =
<<<<<<< HEAD
                               (uu___3654_29359.FStar_Syntax_Syntax.cattributes);
                             FStar_Syntax_Syntax.mname =
                               (uu___3654_29359.FStar_Syntax_Syntax.mname);
                             FStar_Syntax_Syntax.univs = univs1;
                             FStar_Syntax_Syntax.binders = binders;
                             FStar_Syntax_Syntax.signature = signature;
                             FStar_Syntax_Syntax.ret_wp = uu____29360;
                             FStar_Syntax_Syntax.bind_wp = uu____29361;
                             FStar_Syntax_Syntax.if_then_else = uu____29362;
                             FStar_Syntax_Syntax.ite_wp = uu____29363;
                             FStar_Syntax_Syntax.stronger = uu____29364;
                             FStar_Syntax_Syntax.close_wp = uu____29365;
                             FStar_Syntax_Syntax.assert_p = uu____29366;
                             FStar_Syntax_Syntax.assume_p = uu____29367;
                             FStar_Syntax_Syntax.null_wp = uu____29368;
                             FStar_Syntax_Syntax.trivial = uu____29369;
                             FStar_Syntax_Syntax.repr = uu____29370;
                             FStar_Syntax_Syntax.return_repr = uu____29371;
                             FStar_Syntax_Syntax.bind_repr = uu____29372;
                             FStar_Syntax_Syntax.actions = uu____29373;
                             FStar_Syntax_Syntax.eff_attrs =
                               (uu___3654_29359.FStar_Syntax_Syntax.eff_attrs)
                           }  in
                         let uu___3657_29376 = s  in
=======
                               (uu___3666_29644.FStar_Syntax_Syntax.cattributes);
                             FStar_Syntax_Syntax.mname =
                               (uu___3666_29644.FStar_Syntax_Syntax.mname);
                             FStar_Syntax_Syntax.univs = univs1;
                             FStar_Syntax_Syntax.binders = binders;
                             FStar_Syntax_Syntax.signature = signature;
                             FStar_Syntax_Syntax.ret_wp = uu____29645;
                             FStar_Syntax_Syntax.bind_wp = uu____29646;
                             FStar_Syntax_Syntax.if_then_else = uu____29647;
                             FStar_Syntax_Syntax.ite_wp = uu____29648;
                             FStar_Syntax_Syntax.stronger = uu____29649;
                             FStar_Syntax_Syntax.close_wp = uu____29650;
                             FStar_Syntax_Syntax.assert_p = uu____29651;
                             FStar_Syntax_Syntax.assume_p = uu____29652;
                             FStar_Syntax_Syntax.null_wp = uu____29653;
                             FStar_Syntax_Syntax.trivial = uu____29654;
                             FStar_Syntax_Syntax.repr = uu____29655;
                             FStar_Syntax_Syntax.return_repr = uu____29656;
                             FStar_Syntax_Syntax.bind_repr = uu____29657;
                             FStar_Syntax_Syntax.actions = uu____29658;
                             FStar_Syntax_Syntax.eff_attrs =
                               (uu___3666_29644.FStar_Syntax_Syntax.eff_attrs)
                           }  in
                         let uu___3669_29661 = s  in
>>>>>>> master
                         {
                           FStar_Syntax_Syntax.sigel =
                             (FStar_Syntax_Syntax.Sig_new_effect ed1);
                           FStar_Syntax_Syntax.sigrng =
<<<<<<< HEAD
                             (uu___3657_29376.FStar_Syntax_Syntax.sigrng);
                           FStar_Syntax_Syntax.sigquals =
                             (uu___3657_29376.FStar_Syntax_Syntax.sigquals);
                           FStar_Syntax_Syntax.sigmeta =
                             (uu___3657_29376.FStar_Syntax_Syntax.sigmeta);
                           FStar_Syntax_Syntax.sigattrs =
                             (uu___3657_29376.FStar_Syntax_Syntax.sigattrs)
                         })))
      | FStar_Syntax_Syntax.Sig_sub_effect sub_eff ->
          let elim_tscheme_opt uu___20_29397 =
            match uu___20_29397 with
            | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
            | FStar_Pervasives_Native.Some (us,t) ->
                let uu____29428 = elim_uvars_aux_t env us [] t  in
                (match uu____29428 with
                 | (us1,uu____29460,t1) ->
                     FStar_Pervasives_Native.Some (us1, t1))
             in
          let sub_eff1 =
            let uu___3672_29491 = sub_eff  in
            let uu____29492 =
              elim_tscheme_opt sub_eff.FStar_Syntax_Syntax.lift_wp  in
            let uu____29495 =
              elim_tscheme_opt sub_eff.FStar_Syntax_Syntax.lift  in
            {
              FStar_Syntax_Syntax.source =
                (uu___3672_29491.FStar_Syntax_Syntax.source);
              FStar_Syntax_Syntax.target =
                (uu___3672_29491.FStar_Syntax_Syntax.target);
              FStar_Syntax_Syntax.lift_wp = uu____29492;
              FStar_Syntax_Syntax.lift = uu____29495
            }  in
          let uu___3675_29498 = s  in
=======
                             (uu___3669_29661.FStar_Syntax_Syntax.sigrng);
                           FStar_Syntax_Syntax.sigquals =
                             (uu___3669_29661.FStar_Syntax_Syntax.sigquals);
                           FStar_Syntax_Syntax.sigmeta =
                             (uu___3669_29661.FStar_Syntax_Syntax.sigmeta);
                           FStar_Syntax_Syntax.sigattrs =
                             (uu___3669_29661.FStar_Syntax_Syntax.sigattrs)
                         })))
      | FStar_Syntax_Syntax.Sig_sub_effect sub_eff ->
          let elim_tscheme_opt uu___20_29682 =
            match uu___20_29682 with
            | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
            | FStar_Pervasives_Native.Some (us,t) ->
                let uu____29713 = elim_uvars_aux_t env us [] t  in
                (match uu____29713 with
                 | (us1,uu____29745,t1) ->
                     FStar_Pervasives_Native.Some (us1, t1))
             in
          let sub_eff1 =
            let uu___3684_29776 = sub_eff  in
            let uu____29777 =
              elim_tscheme_opt sub_eff.FStar_Syntax_Syntax.lift_wp  in
            let uu____29780 =
              elim_tscheme_opt sub_eff.FStar_Syntax_Syntax.lift  in
            {
              FStar_Syntax_Syntax.source =
                (uu___3684_29776.FStar_Syntax_Syntax.source);
              FStar_Syntax_Syntax.target =
                (uu___3684_29776.FStar_Syntax_Syntax.target);
              FStar_Syntax_Syntax.lift_wp = uu____29777;
              FStar_Syntax_Syntax.lift = uu____29780
            }  in
          let uu___3687_29783 = s  in
>>>>>>> master
          {
            FStar_Syntax_Syntax.sigel =
              (FStar_Syntax_Syntax.Sig_sub_effect sub_eff1);
            FStar_Syntax_Syntax.sigrng =
<<<<<<< HEAD
              (uu___3675_29498.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___3675_29498.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___3675_29498.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___3675_29498.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_effect_abbrev
          (lid,univ_names,binders,comp,flags) ->
          let uu____29508 = elim_uvars_aux_c env univ_names binders comp  in
          (match uu____29508 with
           | (univ_names1,binders1,comp1) ->
               let uu___3688_29548 = s  in
=======
              (uu___3687_29783.FStar_Syntax_Syntax.sigrng);
            FStar_Syntax_Syntax.sigquals =
              (uu___3687_29783.FStar_Syntax_Syntax.sigquals);
            FStar_Syntax_Syntax.sigmeta =
              (uu___3687_29783.FStar_Syntax_Syntax.sigmeta);
            FStar_Syntax_Syntax.sigattrs =
              (uu___3687_29783.FStar_Syntax_Syntax.sigattrs)
          }
      | FStar_Syntax_Syntax.Sig_effect_abbrev
          (lid,univ_names,binders,comp,flags) ->
          let uu____29793 = elim_uvars_aux_c env univ_names binders comp  in
          (match uu____29793 with
           | (univ_names1,binders1,comp1) ->
               let uu___3700_29833 = s  in
>>>>>>> master
               {
                 FStar_Syntax_Syntax.sigel =
                   (FStar_Syntax_Syntax.Sig_effect_abbrev
                      (lid, univ_names1, binders1, comp1, flags));
                 FStar_Syntax_Syntax.sigrng =
<<<<<<< HEAD
                   (uu___3688_29548.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___3688_29548.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___3688_29548.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___3688_29548.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_pragma uu____29551 -> s
      | FStar_Syntax_Syntax.Sig_splice uu____29552 -> s
=======
                   (uu___3700_29833.FStar_Syntax_Syntax.sigrng);
                 FStar_Syntax_Syntax.sigquals =
                   (uu___3700_29833.FStar_Syntax_Syntax.sigquals);
                 FStar_Syntax_Syntax.sigmeta =
                   (uu___3700_29833.FStar_Syntax_Syntax.sigmeta);
                 FStar_Syntax_Syntax.sigattrs =
                   (uu___3700_29833.FStar_Syntax_Syntax.sigattrs)
               })
      | FStar_Syntax_Syntax.Sig_pragma uu____29836 -> s
      | FStar_Syntax_Syntax.Sig_splice uu____29837 -> s
>>>>>>> master
  
let (erase_universes :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      normalize
        [FStar_TypeChecker_Env.EraseUniverses;
        FStar_TypeChecker_Env.AllowUnboundUniverses] env t
  
let (unfold_head_once :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun t  ->
      let aux f us args =
<<<<<<< HEAD
        let uu____29601 =
=======
        let uu____29886 =
>>>>>>> master
          FStar_TypeChecker_Env.lookup_nonrec_definition
            [FStar_TypeChecker_Env.Unfold FStar_Syntax_Syntax.delta_constant]
            env (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
           in
<<<<<<< HEAD
        match uu____29601 with
        | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
        | FStar_Pervasives_Native.Some head_def_ts ->
            let uu____29623 =
              FStar_TypeChecker_Env.inst_tscheme_with head_def_ts us  in
            (match uu____29623 with
             | (uu____29630,head_def) ->
=======
        match uu____29886 with
        | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
        | FStar_Pervasives_Native.Some head_def_ts ->
            let uu____29908 =
              FStar_TypeChecker_Env.inst_tscheme_with head_def_ts us  in
            (match uu____29908 with
             | (uu____29915,head_def) ->
>>>>>>> master
                 let t' =
                   FStar_Syntax_Syntax.mk_Tm_app head_def args
                     FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos
                    in
                 let t'1 =
                   normalize
                     [FStar_TypeChecker_Env.Beta; FStar_TypeChecker_Env.Iota]
                     env t'
                    in
                 FStar_Pervasives_Native.Some t'1)
         in
<<<<<<< HEAD
      let uu____29636 = FStar_Syntax_Util.head_and_args t  in
      match uu____29636 with
      | (head1,args) ->
          let uu____29681 =
            let uu____29682 = FStar_Syntax_Subst.compress head1  in
            uu____29682.FStar_Syntax_Syntax.n  in
          (match uu____29681 with
           | FStar_Syntax_Syntax.Tm_fvar fv -> aux fv [] args
           | FStar_Syntax_Syntax.Tm_uinst
               ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                  FStar_Syntax_Syntax.pos = uu____29689;
                  FStar_Syntax_Syntax.vars = uu____29690;_},us)
               -> aux fv us args
           | uu____29696 -> FStar_Pervasives_Native.None)
=======
      let uu____29921 = FStar_Syntax_Util.head_and_args t  in
      match uu____29921 with
      | (head1,args) ->
          let uu____29966 =
            let uu____29967 = FStar_Syntax_Subst.compress head1  in
            uu____29967.FStar_Syntax_Syntax.n  in
          (match uu____29966 with
           | FStar_Syntax_Syntax.Tm_fvar fv -> aux fv [] args
           | FStar_Syntax_Syntax.Tm_uinst
               ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                  FStar_Syntax_Syntax.pos = uu____29974;
                  FStar_Syntax_Syntax.vars = uu____29975;_},us)
               -> aux fv us args
           | uu____29981 -> FStar_Pervasives_Native.None)
>>>>>>> master
  