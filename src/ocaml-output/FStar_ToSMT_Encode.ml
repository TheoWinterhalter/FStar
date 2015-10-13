
let add_fuel = (fun x tl -> (match ((FStar_ST.read FStar_Options.unthrottle_inductives)) with
| true -> begin
tl
end
| false -> begin
(x)::tl
end))

let withenv = (fun c _53_40 -> (match (_53_40) with
| (a, b) -> begin
(a, b, c)
end))

let vargs = (fun args -> (FStar_List.filter (fun _53_1 -> (match (_53_1) with
| (FStar_Util.Inl (_53_44), _53_47) -> begin
false
end
| _53_50 -> begin
true
end)) args))

let escape = (fun s -> (FStar_Util.replace_char s '\'' '_'))

let escape_null_name = (fun a -> (match ((a.FStar_Absyn_Syntax.ppname.FStar_Absyn_Syntax.idText = "_")) with
| true -> begin
(Prims.strcat a.FStar_Absyn_Syntax.ppname.FStar_Absyn_Syntax.idText a.FStar_Absyn_Syntax.realname.FStar_Absyn_Syntax.idText)
end
| false -> begin
a.FStar_Absyn_Syntax.ppname.FStar_Absyn_Syntax.idText
end))

let mk_typ_projector_name = (fun lid a -> (let _119_14 = (FStar_Util.format2 "%s_%s" lid.FStar_Absyn_Syntax.str (escape_null_name a))
in (FStar_All.pipe_left escape _119_14)))

let mk_term_projector_name = (fun lid a -> (let a = (let _119_19 = (FStar_Absyn_Util.unmangle_field_name a.FStar_Absyn_Syntax.ppname)
in {FStar_Absyn_Syntax.ppname = _119_19; FStar_Absyn_Syntax.realname = a.FStar_Absyn_Syntax.realname})
in (let _119_20 = (FStar_Util.format2 "%s_%s" lid.FStar_Absyn_Syntax.str (escape_null_name a))
in (FStar_All.pipe_left escape _119_20))))

let primitive_projector_by_pos = (fun env lid i -> (let fail = (fun _53_62 -> (match (()) with
| () -> begin
(let _119_30 = (let _119_29 = (FStar_Util.string_of_int i)
in (FStar_Util.format2 "Projector %s on data constructor %s not found" _119_29 lid.FStar_Absyn_Syntax.str))
in (FStar_All.failwith _119_30))
end))
in (let t = (FStar_Tc_Env.lookup_datacon env lid)
in (match ((let _119_31 = (FStar_Absyn_Util.compress_typ t)
in _119_31.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Typ_fun (binders, _53_66) -> begin
(match (((i < 0) || (i >= (FStar_List.length binders)))) with
| true -> begin
(fail ())
end
| false -> begin
(let b = (FStar_List.nth binders i)
in (match ((Prims.fst b)) with
| FStar_Util.Inl (a) -> begin
(mk_typ_projector_name lid a.FStar_Absyn_Syntax.v)
end
| FStar_Util.Inr (x) -> begin
(mk_term_projector_name lid x.FStar_Absyn_Syntax.v)
end))
end)
end
| _53_75 -> begin
(fail ())
end))))

let mk_term_projector_name_by_pos = (fun lid i -> (let _119_37 = (let _119_36 = (FStar_Util.string_of_int i)
in (FStar_Util.format2 "%s_%s" lid.FStar_Absyn_Syntax.str _119_36))
in (FStar_All.pipe_left escape _119_37)))

let mk_typ_projector = (fun lid a -> (let _119_43 = (let _119_42 = (mk_typ_projector_name lid a)
in (_119_42, FStar_ToSMT_Term.Arrow ((FStar_ToSMT_Term.Term_sort, FStar_ToSMT_Term.Type_sort))))
in (FStar_ToSMT_Term.mkFreeV _119_43)))

let mk_term_projector = (fun lid a -> (let _119_49 = (let _119_48 = (mk_term_projector_name lid a)
in (_119_48, FStar_ToSMT_Term.Arrow ((FStar_ToSMT_Term.Term_sort, FStar_ToSMT_Term.Term_sort))))
in (FStar_ToSMT_Term.mkFreeV _119_49)))

let mk_term_projector_by_pos = (fun lid i -> (let _119_55 = (let _119_54 = (mk_term_projector_name_by_pos lid i)
in (_119_54, FStar_ToSMT_Term.Arrow ((FStar_ToSMT_Term.Term_sort, FStar_ToSMT_Term.Term_sort))))
in (FStar_ToSMT_Term.mkFreeV _119_55)))

let mk_data_tester = (fun env l x -> (FStar_ToSMT_Term.mk_tester (escape l.FStar_Absyn_Syntax.str) x))

type varops_t =
{push : Prims.unit  ->  Prims.unit; pop : Prims.unit  ->  Prims.unit; mark : Prims.unit  ->  Prims.unit; reset_mark : Prims.unit  ->  Prims.unit; commit_mark : Prims.unit  ->  Prims.unit; new_var : FStar_Absyn_Syntax.ident  ->  FStar_Absyn_Syntax.ident  ->  Prims.string; new_fvar : FStar_Absyn_Syntax.lident  ->  Prims.string; fresh : Prims.string  ->  Prims.string; string_const : Prims.string  ->  FStar_ToSMT_Term.term; next_id : Prims.unit  ->  Prims.int}

let is_Mkvarops_t = (fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkvarops_t"))

let varops = (let initial_ctr = 10
in (let ctr = (FStar_Util.mk_ref initial_ctr)
in (let new_scope = (fun _53_101 -> (match (()) with
| () -> begin
(let _119_159 = (FStar_Util.smap_create 100)
in (let _119_158 = (FStar_Util.smap_create 100)
in (_119_159, _119_158)))
end))
in (let scopes = (let _119_161 = (let _119_160 = (new_scope ())
in (_119_160)::[])
in (FStar_Util.mk_ref _119_161))
in (let mk_unique = (fun y -> (let y = (escape y)
in (let y = (match ((let _119_165 = (FStar_ST.read scopes)
in (FStar_Util.find_map _119_165 (fun _53_109 -> (match (_53_109) with
| (names, _53_108) -> begin
(FStar_Util.smap_try_find names y)
end))))) with
| None -> begin
y
end
| Some (_53_112) -> begin
(let _53_114 = (FStar_Util.incr ctr)
in (let _119_167 = (let _119_166 = (FStar_ST.read ctr)
in (FStar_Util.string_of_int _119_166))
in (Prims.strcat (Prims.strcat y "__") _119_167)))
end)
in (let top_scope = (let _119_169 = (let _119_168 = (FStar_ST.read scopes)
in (FStar_List.hd _119_168))
in (FStar_All.pipe_left Prims.fst _119_169))
in (let _53_118 = (FStar_Util.smap_add top_scope y true)
in y)))))
in (let new_var = (fun pp rn -> (let _119_175 = (let _119_174 = (FStar_All.pipe_left mk_unique pp.FStar_Absyn_Syntax.idText)
in (Prims.strcat _119_174 "__"))
in (Prims.strcat _119_175 rn.FStar_Absyn_Syntax.idText)))
in (let new_fvar = (fun lid -> (mk_unique lid.FStar_Absyn_Syntax.str))
in (let next_id = (fun _53_126 -> (match (()) with
| () -> begin
(let _53_127 = (FStar_Util.incr ctr)
in (FStar_ST.read ctr))
end))
in (let fresh = (fun pfx -> (let _119_183 = (let _119_182 = (next_id ())
in (FStar_All.pipe_left FStar_Util.string_of_int _119_182))
in (FStar_Util.format2 "%s_%s" pfx _119_183)))
in (let string_const = (fun s -> (match ((let _119_187 = (FStar_ST.read scopes)
in (FStar_Util.find_map _119_187 (fun _53_136 -> (match (_53_136) with
| (_53_134, strings) -> begin
(FStar_Util.smap_try_find strings s)
end))))) with
| Some (f) -> begin
f
end
| None -> begin
(let id = (next_id ())
in (let f = (let _119_188 = (FStar_ToSMT_Term.mk_String_const id)
in (FStar_All.pipe_left FStar_ToSMT_Term.boxString _119_188))
in (let top_scope = (let _119_190 = (let _119_189 = (FStar_ST.read scopes)
in (FStar_List.hd _119_189))
in (FStar_All.pipe_left Prims.snd _119_190))
in (let _53_143 = (FStar_Util.smap_add top_scope s f)
in f))))
end))
in (let push = (fun _53_146 -> (match (()) with
| () -> begin
(let _119_195 = (let _119_194 = (new_scope ())
in (let _119_193 = (FStar_ST.read scopes)
in (_119_194)::_119_193))
in (FStar_ST.op_Colon_Equals scopes _119_195))
end))
in (let pop = (fun _53_148 -> (match (()) with
| () -> begin
(let _119_199 = (let _119_198 = (FStar_ST.read scopes)
in (FStar_List.tl _119_198))
in (FStar_ST.op_Colon_Equals scopes _119_199))
end))
in (let mark = (fun _53_150 -> (match (()) with
| () -> begin
(push ())
end))
in (let reset_mark = (fun _53_152 -> (match (()) with
| () -> begin
(pop ())
end))
in (let commit_mark = (fun _53_154 -> (match (()) with
| () -> begin
(match ((FStar_ST.read scopes)) with
| (hd1, hd2)::(next1, next2)::tl -> begin
(let _53_167 = (FStar_Util.smap_fold hd1 (fun key value v -> (FStar_Util.smap_add next1 key value)) ())
in (let _53_172 = (FStar_Util.smap_fold hd2 (fun key value v -> (FStar_Util.smap_add next2 key value)) ())
in (FStar_ST.op_Colon_Equals scopes (((next1, next2))::tl))))
end
| _53_175 -> begin
(FStar_All.failwith "Impossible")
end)
end))
in {push = push; pop = pop; mark = mark; reset_mark = reset_mark; commit_mark = commit_mark; new_var = new_var; new_fvar = new_fvar; fresh = fresh; string_const = string_const; next_id = next_id})))))))))))))))

let unmangle = (fun x -> (let _119_215 = (let _119_214 = (FStar_Absyn_Util.unmangle_field_name x.FStar_Absyn_Syntax.ppname)
in (let _119_213 = (FStar_Absyn_Util.unmangle_field_name x.FStar_Absyn_Syntax.realname)
in (_119_214, _119_213)))
in (FStar_Absyn_Util.mkbvd _119_215)))

type binding =
| Binding_var of (FStar_Absyn_Syntax.bvvdef * FStar_ToSMT_Term.term)
| Binding_tvar of (FStar_Absyn_Syntax.btvdef * FStar_ToSMT_Term.term)
| Binding_fvar of (FStar_Absyn_Syntax.lident * Prims.string * FStar_ToSMT_Term.term Prims.option * FStar_ToSMT_Term.term Prims.option)
| Binding_ftvar of (FStar_Absyn_Syntax.lident * Prims.string * FStar_ToSMT_Term.term Prims.option)

let is_Binding_var = (fun _discr_ -> (match (_discr_) with
| Binding_var (_) -> begin
true
end
| _ -> begin
false
end))

let is_Binding_tvar = (fun _discr_ -> (match (_discr_) with
| Binding_tvar (_) -> begin
true
end
| _ -> begin
false
end))

let is_Binding_fvar = (fun _discr_ -> (match (_discr_) with
| Binding_fvar (_) -> begin
true
end
| _ -> begin
false
end))

let is_Binding_ftvar = (fun _discr_ -> (match (_discr_) with
| Binding_ftvar (_) -> begin
true
end
| _ -> begin
false
end))

let ___Binding_var____0 = (fun projectee -> (match (projectee) with
| Binding_var (_53_180) -> begin
_53_180
end))

let ___Binding_tvar____0 = (fun projectee -> (match (projectee) with
| Binding_tvar (_53_183) -> begin
_53_183
end))

let ___Binding_fvar____0 = (fun projectee -> (match (projectee) with
| Binding_fvar (_53_186) -> begin
_53_186
end))

let ___Binding_ftvar____0 = (fun projectee -> (match (projectee) with
| Binding_ftvar (_53_189) -> begin
_53_189
end))

let binder_of_eithervar = (fun v -> (v, None))

type env_t =
{bindings : binding Prims.list; depth : Prims.int; tcenv : FStar_Tc_Env.env; warn : Prims.bool; cache : (Prims.string * FStar_ToSMT_Term.sort Prims.list * FStar_ToSMT_Term.decl Prims.list) FStar_Util.smap; nolabels : Prims.bool; use_zfuel_name : Prims.bool; encode_non_total_function_typ : Prims.bool}

let is_Mkenv_t = (fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkenv_t"))

let print_env = (fun e -> (let _119_301 = (FStar_All.pipe_right e.bindings (FStar_List.map (fun _53_2 -> (match (_53_2) with
| Binding_var (x, t) -> begin
(FStar_Absyn_Print.strBvd x)
end
| Binding_tvar (a, t) -> begin
(FStar_Absyn_Print.strBvd a)
end
| Binding_fvar (l, s, t, _53_214) -> begin
(FStar_Absyn_Print.sli l)
end
| Binding_ftvar (l, s, t) -> begin
(FStar_Absyn_Print.sli l)
end))))
in (FStar_All.pipe_right _119_301 (FStar_String.concat ", "))))

let lookup_binding = (fun env f -> (FStar_Util.find_map env.bindings f))

let caption_t = (fun env t -> (match ((FStar_Tc_Env.debug env.tcenv FStar_Options.Low)) with
| true -> begin
(let _119_311 = (FStar_Absyn_Print.typ_to_string t)
in Some (_119_311))
end
| false -> begin
None
end))

let fresh_fvar = (fun x s -> (let xsym = (varops.fresh x)
in (let _119_316 = (FStar_ToSMT_Term.mkFreeV (xsym, s))
in (xsym, _119_316))))

let gen_term_var = (fun env x -> (let ysym = (let _119_321 = (FStar_Util.string_of_int env.depth)
in (Prims.strcat "@x" _119_321))
in (let y = (FStar_ToSMT_Term.mkFreeV (ysym, FStar_ToSMT_Term.Term_sort))
in (ysym, y, (let _53_233 = env
in {bindings = (Binding_var ((x, y)))::env.bindings; depth = (env.depth + 1); tcenv = _53_233.tcenv; warn = _53_233.warn; cache = _53_233.cache; nolabels = _53_233.nolabels; use_zfuel_name = _53_233.use_zfuel_name; encode_non_total_function_typ = _53_233.encode_non_total_function_typ})))))

let new_term_constant = (fun env x -> (let ysym = (varops.new_var x.FStar_Absyn_Syntax.ppname x.FStar_Absyn_Syntax.realname)
in (let y = (FStar_ToSMT_Term.mkApp (ysym, []))
in (ysym, y, (let _53_239 = env
in {bindings = (Binding_var ((x, y)))::env.bindings; depth = _53_239.depth; tcenv = _53_239.tcenv; warn = _53_239.warn; cache = _53_239.cache; nolabels = _53_239.nolabels; use_zfuel_name = _53_239.use_zfuel_name; encode_non_total_function_typ = _53_239.encode_non_total_function_typ})))))

let push_term_var = (fun env x t -> (let _53_244 = env
in {bindings = (Binding_var ((x, t)))::env.bindings; depth = _53_244.depth; tcenv = _53_244.tcenv; warn = _53_244.warn; cache = _53_244.cache; nolabels = _53_244.nolabels; use_zfuel_name = _53_244.use_zfuel_name; encode_non_total_function_typ = _53_244.encode_non_total_function_typ}))

let lookup_term_var = (fun env a -> (match ((lookup_binding env (fun _53_3 -> (match (_53_3) with
| Binding_var (b, t) when (FStar_Absyn_Util.bvd_eq b a.FStar_Absyn_Syntax.v) -> begin
Some ((b, t))
end
| _53_254 -> begin
None
end)))) with
| None -> begin
(let _119_336 = (let _119_335 = (FStar_Absyn_Print.strBvd a.FStar_Absyn_Syntax.v)
in (FStar_Util.format1 "Bound term variable not found: %s" _119_335))
in (FStar_All.failwith _119_336))
end
| Some (b, t) -> begin
t
end))

let gen_typ_var = (fun env x -> (let ysym = (let _119_341 = (FStar_Util.string_of_int env.depth)
in (Prims.strcat "@a" _119_341))
in (let y = (FStar_ToSMT_Term.mkFreeV (ysym, FStar_ToSMT_Term.Type_sort))
in (ysym, y, (let _53_264 = env
in {bindings = (Binding_tvar ((x, y)))::env.bindings; depth = (env.depth + 1); tcenv = _53_264.tcenv; warn = _53_264.warn; cache = _53_264.cache; nolabels = _53_264.nolabels; use_zfuel_name = _53_264.use_zfuel_name; encode_non_total_function_typ = _53_264.encode_non_total_function_typ})))))

let new_typ_constant = (fun env x -> (let ysym = (varops.new_var x.FStar_Absyn_Syntax.ppname x.FStar_Absyn_Syntax.realname)
in (let y = (FStar_ToSMT_Term.mkApp (ysym, []))
in (ysym, y, (let _53_270 = env
in {bindings = (Binding_tvar ((x, y)))::env.bindings; depth = _53_270.depth; tcenv = _53_270.tcenv; warn = _53_270.warn; cache = _53_270.cache; nolabels = _53_270.nolabels; use_zfuel_name = _53_270.use_zfuel_name; encode_non_total_function_typ = _53_270.encode_non_total_function_typ})))))

let push_typ_var = (fun env x t -> (let _53_275 = env
in {bindings = (Binding_tvar ((x, t)))::env.bindings; depth = _53_275.depth; tcenv = _53_275.tcenv; warn = _53_275.warn; cache = _53_275.cache; nolabels = _53_275.nolabels; use_zfuel_name = _53_275.use_zfuel_name; encode_non_total_function_typ = _53_275.encode_non_total_function_typ}))

let lookup_typ_var = (fun env a -> (match ((lookup_binding env (fun _53_4 -> (match (_53_4) with
| Binding_tvar (b, t) when (FStar_Absyn_Util.bvd_eq b a.FStar_Absyn_Syntax.v) -> begin
Some ((b, t))
end
| _53_285 -> begin
None
end)))) with
| None -> begin
(let _119_356 = (let _119_355 = (FStar_Absyn_Print.strBvd a.FStar_Absyn_Syntax.v)
in (FStar_Util.format1 "Bound type variable not found: %s" _119_355))
in (FStar_All.failwith _119_356))
end
| Some (b, t) -> begin
t
end))

let new_term_constant_and_tok_from_lid = (fun env x -> (let fname = (varops.new_fvar x)
in (let ftok = (Prims.strcat fname "@tok")
in (let _119_367 = (let _53_295 = env
in (let _119_366 = (let _119_365 = (let _119_364 = (let _119_363 = (let _119_362 = (FStar_ToSMT_Term.mkApp (ftok, []))
in (FStar_All.pipe_left (fun _119_361 -> Some (_119_361)) _119_362))
in (x, fname, _119_363, None))
in Binding_fvar (_119_364))
in (_119_365)::env.bindings)
in {bindings = _119_366; depth = _53_295.depth; tcenv = _53_295.tcenv; warn = _53_295.warn; cache = _53_295.cache; nolabels = _53_295.nolabels; use_zfuel_name = _53_295.use_zfuel_name; encode_non_total_function_typ = _53_295.encode_non_total_function_typ}))
in (fname, ftok, _119_367)))))

let try_lookup_lid = (fun env a -> (lookup_binding env (fun _53_5 -> (match (_53_5) with
| Binding_fvar (b, t1, t2, t3) when (FStar_Absyn_Syntax.lid_equals b a) -> begin
Some ((t1, t2, t3))
end
| _53_307 -> begin
None
end))))

let lookup_lid = (fun env a -> (match ((try_lookup_lid env a)) with
| None -> begin
(let _119_378 = (let _119_377 = (FStar_Absyn_Print.sli a)
in (FStar_Util.format1 "Name not found: %s" _119_377))
in (FStar_All.failwith _119_378))
end
| Some (s) -> begin
s
end))

let push_free_var = (fun env x fname ftok -> (let _53_317 = env
in {bindings = (Binding_fvar ((x, fname, ftok, None)))::env.bindings; depth = _53_317.depth; tcenv = _53_317.tcenv; warn = _53_317.warn; cache = _53_317.cache; nolabels = _53_317.nolabels; use_zfuel_name = _53_317.use_zfuel_name; encode_non_total_function_typ = _53_317.encode_non_total_function_typ}))

let push_zfuel_name = (fun env x f -> (let _53_326 = (lookup_lid env x)
in (match (_53_326) with
| (t1, t2, _53_325) -> begin
(let t3 = (let _119_395 = (let _119_394 = (let _119_393 = (FStar_ToSMT_Term.mkApp ("ZFuel", []))
in (_119_393)::[])
in (f, _119_394))
in (FStar_ToSMT_Term.mkApp _119_395))
in (let _53_328 = env
in {bindings = (Binding_fvar ((x, t1, t2, Some (t3))))::env.bindings; depth = _53_328.depth; tcenv = _53_328.tcenv; warn = _53_328.warn; cache = _53_328.cache; nolabels = _53_328.nolabels; use_zfuel_name = _53_328.use_zfuel_name; encode_non_total_function_typ = _53_328.encode_non_total_function_typ}))
end)))

let lookup_free_var = (fun env a -> (let _53_335 = (lookup_lid env a.FStar_Absyn_Syntax.v)
in (match (_53_335) with
| (name, sym, zf_opt) -> begin
(match (zf_opt) with
| Some (f) when env.use_zfuel_name -> begin
f
end
| _53_339 -> begin
(match (sym) with
| Some (t) -> begin
(match (t.FStar_ToSMT_Term.tm) with
| FStar_ToSMT_Term.App (_53_343, fuel::[]) -> begin
(match ((let _119_399 = (let _119_398 = (FStar_ToSMT_Term.fv_of_term fuel)
in (FStar_All.pipe_right _119_398 Prims.fst))
in (FStar_Util.starts_with _119_399 "fuel"))) with
| true -> begin
(let _119_400 = (FStar_ToSMT_Term.mkFreeV (name, FStar_ToSMT_Term.Term_sort))
in (FStar_ToSMT_Term.mk_ApplyEF _119_400 fuel))
end
| false -> begin
t
end)
end
| _53_349 -> begin
t
end)
end
| _53_351 -> begin
(let _119_402 = (let _119_401 = (FStar_Absyn_Print.sli a.FStar_Absyn_Syntax.v)
in (FStar_Util.format1 "Name not found: %s" _119_401))
in (FStar_All.failwith _119_402))
end)
end)
end)))

let lookup_free_var_name = (fun env a -> (let _53_359 = (lookup_lid env a.FStar_Absyn_Syntax.v)
in (match (_53_359) with
| (x, _53_356, _53_358) -> begin
x
end)))

let lookup_free_var_sym = (fun env a -> (let _53_365 = (lookup_lid env a.FStar_Absyn_Syntax.v)
in (match (_53_365) with
| (name, sym, zf_opt) -> begin
(match (zf_opt) with
| Some ({FStar_ToSMT_Term.tm = FStar_ToSMT_Term.App (g, zf); FStar_ToSMT_Term.hash = _53_369; FStar_ToSMT_Term.freevars = _53_367}) when env.use_zfuel_name -> begin
(g, zf)
end
| _53_377 -> begin
(match (sym) with
| None -> begin
(FStar_ToSMT_Term.Var (name), [])
end
| Some (sym) -> begin
(match (sym.FStar_ToSMT_Term.tm) with
| FStar_ToSMT_Term.App (g, fuel::[]) -> begin
(g, (fuel)::[])
end
| _53_387 -> begin
(FStar_ToSMT_Term.Var (name), [])
end)
end)
end)
end)))

let new_typ_constant_and_tok_from_lid = (fun env x -> (let fname = (varops.new_fvar x)
in (let ftok = (Prims.strcat fname "@tok")
in (let _119_417 = (let _53_392 = env
in (let _119_416 = (let _119_415 = (let _119_414 = (let _119_413 = (let _119_412 = (FStar_ToSMT_Term.mkApp (ftok, []))
in (FStar_All.pipe_left (fun _119_411 -> Some (_119_411)) _119_412))
in (x, fname, _119_413))
in Binding_ftvar (_119_414))
in (_119_415)::env.bindings)
in {bindings = _119_416; depth = _53_392.depth; tcenv = _53_392.tcenv; warn = _53_392.warn; cache = _53_392.cache; nolabels = _53_392.nolabels; use_zfuel_name = _53_392.use_zfuel_name; encode_non_total_function_typ = _53_392.encode_non_total_function_typ}))
in (fname, ftok, _119_417)))))

let lookup_tlid = (fun env a -> (match ((lookup_binding env (fun _53_6 -> (match (_53_6) with
| Binding_ftvar (b, t1, t2) when (FStar_Absyn_Syntax.lid_equals b a) -> begin
Some ((t1, t2))
end
| _53_403 -> begin
None
end)))) with
| None -> begin
(let _119_424 = (let _119_423 = (FStar_Absyn_Print.sli a)
in (FStar_Util.format1 "Type name not found: %s" _119_423))
in (FStar_All.failwith _119_424))
end
| Some (s) -> begin
s
end))

let push_free_tvar = (fun env x fname ftok -> (let _53_411 = env
in {bindings = (Binding_ftvar ((x, fname, ftok)))::env.bindings; depth = _53_411.depth; tcenv = _53_411.tcenv; warn = _53_411.warn; cache = _53_411.cache; nolabels = _53_411.nolabels; use_zfuel_name = _53_411.use_zfuel_name; encode_non_total_function_typ = _53_411.encode_non_total_function_typ}))

let lookup_free_tvar = (fun env a -> (match ((let _119_435 = (lookup_tlid env a.FStar_Absyn_Syntax.v)
in (FStar_All.pipe_right _119_435 Prims.snd))) with
| None -> begin
(let _119_437 = (let _119_436 = (FStar_Absyn_Print.sli a.FStar_Absyn_Syntax.v)
in (FStar_Util.format1 "Type name not found: %s" _119_436))
in (FStar_All.failwith _119_437))
end
| Some (t) -> begin
t
end))

let lookup_free_tvar_name = (fun env a -> (let _119_440 = (lookup_tlid env a.FStar_Absyn_Syntax.v)
in (FStar_All.pipe_right _119_440 Prims.fst)))

let tok_of_name = (fun env nm -> (FStar_Util.find_map env.bindings (fun _53_7 -> (match (_53_7) with
| (Binding_fvar (_, nm', tok, _)) | (Binding_ftvar (_, nm', tok)) when (nm = nm') -> begin
tok
end
| _53_436 -> begin
None
end))))

let mkForall_fuel' = (fun n _53_441 -> (match (_53_441) with
| (pats, vars, body) -> begin
(let fallback = (fun _53_443 -> (match (()) with
| () -> begin
(FStar_ToSMT_Term.mkForall (pats, vars, body))
end))
in (match ((FStar_ST.read FStar_Options.unthrottle_inductives)) with
| true -> begin
(fallback ())
end
| false -> begin
(let _53_446 = (fresh_fvar "f" FStar_ToSMT_Term.Fuel_sort)
in (match (_53_446) with
| (fsym, fterm) -> begin
(let add_fuel = (fun tms -> (FStar_All.pipe_right tms (FStar_List.map (fun p -> (match (p.FStar_ToSMT_Term.tm) with
| FStar_ToSMT_Term.App (FStar_ToSMT_Term.Var ("HasType"), args) -> begin
(FStar_ToSMT_Term.mkApp ("HasTypeFuel", (fterm)::args))
end
| _53_456 -> begin
p
end)))))
in (let pats = (add_fuel pats)
in (let body = (match (body.FStar_ToSMT_Term.tm) with
| FStar_ToSMT_Term.App (FStar_ToSMT_Term.Imp, guard::body'::[]) -> begin
(let guard = (match (guard.FStar_ToSMT_Term.tm) with
| FStar_ToSMT_Term.App (FStar_ToSMT_Term.And, guards) -> begin
(let _119_453 = (add_fuel guards)
in (FStar_ToSMT_Term.mk_and_l _119_453))
end
| _53_469 -> begin
(let _119_454 = (add_fuel ((guard)::[]))
in (FStar_All.pipe_right _119_454 FStar_List.hd))
end)
in (FStar_ToSMT_Term.mkImp (guard, body')))
end
| _53_472 -> begin
body
end)
in (let vars = ((fsym, FStar_ToSMT_Term.Fuel_sort))::vars
in (FStar_ToSMT_Term.mkForall (pats, vars, body))))))
end))
end))
end))

let mkForall_fuel = (mkForall_fuel' 1)

let head_normal = (fun env t -> (let t = (FStar_Absyn_Util.unmeta_typ t)
in (match (t.FStar_Absyn_Syntax.n) with
| (FStar_Absyn_Syntax.Typ_fun (_)) | (FStar_Absyn_Syntax.Typ_refine (_)) | (FStar_Absyn_Syntax.Typ_btvar (_)) | (FStar_Absyn_Syntax.Typ_uvar (_)) | (FStar_Absyn_Syntax.Typ_lam (_)) -> begin
true
end
| (FStar_Absyn_Syntax.Typ_const (v)) | (FStar_Absyn_Syntax.Typ_app ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Typ_const (v); FStar_Absyn_Syntax.tk = _; FStar_Absyn_Syntax.pos = _; FStar_Absyn_Syntax.fvs = _; FStar_Absyn_Syntax.uvs = _}, _)) -> begin
(let _119_460 = (FStar_Tc_Env.lookup_typ_abbrev env.tcenv v.FStar_Absyn_Syntax.v)
in (FStar_All.pipe_right _119_460 FStar_Option.isNone))
end
| _53_510 -> begin
false
end)))

let whnf = (fun env t -> (match ((head_normal env t)) with
| true -> begin
t
end
| false -> begin
(FStar_Tc_Normalize.norm_typ ((FStar_Tc_Normalize.Beta)::(FStar_Tc_Normalize.WHNF)::(FStar_Tc_Normalize.DeltaHard)::[]) env.tcenv t)
end))

let whnf_e = (fun env e -> (FStar_Tc_Normalize.norm_exp ((FStar_Tc_Normalize.Beta)::(FStar_Tc_Normalize.WHNF)::[]) env.tcenv e))

let norm_t = (fun env t -> (FStar_Tc_Normalize.norm_typ ((FStar_Tc_Normalize.Beta)::[]) env.tcenv t))

let norm_k = (fun env k -> (FStar_Tc_Normalize.normalize_kind env.tcenv k))

let trivial_post = (fun t -> (let _119_482 = (let _119_481 = (let _119_479 = (FStar_Absyn_Syntax.null_v_binder t)
in (_119_479)::[])
in (let _119_480 = (FStar_Absyn_Util.ftv FStar_Absyn_Const.true_lid FStar_Absyn_Syntax.ktype)
in (_119_481, _119_480)))
in (FStar_Absyn_Syntax.mk_Typ_lam _119_482 None t.FStar_Absyn_Syntax.pos)))

let mk_ApplyE = (fun e vars -> (FStar_All.pipe_right vars (FStar_List.fold_left (fun out var -> (match ((Prims.snd var)) with
| FStar_ToSMT_Term.Type_sort -> begin
(let _119_489 = (FStar_ToSMT_Term.mkFreeV var)
in (FStar_ToSMT_Term.mk_ApplyET out _119_489))
end
| FStar_ToSMT_Term.Fuel_sort -> begin
(let _119_490 = (FStar_ToSMT_Term.mkFreeV var)
in (FStar_ToSMT_Term.mk_ApplyEF out _119_490))
end
| _53_527 -> begin
(let _119_491 = (FStar_ToSMT_Term.mkFreeV var)
in (FStar_ToSMT_Term.mk_ApplyEE out _119_491))
end)) e)))

let mk_ApplyE_args = (fun e args -> (FStar_All.pipe_right args (FStar_List.fold_left (fun out arg -> (match (arg) with
| FStar_Util.Inl (t) -> begin
(FStar_ToSMT_Term.mk_ApplyET out t)
end
| FStar_Util.Inr (e) -> begin
(FStar_ToSMT_Term.mk_ApplyEE out e)
end)) e)))

let mk_ApplyT = (fun t vars -> (FStar_All.pipe_right vars (FStar_List.fold_left (fun out var -> (match ((Prims.snd var)) with
| FStar_ToSMT_Term.Type_sort -> begin
(let _119_504 = (FStar_ToSMT_Term.mkFreeV var)
in (FStar_ToSMT_Term.mk_ApplyTT out _119_504))
end
| _53_542 -> begin
(let _119_505 = (FStar_ToSMT_Term.mkFreeV var)
in (FStar_ToSMT_Term.mk_ApplyTE out _119_505))
end)) t)))

let mk_ApplyT_args = (fun t args -> (FStar_All.pipe_right args (FStar_List.fold_left (fun out arg -> (match (arg) with
| FStar_Util.Inl (t) -> begin
(FStar_ToSMT_Term.mk_ApplyTT out t)
end
| FStar_Util.Inr (e) -> begin
(FStar_ToSMT_Term.mk_ApplyTE out e)
end)) t)))

let is_app = (fun _53_8 -> (match (_53_8) with
| (FStar_ToSMT_Term.Var ("ApplyTT")) | (FStar_ToSMT_Term.Var ("ApplyTE")) | (FStar_ToSMT_Term.Var ("ApplyET")) | (FStar_ToSMT_Term.Var ("ApplyEE")) -> begin
true
end
| _53_561 -> begin
false
end))

let is_eta = (fun env vars t -> (let rec aux = (fun t xs -> (match ((t.FStar_ToSMT_Term.tm, xs)) with
| (FStar_ToSMT_Term.App (app, f::{FStar_ToSMT_Term.tm = FStar_ToSMT_Term.FreeV (y); FStar_ToSMT_Term.hash = _53_572; FStar_ToSMT_Term.freevars = _53_570}::[]), x::xs) when ((is_app app) && (FStar_ToSMT_Term.fv_eq x y)) -> begin
(aux f xs)
end
| (FStar_ToSMT_Term.App (FStar_ToSMT_Term.Var (f), args), _53_590) -> begin
(match ((((FStar_List.length args) = (FStar_List.length vars)) && (FStar_List.forall2 (fun a v -> (match (a.FStar_ToSMT_Term.tm) with
| FStar_ToSMT_Term.FreeV (fv) -> begin
(FStar_ToSMT_Term.fv_eq fv v)
end
| _53_597 -> begin
false
end)) args vars))) with
| true -> begin
(tok_of_name env f)
end
| false -> begin
None
end)
end
| (_53_599, []) -> begin
(let fvs = (FStar_ToSMT_Term.free_variables t)
in (match ((FStar_All.pipe_right fvs (FStar_List.for_all (fun fv -> (not ((FStar_Util.for_some (FStar_ToSMT_Term.fv_eq fv) vars))))))) with
| true -> begin
Some (t)
end
| false -> begin
None
end))
end
| _53_605 -> begin
None
end))
in (aux t (FStar_List.rev vars))))

type label =
(FStar_ToSMT_Term.fv * Prims.string * FStar_Range.range)

type labels =
label Prims.list

type pattern =
{pat_vars : (FStar_Absyn_Syntax.either_var * FStar_ToSMT_Term.fv) Prims.list; pat_term : Prims.unit  ->  (FStar_ToSMT_Term.term * FStar_ToSMT_Term.decls_t); guard : FStar_ToSMT_Term.term  ->  FStar_ToSMT_Term.term; projections : FStar_ToSMT_Term.term  ->  (FStar_Absyn_Syntax.either_var * FStar_ToSMT_Term.term) Prims.list}

let is_Mkpattern = (fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkpattern"))

exception Let_rec_unencodeable

let is_Let_rec_unencodeable = (fun _discr_ -> (match (_discr_) with
| Let_rec_unencodeable -> begin
true
end
| _ -> begin
false
end))

let encode_const = (fun _53_9 -> (match (_53_9) with
| FStar_Absyn_Syntax.Const_unit -> begin
FStar_ToSMT_Term.mk_Term_unit
end
| FStar_Absyn_Syntax.Const_bool (true) -> begin
(FStar_ToSMT_Term.boxBool FStar_ToSMT_Term.mkTrue)
end
| FStar_Absyn_Syntax.Const_bool (false) -> begin
(FStar_ToSMT_Term.boxBool FStar_ToSMT_Term.mkFalse)
end
| FStar_Absyn_Syntax.Const_char (c) -> begin
(let _119_561 = (FStar_ToSMT_Term.mkInteger' (FStar_Util.int_of_char c))
in (FStar_ToSMT_Term.boxInt _119_561))
end
| FStar_Absyn_Syntax.Const_uint8 (i) -> begin
(let _119_562 = (FStar_ToSMT_Term.mkInteger' (FStar_Util.int_of_uint8 i))
in (FStar_ToSMT_Term.boxInt _119_562))
end
| FStar_Absyn_Syntax.Const_int (i) -> begin
(let _119_563 = (FStar_ToSMT_Term.mkInteger i)
in (FStar_ToSMT_Term.boxInt _119_563))
end
| FStar_Absyn_Syntax.Const_int32 (i) -> begin
(let _119_567 = (let _119_566 = (let _119_565 = (let _119_564 = (FStar_ToSMT_Term.mkInteger32 i)
in (FStar_ToSMT_Term.boxInt _119_564))
in (_119_565)::[])
in ("FStar.Int32.Int32", _119_566))
in (FStar_ToSMT_Term.mkApp _119_567))
end
| FStar_Absyn_Syntax.Const_string (bytes, _53_627) -> begin
(let _119_568 = (FStar_All.pipe_left FStar_Util.string_of_bytes bytes)
in (varops.string_const _119_568))
end
| c -> begin
(let _119_570 = (let _119_569 = (FStar_Absyn_Print.const_to_string c)
in (FStar_Util.format1 "Unhandled constant: %s\n" _119_569))
in (FStar_All.failwith _119_570))
end))

let as_function_typ = (fun env t0 -> (let rec aux = (fun norm t -> (let t = (FStar_Absyn_Util.compress_typ t)
in (match (t.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_fun (_53_638) -> begin
t
end
| FStar_Absyn_Syntax.Typ_refine (_53_641) -> begin
(let _119_579 = (FStar_Absyn_Util.unrefine t)
in (aux true _119_579))
end
| _53_644 -> begin
(match (norm) with
| true -> begin
(let _119_580 = (whnf env t)
in (aux false _119_580))
end
| false -> begin
(let _119_583 = (let _119_582 = (FStar_Range.string_of_range t0.FStar_Absyn_Syntax.pos)
in (let _119_581 = (FStar_Absyn_Print.typ_to_string t0)
in (FStar_Util.format2 "(%s) Expected a function typ; got %s" _119_582 _119_581)))
in (FStar_All.failwith _119_583))
end)
end)))
in (aux true t0)))

let rec encode_knd_term = (fun k env -> (match ((let _119_620 = (FStar_Absyn_Util.compress_kind k)
in _119_620.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Kind_type -> begin
(FStar_ToSMT_Term.mk_Kind_type, [])
end
| FStar_Absyn_Syntax.Kind_abbrev (_53_649, k0) -> begin
(let _53_653 = (match ((FStar_Tc_Env.debug env.tcenv (FStar_Options.Other ("Encoding")))) with
| true -> begin
(let _119_622 = (FStar_Absyn_Print.kind_to_string k)
in (let _119_621 = (FStar_Absyn_Print.kind_to_string k0)
in (FStar_Util.fprint2 "Encoding kind abbrev %s, expanded to %s\n" _119_622 _119_621)))
end
| false -> begin
()
end)
in (encode_knd_term k0 env))
end
| FStar_Absyn_Syntax.Kind_uvar (uv, _53_657) -> begin
(let _119_624 = (let _119_623 = (FStar_Unionfind.uvar_id uv)
in (FStar_ToSMT_Term.mk_Kind_uvar _119_623))
in (_119_624, []))
end
| FStar_Absyn_Syntax.Kind_arrow (bs, kbody) -> begin
(let tsym = (let _119_625 = (varops.fresh "t")
in (_119_625, FStar_ToSMT_Term.Type_sort))
in (let t = (FStar_ToSMT_Term.mkFreeV tsym)
in (let _53_672 = (encode_binders None bs env)
in (match (_53_672) with
| (vars, guards, env', decls, _53_671) -> begin
(let app = (mk_ApplyT t vars)
in (let _53_676 = (encode_knd kbody env' app)
in (match (_53_676) with
| (kbody, decls') -> begin
(let rec aux = (fun app vars guards -> (match ((vars, guards)) with
| ([], []) -> begin
kbody
end
| (x::vars, g::guards) -> begin
(let app = (mk_ApplyT app ((x)::[]))
in (let body = (aux app vars guards)
in (let body = (match (vars) with
| [] -> begin
body
end
| _53_695 -> begin
(let _119_634 = (let _119_633 = (let _119_632 = (FStar_ToSMT_Term.mk_PreKind app)
in (FStar_ToSMT_Term.mk_tester "Kind_arrow" _119_632))
in (_119_633, body))
in (FStar_ToSMT_Term.mkAnd _119_634))
end)
in (let _119_636 = (let _119_635 = (FStar_ToSMT_Term.mkImp (g, body))
in ((app)::[], (x)::[], _119_635))
in (FStar_ToSMT_Term.mkForall _119_636)))))
end
| _53_698 -> begin
(FStar_All.failwith "Impossible: vars and guards are in 1-1 correspondence")
end))
in (let k_interp = (aux t vars guards)
in (let cvars = (let _119_638 = (FStar_ToSMT_Term.free_variables k_interp)
in (FStar_All.pipe_right _119_638 (FStar_List.filter (fun _53_703 -> (match (_53_703) with
| (x, _53_702) -> begin
(x <> (Prims.fst tsym))
end)))))
in (let tkey = (FStar_ToSMT_Term.mkForall ([], (tsym)::cvars, k_interp))
in (match ((FStar_Util.smap_try_find env.cache tkey.FStar_ToSMT_Term.hash)) with
| Some (k', sorts, _53_709) -> begin
(let _119_641 = (let _119_640 = (let _119_639 = (FStar_All.pipe_right cvars (FStar_List.map FStar_ToSMT_Term.mkFreeV))
in (k', _119_639))
in (FStar_ToSMT_Term.mkApp _119_640))
in (_119_641, []))
end
| None -> begin
(let ksym = (varops.fresh "Kind_arrow")
in (let cvar_sorts = (FStar_List.map Prims.snd cvars)
in (let caption = (match ((FStar_ST.read FStar_Options.logQueries)) with
| true -> begin
(let _119_642 = (FStar_Tc_Normalize.kind_norm_to_string env.tcenv k)
in Some (_119_642))
end
| false -> begin
None
end)
in (let kdecl = FStar_ToSMT_Term.DeclFun ((ksym, cvar_sorts, FStar_ToSMT_Term.Kind_sort, caption))
in (let k = (let _119_644 = (let _119_643 = (FStar_List.map FStar_ToSMT_Term.mkFreeV cvars)
in (ksym, _119_643))
in (FStar_ToSMT_Term.mkApp _119_644))
in (let t_has_k = (FStar_ToSMT_Term.mk_HasKind t k)
in (let k_interp = (let _119_653 = (let _119_652 = (let _119_651 = (let _119_650 = (let _119_649 = (let _119_648 = (let _119_647 = (let _119_646 = (let _119_645 = (FStar_ToSMT_Term.mk_PreKind t)
in (FStar_ToSMT_Term.mk_tester "Kind_arrow" _119_645))
in (_119_646, k_interp))
in (FStar_ToSMT_Term.mkAnd _119_647))
in (t_has_k, _119_648))
in (FStar_ToSMT_Term.mkIff _119_649))
in ((t_has_k)::[], (tsym)::cvars, _119_650))
in (FStar_ToSMT_Term.mkForall _119_651))
in (_119_652, Some ((Prims.strcat ksym " interpretation"))))
in FStar_ToSMT_Term.Assume (_119_653))
in (let k_decls = (FStar_List.append (FStar_List.append decls decls') ((kdecl)::(k_interp)::[]))
in (let _53_721 = (FStar_Util.smap_add env.cache tkey.FStar_ToSMT_Term.hash (ksym, cvar_sorts, k_decls))
in (k, k_decls))))))))))
end)))))
end)))
end))))
end
| _53_724 -> begin
(let _119_655 = (let _119_654 = (FStar_Absyn_Print.kind_to_string k)
in (FStar_Util.format1 "Unknown kind: %s" _119_654))
in (FStar_All.failwith _119_655))
end))
and encode_knd = (fun k env t -> (let _53_730 = (encode_knd_term k env)
in (match (_53_730) with
| (k, decls) -> begin
(let _119_659 = (FStar_ToSMT_Term.mk_HasKind t k)
in (_119_659, decls))
end)))
and encode_binders = (fun fuel_opt bs env -> (let _53_734 = (match ((FStar_Tc_Env.debug env.tcenv FStar_Options.Low)) with
| true -> begin
(let _119_663 = (FStar_Absyn_Print.binders_to_string ", " bs)
in (FStar_Util.fprint1 "Encoding binders %s\n" _119_663))
end
| false -> begin
()
end)
in (let _53_784 = (FStar_All.pipe_right bs (FStar_List.fold_left (fun _53_741 b -> (match (_53_741) with
| (vars, guards, env, decls, names) -> begin
(let _53_778 = (match ((Prims.fst b)) with
| FStar_Util.Inl ({FStar_Absyn_Syntax.v = a; FStar_Absyn_Syntax.sort = k; FStar_Absyn_Syntax.p = _53_744}) -> begin
(let a = (unmangle a)
in (let _53_753 = (gen_typ_var env a)
in (match (_53_753) with
| (aasym, aa, env') -> begin
(let _53_754 = (match ((FStar_Tc_Env.debug env.tcenv (FStar_Options.Other ("Encoding")))) with
| true -> begin
(let _119_667 = (FStar_Absyn_Print.strBvd a)
in (let _119_666 = (FStar_Absyn_Print.kind_to_string k)
in (FStar_Util.fprint3 "Encoding type binder %s (%s) at kind %s\n" _119_667 aasym _119_666)))
end
| false -> begin
()
end)
in (let _53_758 = (encode_knd k env aa)
in (match (_53_758) with
| (guard_a_k, decls') -> begin
((aasym, FStar_ToSMT_Term.Type_sort), guard_a_k, env', decls', FStar_Util.Inl (a))
end)))
end)))
end
| FStar_Util.Inr ({FStar_Absyn_Syntax.v = x; FStar_Absyn_Syntax.sort = t; FStar_Absyn_Syntax.p = _53_760}) -> begin
(let x = (unmangle x)
in (let _53_769 = (gen_term_var env x)
in (match (_53_769) with
| (xxsym, xx, env') -> begin
(let _53_772 = (let _119_668 = (norm_t env t)
in (encode_typ_pred fuel_opt _119_668 env xx))
in (match (_53_772) with
| (guard_x_t, decls') -> begin
((xxsym, FStar_ToSMT_Term.Term_sort), guard_x_t, env', decls', FStar_Util.Inr (x))
end))
end)))
end)
in (match (_53_778) with
| (v, g, env, decls', n) -> begin
((v)::vars, (g)::guards, env, (FStar_List.append decls decls'), (n)::names)
end))
end)) ([], [], env, [], [])))
in (match (_53_784) with
| (vars, guards, env, decls, names) -> begin
((FStar_List.rev vars), (FStar_List.rev guards), env, decls, (FStar_List.rev names))
end))))
and encode_typ_pred = (fun fuel_opt t env e -> (let t = (FStar_Absyn_Util.compress_typ t)
in (let _53_792 = (encode_typ_term t env)
in (match (_53_792) with
| (t, decls) -> begin
(let _119_673 = (FStar_ToSMT_Term.mk_HasTypeWithFuel fuel_opt e t)
in (_119_673, decls))
end))))
and encode_typ_pred' = (fun fuel_opt t env e -> (let t = (FStar_Absyn_Util.compress_typ t)
in (let _53_800 = (encode_typ_term t env)
in (match (_53_800) with
| (t, decls) -> begin
(match (fuel_opt) with
| None -> begin
(let _119_678 = (FStar_ToSMT_Term.mk_HasTypeZ e t)
in (_119_678, decls))
end
| Some (f) -> begin
(let _119_679 = (FStar_ToSMT_Term.mk_HasTypeFuel f e t)
in (_119_679, decls))
end)
end))))
and encode_typ_term = (fun t env -> (let t0 = (FStar_Absyn_Util.compress_typ t)
in (match (t0.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_btvar (a) -> begin
(let _119_682 = (lookup_typ_var env a)
in (_119_682, []))
end
| FStar_Absyn_Syntax.Typ_const (fv) -> begin
(let _119_683 = (lookup_free_tvar env fv)
in (_119_683, []))
end
| FStar_Absyn_Syntax.Typ_fun (binders, res) -> begin
(match (((env.encode_non_total_function_typ && (FStar_Absyn_Util.is_pure_or_ghost_comp res)) || (FStar_Absyn_Util.is_tot_or_gtot_comp res))) with
| true -> begin
(let _53_821 = (encode_binders None binders env)
in (match (_53_821) with
| (vars, guards, env', decls, _53_820) -> begin
(let fsym = (let _119_684 = (varops.fresh "f")
in (_119_684, FStar_ToSMT_Term.Term_sort))
in (let f = (FStar_ToSMT_Term.mkFreeV fsym)
in (let app = (mk_ApplyE f vars)
in (let _53_827 = (FStar_Tc_Util.pure_or_ghost_pre_and_post env.tcenv res)
in (match (_53_827) with
| (pre_opt, res_t) -> begin
(let _53_830 = (encode_typ_pred None res_t env' app)
in (match (_53_830) with
| (res_pred, decls') -> begin
(let _53_839 = (match (pre_opt) with
| None -> begin
(let _119_685 = (FStar_ToSMT_Term.mk_and_l guards)
in (_119_685, decls))
end
| Some (pre) -> begin
(let _53_836 = (encode_formula pre env')
in (match (_53_836) with
| (guard, decls0) -> begin
(let _119_686 = (FStar_ToSMT_Term.mk_and_l ((guard)::guards))
in (_119_686, (FStar_List.append decls decls0)))
end))
end)
in (match (_53_839) with
| (guards, guard_decls) -> begin
(let t_interp = (let _119_688 = (let _119_687 = (FStar_ToSMT_Term.mkImp (guards, res_pred))
in ((app)::[], vars, _119_687))
in (FStar_ToSMT_Term.mkForall _119_688))
in (let cvars = (let _119_690 = (FStar_ToSMT_Term.free_variables t_interp)
in (FStar_All.pipe_right _119_690 (FStar_List.filter (fun _53_844 -> (match (_53_844) with
| (x, _53_843) -> begin
(x <> (Prims.fst fsym))
end)))))
in (let tkey = (FStar_ToSMT_Term.mkForall ([], (fsym)::cvars, t_interp))
in (match ((FStar_Util.smap_try_find env.cache tkey.FStar_ToSMT_Term.hash)) with
| Some (t', sorts, _53_850) -> begin
(let _119_693 = (let _119_692 = (let _119_691 = (FStar_All.pipe_right cvars (FStar_List.map FStar_ToSMT_Term.mkFreeV))
in (t', _119_691))
in (FStar_ToSMT_Term.mkApp _119_692))
in (_119_693, []))
end
| None -> begin
(let tsym = (varops.fresh "Typ_fun")
in (let cvar_sorts = (FStar_List.map Prims.snd cvars)
in (let caption = (match ((FStar_ST.read FStar_Options.logQueries)) with
| true -> begin
(let _119_694 = (FStar_Tc_Normalize.typ_norm_to_string env.tcenv t0)
in Some (_119_694))
end
| false -> begin
None
end)
in (let tdecl = FStar_ToSMT_Term.DeclFun ((tsym, cvar_sorts, FStar_ToSMT_Term.Type_sort, caption))
in (let t = (let _119_696 = (let _119_695 = (FStar_List.map FStar_ToSMT_Term.mkFreeV cvars)
in (tsym, _119_695))
in (FStar_ToSMT_Term.mkApp _119_696))
in (let t_has_kind = (FStar_ToSMT_Term.mk_HasKind t FStar_ToSMT_Term.mk_Kind_type)
in (let k_assumption = (let _119_698 = (let _119_697 = (FStar_ToSMT_Term.mkForall ((t_has_kind)::[], cvars, t_has_kind))
in (_119_697, Some ((Prims.strcat tsym " kinding"))))
in FStar_ToSMT_Term.Assume (_119_698))
in (let f_has_t = (FStar_ToSMT_Term.mk_HasType f t)
in (let f_has_t_z = (FStar_ToSMT_Term.mk_HasTypeZ f t)
in (let pre_typing = (let _119_705 = (let _119_704 = (let _119_703 = (let _119_702 = (let _119_701 = (let _119_700 = (let _119_699 = (FStar_ToSMT_Term.mk_PreType f)
in (FStar_ToSMT_Term.mk_tester "Typ_fun" _119_699))
in (f_has_t, _119_700))
in (FStar_ToSMT_Term.mkImp _119_701))
in ((f_has_t)::[], (fsym)::cvars, _119_702))
in (mkForall_fuel _119_703))
in (_119_704, Some ("pre-typing for functions")))
in FStar_ToSMT_Term.Assume (_119_705))
in (let t_interp = (let _119_709 = (let _119_708 = (let _119_707 = (let _119_706 = (FStar_ToSMT_Term.mkIff (f_has_t_z, t_interp))
in ((f_has_t_z)::[], (fsym)::cvars, _119_706))
in (FStar_ToSMT_Term.mkForall _119_707))
in (_119_708, Some ((Prims.strcat tsym " interpretation"))))
in FStar_ToSMT_Term.Assume (_119_709))
in (let t_decls = (FStar_List.append (FStar_List.append decls decls') ((tdecl)::(k_assumption)::(pre_typing)::(t_interp)::[]))
in (let _53_866 = (FStar_Util.smap_add env.cache tkey.FStar_ToSMT_Term.hash (tsym, cvar_sorts, t_decls))
in (t, t_decls))))))))))))))
end))))
end))
end))
end)))))
end))
end
| false -> begin
(let tsym = (varops.fresh "Non_total_Typ_fun")
in (let tdecl = FStar_ToSMT_Term.DeclFun ((tsym, [], FStar_ToSMT_Term.Type_sort, None))
in (let t = (FStar_ToSMT_Term.mkApp (tsym, []))
in (let t_kinding = (let _119_711 = (let _119_710 = (FStar_ToSMT_Term.mk_HasKind t FStar_ToSMT_Term.mk_Kind_type)
in (_119_710, None))
in FStar_ToSMT_Term.Assume (_119_711))
in (let fsym = ("f", FStar_ToSMT_Term.Term_sort)
in (let f = (FStar_ToSMT_Term.mkFreeV fsym)
in (let f_has_t = (FStar_ToSMT_Term.mk_HasType f t)
in (let t_interp = (let _119_718 = (let _119_717 = (let _119_716 = (let _119_715 = (let _119_714 = (let _119_713 = (let _119_712 = (FStar_ToSMT_Term.mk_PreType f)
in (FStar_ToSMT_Term.mk_tester "Typ_fun" _119_712))
in (f_has_t, _119_713))
in (FStar_ToSMT_Term.mkImp _119_714))
in ((f_has_t)::[], (fsym)::[], _119_715))
in (mkForall_fuel _119_716))
in (_119_717, Some ("pre-typing")))
in FStar_ToSMT_Term.Assume (_119_718))
in (t, (tdecl)::(t_kinding)::(t_interp)::[])))))))))
end)
end
| FStar_Absyn_Syntax.Typ_refine (_53_877) -> begin
(let _53_896 = (match ((FStar_Tc_Normalize.normalize_refinement env.tcenv t0)) with
| {FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Typ_refine (x, f); FStar_Absyn_Syntax.tk = _53_886; FStar_Absyn_Syntax.pos = _53_884; FStar_Absyn_Syntax.fvs = _53_882; FStar_Absyn_Syntax.uvs = _53_880} -> begin
(x, f)
end
| _53_893 -> begin
(FStar_All.failwith "impossible")
end)
in (match (_53_896) with
| (x, f) -> begin
(let _53_899 = (encode_typ_term x.FStar_Absyn_Syntax.sort env)
in (match (_53_899) with
| (base_t, decls) -> begin
(let _53_903 = (gen_term_var env x.FStar_Absyn_Syntax.v)
in (match (_53_903) with
| (x, xtm, env') -> begin
(let _53_906 = (encode_formula f env')
in (match (_53_906) with
| (refinement, decls') -> begin
(let _53_909 = (fresh_fvar "f" FStar_ToSMT_Term.Fuel_sort)
in (match (_53_909) with
| (fsym, fterm) -> begin
(let encoding = (let _119_720 = (let _119_719 = (FStar_ToSMT_Term.mk_HasTypeWithFuel (Some (fterm)) xtm base_t)
in (_119_719, refinement))
in (FStar_ToSMT_Term.mkAnd _119_720))
in (let cvars = (let _119_722 = (FStar_ToSMT_Term.free_variables encoding)
in (FStar_All.pipe_right _119_722 (FStar_List.filter (fun _53_914 -> (match (_53_914) with
| (y, _53_913) -> begin
((y <> x) && (y <> fsym))
end)))))
in (let xfv = (x, FStar_ToSMT_Term.Term_sort)
in (let ffv = (fsym, FStar_ToSMT_Term.Fuel_sort)
in (let tkey = (FStar_ToSMT_Term.mkForall ([], (ffv)::(xfv)::cvars, encoding))
in (match ((FStar_Util.smap_try_find env.cache tkey.FStar_ToSMT_Term.hash)) with
| Some (t, _53_921, _53_923) -> begin
(let _119_725 = (let _119_724 = (let _119_723 = (FStar_All.pipe_right cvars (FStar_List.map FStar_ToSMT_Term.mkFreeV))
in (t, _119_723))
in (FStar_ToSMT_Term.mkApp _119_724))
in (_119_725, []))
end
| None -> begin
(let tsym = (varops.fresh "Typ_refine")
in (let cvar_sorts = (FStar_List.map Prims.snd cvars)
in (let tdecl = FStar_ToSMT_Term.DeclFun ((tsym, cvar_sorts, FStar_ToSMT_Term.Type_sort, None))
in (let t = (let _119_727 = (let _119_726 = (FStar_List.map FStar_ToSMT_Term.mkFreeV cvars)
in (tsym, _119_726))
in (FStar_ToSMT_Term.mkApp _119_727))
in (let x_has_t = (FStar_ToSMT_Term.mk_HasTypeWithFuel (Some (fterm)) xtm t)
in (let t_has_kind = (FStar_ToSMT_Term.mk_HasKind t FStar_ToSMT_Term.mk_Kind_type)
in (let t_kinding = (FStar_ToSMT_Term.mkForall ((t_has_kind)::[], cvars, t_has_kind))
in (let assumption = (let _119_729 = (let _119_728 = (FStar_ToSMT_Term.mkIff (x_has_t, encoding))
in ((x_has_t)::[], (ffv)::(xfv)::cvars, _119_728))
in (FStar_ToSMT_Term.mkForall _119_729))
in (let t_decls = (let _119_736 = (let _119_735 = (let _119_734 = (let _119_733 = (let _119_732 = (let _119_731 = (let _119_730 = (FStar_Absyn_Print.typ_to_string t0)
in Some (_119_730))
in (assumption, _119_731))
in FStar_ToSMT_Term.Assume (_119_732))
in (_119_733)::[])
in (FStar_ToSMT_Term.Assume ((t_kinding, None)))::_119_734)
in (tdecl)::_119_735)
in (FStar_List.append (FStar_List.append decls decls') _119_736))
in (let _53_936 = (FStar_Util.smap_add env.cache tkey.FStar_ToSMT_Term.hash (tsym, cvar_sorts, t_decls))
in (t, t_decls)))))))))))
end))))))
end))
end))
end))
end))
end))
end
| FStar_Absyn_Syntax.Typ_uvar (uv, k) -> begin
(let ttm = (let _119_737 = (FStar_Unionfind.uvar_id uv)
in (FStar_ToSMT_Term.mk_Typ_uvar _119_737))
in (let _53_945 = (encode_knd k env ttm)
in (match (_53_945) with
| (t_has_k, decls) -> begin
(let d = FStar_ToSMT_Term.Assume ((t_has_k, None))
in (ttm, (d)::decls))
end)))
end
| FStar_Absyn_Syntax.Typ_app (head, args) -> begin
(let is_full_app = (fun _53_952 -> (match (()) with
| () -> begin
(let kk = (FStar_Tc_Recheck.recompute_kind head)
in (let _53_957 = (FStar_Absyn_Util.kind_formals kk)
in (match (_53_957) with
| (formals, _53_956) -> begin
((FStar_List.length formals) = (FStar_List.length args))
end)))
end))
in (let head = (FStar_Absyn_Util.compress_typ head)
in (match (head.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_btvar (a) -> begin
(let head = (lookup_typ_var env a)
in (let _53_964 = (encode_args args env)
in (match (_53_964) with
| (args, decls) -> begin
(let t = (mk_ApplyT_args head args)
in (t, decls))
end)))
end
| FStar_Absyn_Syntax.Typ_const (fv) -> begin
(let _53_970 = (encode_args args env)
in (match (_53_970) with
| (args, decls) -> begin
(match ((is_full_app ())) with
| true -> begin
(let head = (lookup_free_tvar_name env fv)
in (let t = (let _119_742 = (let _119_741 = (FStar_List.map (fun _53_10 -> (match (_53_10) with
| (FStar_Util.Inl (t)) | (FStar_Util.Inr (t)) -> begin
t
end)) args)
in (head, _119_741))
in (FStar_ToSMT_Term.mkApp _119_742))
in (t, decls)))
end
| false -> begin
(let head = (lookup_free_tvar env fv)
in (let t = (mk_ApplyT_args head args)
in (t, decls)))
end)
end))
end
| FStar_Absyn_Syntax.Typ_uvar (uv, k) -> begin
(let ttm = (let _119_743 = (FStar_Unionfind.uvar_id uv)
in (FStar_ToSMT_Term.mk_Typ_uvar _119_743))
in (let _53_986 = (encode_knd k env ttm)
in (match (_53_986) with
| (t_has_k, decls) -> begin
(let d = FStar_ToSMT_Term.Assume ((t_has_k, None))
in (ttm, (d)::decls))
end)))
end
| _53_989 -> begin
(let t = (norm_t env t)
in (encode_typ_term t env))
end)))
end
| FStar_Absyn_Syntax.Typ_lam (bs, body) -> begin
(let _53_1001 = (encode_binders None bs env)
in (match (_53_1001) with
| (vars, guards, env, decls, _53_1000) -> begin
(let _53_1004 = (encode_typ_term body env)
in (match (_53_1004) with
| (body, decls') -> begin
(let key_body = (let _119_747 = (let _119_746 = (let _119_745 = (let _119_744 = (FStar_ToSMT_Term.mk_and_l guards)
in (_119_744, body))
in (FStar_ToSMT_Term.mkImp _119_745))
in ([], vars, _119_746))
in (FStar_ToSMT_Term.mkForall _119_747))
in (let cvars = (FStar_ToSMT_Term.free_variables key_body)
in (let tkey = (FStar_ToSMT_Term.mkForall ([], cvars, key_body))
in (match ((FStar_Util.smap_try_find env.cache tkey.FStar_ToSMT_Term.hash)) with
| Some (t, _53_1010, _53_1012) -> begin
(let _119_750 = (let _119_749 = (let _119_748 = (FStar_List.map FStar_ToSMT_Term.mkFreeV cvars)
in (t, _119_748))
in (FStar_ToSMT_Term.mkApp _119_749))
in (_119_750, []))
end
| None -> begin
(match ((is_eta env vars body)) with
| Some (head) -> begin
(head, [])
end
| None -> begin
(let cvar_sorts = (FStar_List.map Prims.snd cvars)
in (let tsym = (varops.fresh "Typ_lam")
in (let tdecl = FStar_ToSMT_Term.DeclFun ((tsym, cvar_sorts, FStar_ToSMT_Term.Type_sort, None))
in (let t = (let _119_752 = (let _119_751 = (FStar_List.map FStar_ToSMT_Term.mkFreeV cvars)
in (tsym, _119_751))
in (FStar_ToSMT_Term.mkApp _119_752))
in (let app = (mk_ApplyT t vars)
in (let interp = (let _119_759 = (let _119_758 = (let _119_757 = (let _119_756 = (let _119_755 = (let _119_754 = (FStar_ToSMT_Term.mk_and_l guards)
in (let _119_753 = (FStar_ToSMT_Term.mkEq (app, body))
in (_119_754, _119_753)))
in (FStar_ToSMT_Term.mkImp _119_755))
in ((app)::[], (FStar_List.append vars cvars), _119_756))
in (FStar_ToSMT_Term.mkForall _119_757))
in (_119_758, Some ("Typ_lam interpretation")))
in FStar_ToSMT_Term.Assume (_119_759))
in (let kinding = (let _53_1027 = (let _119_760 = (FStar_Tc_Recheck.recompute_kind t0)
in (encode_knd _119_760 env t))
in (match (_53_1027) with
| (ktm, decls'') -> begin
(let _119_764 = (let _119_763 = (let _119_762 = (let _119_761 = (FStar_ToSMT_Term.mkForall ((t)::[], cvars, ktm))
in (_119_761, Some ("Typ_lam kinding")))
in FStar_ToSMT_Term.Assume (_119_762))
in (_119_763)::[])
in (FStar_List.append decls'' _119_764))
end))
in (let t_decls = (FStar_List.append (FStar_List.append decls decls') ((tdecl)::(interp)::kinding))
in (let _53_1030 = (FStar_Util.smap_add env.cache tkey.FStar_ToSMT_Term.hash (tsym, cvar_sorts, t_decls))
in (t, t_decls))))))))))
end)
end))))
end))
end))
end
| FStar_Absyn_Syntax.Typ_ascribed (t, _53_1034) -> begin
(encode_typ_term t env)
end
| FStar_Absyn_Syntax.Typ_meta (_53_1038) -> begin
(let _119_765 = (FStar_Absyn_Util.unmeta_typ t0)
in (encode_typ_term _119_765 env))
end
| (FStar_Absyn_Syntax.Typ_delayed (_)) | (FStar_Absyn_Syntax.Typ_unknown) -> begin
(let _119_770 = (let _119_769 = (FStar_All.pipe_left FStar_Range.string_of_range t.FStar_Absyn_Syntax.pos)
in (let _119_768 = (FStar_Absyn_Print.tag_of_typ t0)
in (let _119_767 = (FStar_Absyn_Print.typ_to_string t0)
in (let _119_766 = (FStar_Absyn_Print.typ_to_string t)
in (FStar_Util.format4 "(%s) Impossible: %s\n%s\n%s\n" _119_769 _119_768 _119_767 _119_766)))))
in (FStar_All.failwith _119_770))
end)))
and encode_exp = (fun e env -> (let e = (FStar_Absyn_Visit.compress_exp_uvars e)
in (let e0 = e
in (match (e.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Exp_delayed (_53_1049) -> begin
(let _119_773 = (FStar_Absyn_Util.compress_exp e)
in (encode_exp _119_773 env))
end
| FStar_Absyn_Syntax.Exp_bvar (x) -> begin
(let t = (lookup_term_var env x)
in (t, []))
end
| FStar_Absyn_Syntax.Exp_fvar (v, _53_1056) -> begin
(let _119_774 = (lookup_free_var env v)
in (_119_774, []))
end
| FStar_Absyn_Syntax.Exp_constant (c) -> begin
(let _119_775 = (encode_const c)
in (_119_775, []))
end
| FStar_Absyn_Syntax.Exp_ascribed (e, t, _53_1064) -> begin
(let _53_1067 = (FStar_ST.op_Colon_Equals e.FStar_Absyn_Syntax.tk (Some (t)))
in (encode_exp e env))
end
| FStar_Absyn_Syntax.Exp_meta (FStar_Absyn_Syntax.Meta_desugared (e, _53_1071)) -> begin
(encode_exp e env)
end
| FStar_Absyn_Syntax.Exp_uvar (uv, _53_1077) -> begin
(let e = (let _119_776 = (FStar_Unionfind.uvar_id uv)
in (FStar_ToSMT_Term.mk_Exp_uvar _119_776))
in (e, []))
end
| FStar_Absyn_Syntax.Exp_abs (bs, body) -> begin
(let fallback = (fun _53_1086 -> (match (()) with
| () -> begin
(let f = (varops.fresh "Exp_abs")
in (let decl = FStar_ToSMT_Term.DeclFun ((f, [], FStar_ToSMT_Term.Term_sort, None))
in (let _119_779 = (FStar_ToSMT_Term.mkFreeV (f, FStar_ToSMT_Term.Term_sort))
in (_119_779, (decl)::[]))))
end))
in (match ((FStar_ST.read e.FStar_Absyn_Syntax.tk)) with
| None -> begin
(let _53_1090 = (FStar_Tc_Errors.warn e.FStar_Absyn_Syntax.pos "Losing precision when encoding a function literal")
in (fallback ()))
end
| Some (tfun) -> begin
(match ((let _119_780 = (FStar_Absyn_Util.is_pure_or_ghost_function tfun)
in (FStar_All.pipe_left Prims.op_Negation _119_780))) with
| true -> begin
(fallback ())
end
| false -> begin
(let tfun = (as_function_typ env tfun)
in (match (tfun.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_fun (bs', c) -> begin
(let nformals = (FStar_List.length bs')
in (match (((nformals < (FStar_List.length bs)) && (FStar_Absyn_Util.is_total_comp c))) with
| true -> begin
(let _53_1102 = (FStar_Util.first_N nformals bs)
in (match (_53_1102) with
| (bs0, rest) -> begin
(let res_t = (match ((FStar_Absyn_Util.mk_subst_binder bs0 bs')) with
| Some (s) -> begin
(FStar_Absyn_Util.subst_typ s (FStar_Absyn_Util.comp_result c))
end
| _53_1106 -> begin
(FStar_All.failwith "Impossible")
end)
in (let e = (let _119_782 = (let _119_781 = (FStar_Absyn_Syntax.mk_Exp_abs (rest, body) (Some (res_t)) body.FStar_Absyn_Syntax.pos)
in (bs0, _119_781))
in (FStar_Absyn_Syntax.mk_Exp_abs _119_782 (Some (tfun)) e0.FStar_Absyn_Syntax.pos))
in (encode_exp e env)))
end))
end
| false -> begin
(let _53_1115 = (encode_binders None bs env)
in (match (_53_1115) with
| (vars, guards, envbody, decls, _53_1114) -> begin
(let _53_1118 = (encode_exp body envbody)
in (match (_53_1118) with
| (body, decls') -> begin
(let key_body = (let _119_786 = (let _119_785 = (let _119_784 = (let _119_783 = (FStar_ToSMT_Term.mk_and_l guards)
in (_119_783, body))
in (FStar_ToSMT_Term.mkImp _119_784))
in ([], vars, _119_785))
in (FStar_ToSMT_Term.mkForall _119_786))
in (let cvars = (FStar_ToSMT_Term.free_variables key_body)
in (let tkey = (FStar_ToSMT_Term.mkForall ([], cvars, key_body))
in (match ((FStar_Util.smap_try_find env.cache tkey.FStar_ToSMT_Term.hash)) with
| Some (t, _53_1124, _53_1126) -> begin
(let _119_789 = (let _119_788 = (let _119_787 = (FStar_List.map FStar_ToSMT_Term.mkFreeV cvars)
in (t, _119_787))
in (FStar_ToSMT_Term.mkApp _119_788))
in (_119_789, []))
end
| None -> begin
(match ((is_eta env vars body)) with
| Some (t) -> begin
(t, [])
end
| None -> begin
(let cvar_sorts = (FStar_List.map Prims.snd cvars)
in (let fsym = (varops.fresh "Exp_abs")
in (let fdecl = FStar_ToSMT_Term.DeclFun ((fsym, cvar_sorts, FStar_ToSMT_Term.Term_sort, None))
in (let f = (let _119_791 = (let _119_790 = (FStar_List.map FStar_ToSMT_Term.mkFreeV cvars)
in (fsym, _119_790))
in (FStar_ToSMT_Term.mkApp _119_791))
in (let app = (mk_ApplyE f vars)
in (let _53_1140 = (encode_typ_pred None tfun env f)
in (match (_53_1140) with
| (f_has_t, decls'') -> begin
(let typing_f = (let _119_793 = (let _119_792 = (FStar_ToSMT_Term.mkForall ((f)::[], cvars, f_has_t))
in (_119_792, Some ((Prims.strcat fsym " typing"))))
in FStar_ToSMT_Term.Assume (_119_793))
in (let interp_f = (let _119_800 = (let _119_799 = (let _119_798 = (let _119_797 = (let _119_796 = (let _119_795 = (FStar_ToSMT_Term.mk_IsTyped app)
in (let _119_794 = (FStar_ToSMT_Term.mkEq (app, body))
in (_119_795, _119_794)))
in (FStar_ToSMT_Term.mkImp _119_796))
in ((app)::[], (FStar_List.append vars cvars), _119_797))
in (FStar_ToSMT_Term.mkForall _119_798))
in (_119_799, Some ((Prims.strcat fsym " interpretation"))))
in FStar_ToSMT_Term.Assume (_119_800))
in (let f_decls = (FStar_List.append (FStar_List.append (FStar_List.append decls decls') ((fdecl)::decls'')) ((typing_f)::(interp_f)::[]))
in (let _53_1144 = (FStar_Util.smap_add env.cache tkey.FStar_ToSMT_Term.hash (fsym, cvar_sorts, f_decls))
in (f, f_decls)))))
end)))))))
end)
end))))
end))
end))
end))
end
| _53_1147 -> begin
(FStar_All.failwith "Impossible")
end))
end)
end))
end
| FStar_Absyn_Syntax.Exp_app ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Exp_fvar (l, _53_1158); FStar_Absyn_Syntax.tk = _53_1155; FStar_Absyn_Syntax.pos = _53_1153; FStar_Absyn_Syntax.fvs = _53_1151; FStar_Absyn_Syntax.uvs = _53_1149}, (FStar_Util.Inl (_53_1173), _53_1176)::(FStar_Util.Inr (v1), _53_1170)::(FStar_Util.Inr (v2), _53_1165)::[]) when (FStar_Absyn_Syntax.lid_equals l.FStar_Absyn_Syntax.v FStar_Absyn_Const.lexcons_lid) -> begin
(let _53_1183 = (encode_exp v1 env)
in (match (_53_1183) with
| (v1, decls1) -> begin
(let _53_1186 = (encode_exp v2 env)
in (match (_53_1186) with
| (v2, decls2) -> begin
(let _119_801 = (FStar_ToSMT_Term.mk_LexCons v1 v2)
in (_119_801, (FStar_List.append decls1 decls2)))
end))
end))
end
| FStar_Absyn_Syntax.Exp_app ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Exp_abs (_53_1196); FStar_Absyn_Syntax.tk = _53_1194; FStar_Absyn_Syntax.pos = _53_1192; FStar_Absyn_Syntax.fvs = _53_1190; FStar_Absyn_Syntax.uvs = _53_1188}, _53_1200) -> begin
(let _119_802 = (whnf_e env e)
in (encode_exp _119_802 env))
end
| FStar_Absyn_Syntax.Exp_app (head, args_e) -> begin
(let _53_1209 = (encode_args args_e env)
in (match (_53_1209) with
| (args, decls) -> begin
(let encode_partial_app = (fun ht_opt -> (let _53_1214 = (encode_exp head env)
in (match (_53_1214) with
| (head, decls') -> begin
(let app_tm = (mk_ApplyE_args head args)
in (match (ht_opt) with
| None -> begin
(app_tm, (FStar_List.append decls decls'))
end
| Some (formals, c) -> begin
(let _53_1223 = (FStar_Util.first_N (FStar_List.length args_e) formals)
in (match (_53_1223) with
| (formals, rest) -> begin
(let subst = (FStar_Absyn_Util.formals_for_actuals formals args_e)
in (let ty = (let _119_805 = (FStar_Absyn_Syntax.mk_Typ_fun (rest, c) (Some (FStar_Absyn_Syntax.ktype)) e0.FStar_Absyn_Syntax.pos)
in (FStar_All.pipe_right _119_805 (FStar_Absyn_Util.subst_typ subst)))
in (let _53_1228 = (encode_typ_pred None ty env app_tm)
in (match (_53_1228) with
| (has_type, decls'') -> begin
(let cvars = (FStar_ToSMT_Term.free_variables has_type)
in (let e_typing = (let _119_807 = (let _119_806 = (FStar_ToSMT_Term.mkForall ((has_type)::[], cvars, has_type))
in (_119_806, None))
in FStar_ToSMT_Term.Assume (_119_807))
in (app_tm, (FStar_List.append (FStar_List.append (FStar_List.append decls decls') decls'') ((e_typing)::[])))))
end))))
end))
end))
end)))
in (let encode_full_app = (fun fv -> (let _53_1235 = (lookup_free_var_sym env fv)
in (match (_53_1235) with
| (fname, fuel_args) -> begin
(let tm = (let _119_813 = (let _119_812 = (let _119_811 = (FStar_List.map (fun _53_11 -> (match (_53_11) with
| (FStar_Util.Inl (t)) | (FStar_Util.Inr (t)) -> begin
t
end)) args)
in (FStar_List.append fuel_args _119_811))
in (fname, _119_812))
in (FStar_ToSMT_Term.mkApp' _119_813))
in (tm, decls))
end)))
in (let head = (FStar_Absyn_Util.compress_exp head)
in (let _53_1242 = (match ((FStar_All.pipe_left (FStar_Tc_Env.debug env.tcenv) (FStar_Options.Other ("186")))) with
| true -> begin
(let _119_815 = (FStar_Absyn_Print.exp_to_string head)
in (let _119_814 = (FStar_Absyn_Print.exp_to_string e)
in (FStar_Util.fprint2 "Recomputing type for %s\nFull term is %s\n" _119_815 _119_814)))
end
| false -> begin
()
end)
in (let head_type = (let _119_818 = (let _119_817 = (let _119_816 = (FStar_Tc_Recheck.recompute_typ head)
in (FStar_Absyn_Util.unrefine _119_816))
in (whnf env _119_817))
in (FStar_All.pipe_left FStar_Absyn_Util.unrefine _119_818))
in (let _53_1245 = (match ((FStar_All.pipe_left (FStar_Tc_Env.debug env.tcenv) (FStar_Options.Other ("Encoding")))) with
| true -> begin
(let _119_821 = (FStar_Absyn_Print.exp_to_string head)
in (let _119_820 = (FStar_Absyn_Print.tag_of_exp head)
in (let _119_819 = (FStar_Absyn_Print.typ_to_string head_type)
in (FStar_Util.fprint3 "Recomputed type of head %s (%s) to be %s\n" _119_821 _119_820 _119_819))))
end
| false -> begin
()
end)
in (match ((FStar_Absyn_Util.function_formals head_type)) with
| None -> begin
(let _119_825 = (let _119_824 = (FStar_Range.string_of_range e0.FStar_Absyn_Syntax.pos)
in (let _119_823 = (FStar_Absyn_Print.exp_to_string e0)
in (let _119_822 = (FStar_Absyn_Print.typ_to_string head_type)
in (FStar_Util.format3 "(%s) term is %s; head type is %s\n" _119_824 _119_823 _119_822))))
in (FStar_All.failwith _119_825))
end
| Some (formals, c) -> begin
(match (head.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Exp_fvar (fv, _53_1254) when ((FStar_List.length formals) = (FStar_List.length args)) -> begin
(encode_full_app fv)
end
| _53_1258 -> begin
(match (((FStar_List.length formals) > (FStar_List.length args))) with
| true -> begin
(encode_partial_app (Some ((formals, c))))
end
| false -> begin
(encode_partial_app None)
end)
end)
end)))))))
end))
end
| FStar_Absyn_Syntax.Exp_let ((false, {FStar_Absyn_Syntax.lbname = FStar_Util.Inr (_53_1267); FStar_Absyn_Syntax.lbtyp = _53_1265; FStar_Absyn_Syntax.lbeff = _53_1263; FStar_Absyn_Syntax.lbdef = _53_1261}::[]), _53_1273) -> begin
(FStar_All.failwith "Impossible: already handled by encoding of Sig_let")
end
| FStar_Absyn_Syntax.Exp_let ((false, {FStar_Absyn_Syntax.lbname = FStar_Util.Inl (x); FStar_Absyn_Syntax.lbtyp = t1; FStar_Absyn_Syntax.lbeff = _53_1279; FStar_Absyn_Syntax.lbdef = e1}::[]), e2) -> begin
(let _53_1291 = (encode_exp e1 env)
in (match (_53_1291) with
| (ee1, decls1) -> begin
(let env' = (push_term_var env x ee1)
in (let _53_1295 = (encode_exp e2 env')
in (match (_53_1295) with
| (ee2, decls2) -> begin
(ee2, (FStar_List.append decls1 decls2))
end)))
end))
end
| FStar_Absyn_Syntax.Exp_let (_53_1297) -> begin
(let _53_1299 = (FStar_Tc_Errors.warn e.FStar_Absyn_Syntax.pos "Non-top-level recursive functions are not yet fully encoded to the SMT solver; you may not be able to prove some facts")
in (let e = (varops.fresh "let-rec")
in (let decl_e = FStar_ToSMT_Term.DeclFun ((e, [], FStar_ToSMT_Term.Term_sort, None))
in (let _119_826 = (FStar_ToSMT_Term.mkFreeV (e, FStar_ToSMT_Term.Term_sort))
in (_119_826, (decl_e)::[])))))
end
| FStar_Absyn_Syntax.Exp_match (e, pats) -> begin
(let _53_1309 = (encode_exp e env)
in (match (_53_1309) with
| (scr, decls) -> begin
(let _53_1349 = (FStar_List.fold_right (fun _53_1313 _53_1316 -> (match ((_53_1313, _53_1316)) with
| ((p, w, br), (else_case, decls)) -> begin
(let patterns = (encode_pat env p)
in (FStar_List.fold_right (fun _53_1320 _53_1323 -> (match ((_53_1320, _53_1323)) with
| ((env0, pattern), (else_case, decls)) -> begin
(let guard = (pattern.guard scr)
in (let projections = (pattern.projections scr)
in (let env = (FStar_All.pipe_right projections (FStar_List.fold_left (fun env _53_1329 -> (match (_53_1329) with
| (x, t) -> begin
(match (x) with
| FStar_Util.Inl (a) -> begin
(push_typ_var env a.FStar_Absyn_Syntax.v t)
end
| FStar_Util.Inr (x) -> begin
(push_term_var env x.FStar_Absyn_Syntax.v t)
end)
end)) env))
in (let _53_1343 = (match (w) with
| None -> begin
(guard, [])
end
| Some (w) -> begin
(let _53_1340 = (encode_exp w env)
in (match (_53_1340) with
| (w, decls2) -> begin
(let _119_837 = (let _119_836 = (let _119_835 = (let _119_834 = (let _119_833 = (FStar_ToSMT_Term.boxBool FStar_ToSMT_Term.mkTrue)
in (w, _119_833))
in (FStar_ToSMT_Term.mkEq _119_834))
in (guard, _119_835))
in (FStar_ToSMT_Term.mkAnd _119_836))
in (_119_837, decls2))
end))
end)
in (match (_53_1343) with
| (guard, decls2) -> begin
(let _53_1346 = (encode_exp br env)
in (match (_53_1346) with
| (br, decls3) -> begin
(let _119_838 = (FStar_ToSMT_Term.mkITE (guard, br, else_case))
in (_119_838, (FStar_List.append (FStar_List.append decls decls2) decls3)))
end))
end)))))
end)) patterns (else_case, decls)))
end)) pats (FStar_ToSMT_Term.mk_Term_unit, decls))
in (match (_53_1349) with
| (match_tm, decls) -> begin
(match_tm, decls)
end))
end))
end
| FStar_Absyn_Syntax.Exp_meta (_53_1351) -> begin
(let _119_841 = (let _119_840 = (FStar_Range.string_of_range e.FStar_Absyn_Syntax.pos)
in (let _119_839 = (FStar_Absyn_Print.exp_to_string e)
in (FStar_Util.format2 "(%s): Impossible: encode_exp got %s" _119_840 _119_839)))
in (FStar_All.failwith _119_841))
end))))
and encode_pat = (fun env pat -> (match (pat.FStar_Absyn_Syntax.v) with
| FStar_Absyn_Syntax.Pat_disj (ps) -> begin
(FStar_List.map (encode_one_pat env) ps)
end
| _53_1358 -> begin
(let _119_844 = (encode_one_pat env pat)
in (_119_844)::[])
end))
and encode_one_pat = (fun env pat -> (let _53_1361 = (match ((FStar_Tc_Env.debug env.tcenv FStar_Options.Low)) with
| true -> begin
(let _119_847 = (FStar_Absyn_Print.pat_to_string pat)
in (FStar_Util.fprint1 "Encoding pattern %s\n" _119_847))
end
| false -> begin
()
end)
in (let _53_1365 = (FStar_Tc_Util.decorated_pattern_as_either pat)
in (match (_53_1365) with
| (vars, pat_exp_or_typ) -> begin
(let _53_1386 = (FStar_All.pipe_right vars (FStar_List.fold_left (fun _53_1368 v -> (match (_53_1368) with
| (env, vars) -> begin
(match (v) with
| FStar_Util.Inl (a) -> begin
(let _53_1376 = (gen_typ_var env a.FStar_Absyn_Syntax.v)
in (match (_53_1376) with
| (aa, _53_1374, env) -> begin
(env, ((v, (aa, FStar_ToSMT_Term.Type_sort)))::vars)
end))
end
| FStar_Util.Inr (x) -> begin
(let _53_1383 = (gen_term_var env x.FStar_Absyn_Syntax.v)
in (match (_53_1383) with
| (xx, _53_1381, env) -> begin
(env, ((v, (xx, FStar_ToSMT_Term.Term_sort)))::vars)
end))
end)
end)) (env, [])))
in (match (_53_1386) with
| (env, vars) -> begin
(let rec mk_guard = (fun pat scrutinee -> (match (pat.FStar_Absyn_Syntax.v) with
| FStar_Absyn_Syntax.Pat_disj (_53_1391) -> begin
(FStar_All.failwith "Impossible")
end
| (FStar_Absyn_Syntax.Pat_var (_)) | (FStar_Absyn_Syntax.Pat_wild (_)) | (FStar_Absyn_Syntax.Pat_tvar (_)) | (FStar_Absyn_Syntax.Pat_twild (_)) | (FStar_Absyn_Syntax.Pat_dot_term (_)) | (FStar_Absyn_Syntax.Pat_dot_typ (_)) -> begin
FStar_ToSMT_Term.mkTrue
end
| FStar_Absyn_Syntax.Pat_constant (c) -> begin
(let _119_855 = (let _119_854 = (encode_const c)
in (scrutinee, _119_854))
in (FStar_ToSMT_Term.mkEq _119_855))
end
| FStar_Absyn_Syntax.Pat_cons (f, _53_1415, args) -> begin
(let is_f = (mk_data_tester env f.FStar_Absyn_Syntax.v scrutinee)
in (let sub_term_guards = (FStar_All.pipe_right args (FStar_List.mapi (fun i _53_1424 -> (match (_53_1424) with
| (arg, _53_1423) -> begin
(let proj = (primitive_projector_by_pos env.tcenv f.FStar_Absyn_Syntax.v i)
in (let _119_858 = (FStar_ToSMT_Term.mkApp (proj, (scrutinee)::[]))
in (mk_guard arg _119_858)))
end))))
in (FStar_ToSMT_Term.mk_and_l ((is_f)::sub_term_guards))))
end))
in (let rec mk_projections = (fun pat scrutinee -> (match (pat.FStar_Absyn_Syntax.v) with
| FStar_Absyn_Syntax.Pat_disj (_53_1431) -> begin
(FStar_All.failwith "Impossible")
end
| (FStar_Absyn_Syntax.Pat_dot_term (x, _)) | (FStar_Absyn_Syntax.Pat_var (x)) | (FStar_Absyn_Syntax.Pat_wild (x)) -> begin
((FStar_Util.Inr (x), scrutinee))::[]
end
| (FStar_Absyn_Syntax.Pat_dot_typ (a, _)) | (FStar_Absyn_Syntax.Pat_tvar (a)) | (FStar_Absyn_Syntax.Pat_twild (a)) -> begin
((FStar_Util.Inl (a), scrutinee))::[]
end
| FStar_Absyn_Syntax.Pat_constant (_53_1448) -> begin
[]
end
| FStar_Absyn_Syntax.Pat_cons (f, _53_1452, args) -> begin
(let _119_866 = (FStar_All.pipe_right args (FStar_List.mapi (fun i _53_1460 -> (match (_53_1460) with
| (arg, _53_1459) -> begin
(let proj = (primitive_projector_by_pos env.tcenv f.FStar_Absyn_Syntax.v i)
in (let _119_865 = (FStar_ToSMT_Term.mkApp (proj, (scrutinee)::[]))
in (mk_projections arg _119_865)))
end))))
in (FStar_All.pipe_right _119_866 FStar_List.flatten))
end))
in (let pat_term = (fun _53_1463 -> (match (()) with
| () -> begin
(match (pat_exp_or_typ) with
| FStar_Util.Inl (t) -> begin
(encode_typ_term t env)
end
| FStar_Util.Inr (e) -> begin
(encode_exp e env)
end)
end))
in (let pattern = {pat_vars = vars; pat_term = pat_term; guard = (mk_guard pat); projections = (mk_projections pat)}
in (env, pattern)))))
end))
end))))
and encode_args = (fun l env -> (let _53_1493 = (FStar_All.pipe_right l (FStar_List.fold_left (fun _53_1473 x -> (match (_53_1473) with
| (tms, decls) -> begin
(match (x) with
| (FStar_Util.Inl (t), _53_1478) -> begin
(let _53_1482 = (encode_typ_term t env)
in (match (_53_1482) with
| (t, decls') -> begin
((FStar_Util.Inl (t))::tms, (FStar_List.append decls decls'))
end))
end
| (FStar_Util.Inr (e), _53_1486) -> begin
(let _53_1490 = (encode_exp e env)
in (match (_53_1490) with
| (t, decls') -> begin
((FStar_Util.Inr (t))::tms, (FStar_List.append decls decls'))
end))
end)
end)) ([], [])))
in (match (_53_1493) with
| (l, decls) -> begin
((FStar_List.rev l), decls)
end)))
and encode_formula = (fun phi env -> (let _53_1499 = (encode_formula_with_labels phi env)
in (match (_53_1499) with
| (t, vars, decls) -> begin
(match (vars) with
| [] -> begin
(t, decls)
end
| _53_1502 -> begin
(FStar_All.failwith "Unexpected labels in formula")
end)
end)))
and encode_function_type_as_formula = (fun induction_on new_pats t env -> (let v_or_t_pat = (fun p -> (match ((let _119_881 = (FStar_Absyn_Util.unmeta_exp p)
in _119_881.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Exp_app (_53_1510, (FStar_Util.Inl (_53_1517), _53_1520)::(FStar_Util.Inr (e), _53_1514)::[]) -> begin
(FStar_Absyn_Syntax.varg e)
end
| FStar_Absyn_Syntax.Exp_app (_53_1526, (FStar_Util.Inl (t), _53_1530)::[]) -> begin
(FStar_Absyn_Syntax.targ t)
end
| _53_1536 -> begin
(FStar_All.failwith "Unexpected pattern term")
end))
in (let rec lemma_pats = (fun p -> (match ((let _119_884 = (FStar_Absyn_Util.unmeta_exp p)
in _119_884.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Exp_app (_53_1540, _53_1552::(FStar_Util.Inr (hd), _53_1549)::(FStar_Util.Inr (tl), _53_1544)::[]) -> begin
(let _119_886 = (v_or_t_pat hd)
in (let _119_885 = (lemma_pats tl)
in (_119_886)::_119_885))
end
| _53_1557 -> begin
[]
end))
in (let _53_1600 = (match ((let _119_887 = (FStar_Absyn_Util.compress_typ t)
in _119_887.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Typ_fun (binders, {FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Comp (ct); FStar_Absyn_Syntax.tk = _53_1566; FStar_Absyn_Syntax.pos = _53_1564; FStar_Absyn_Syntax.fvs = _53_1562; FStar_Absyn_Syntax.uvs = _53_1560}) -> begin
(match (ct.FStar_Absyn_Syntax.effect_args) with
| (FStar_Util.Inl (pre), _53_1585)::(FStar_Util.Inl (post), _53_1580)::(FStar_Util.Inr (pats), _53_1575)::[] -> begin
(let pats' = (match (new_pats) with
| Some (new_pats') -> begin
new_pats'
end
| None -> begin
pats
end)
in (let _119_888 = (lemma_pats pats')
in (binders, pre, post, _119_888)))
end
| _53_1593 -> begin
(FStar_All.failwith "impos")
end)
end
| _53_1595 -> begin
(FStar_All.failwith "Impos")
end)
in (match (_53_1600) with
| (binders, pre, post, patterns) -> begin
(let _53_1607 = (encode_binders None binders env)
in (match (_53_1607) with
| (vars, guards, env, decls, _53_1606) -> begin
(let _53_1623 = (let _119_890 = (FStar_All.pipe_right patterns (FStar_List.map (fun _53_12 -> (match (_53_12) with
| (FStar_Util.Inl (t), _53_1612) -> begin
(encode_formula t env)
end
| (FStar_Util.Inr (e), _53_1617) -> begin
(encode_exp e (let _53_1619 = env
in {bindings = _53_1619.bindings; depth = _53_1619.depth; tcenv = _53_1619.tcenv; warn = _53_1619.warn; cache = _53_1619.cache; nolabels = _53_1619.nolabels; use_zfuel_name = true; encode_non_total_function_typ = _53_1619.encode_non_total_function_typ}))
end))))
in (FStar_All.pipe_right _119_890 FStar_List.unzip))
in (match (_53_1623) with
| (pats, decls') -> begin
(let pats = (match (induction_on) with
| None -> begin
pats
end
| Some (e) -> begin
(match (vars) with
| [] -> begin
pats
end
| l::[] -> begin
(let _119_892 = (let _119_891 = (FStar_ToSMT_Term.mkFreeV l)
in (FStar_ToSMT_Term.mk_Precedes _119_891 e))
in (_119_892)::pats)
end
| _53_1631 -> begin
(let rec aux = (fun tl vars -> (match (vars) with
| [] -> begin
(let _119_897 = (FStar_ToSMT_Term.mk_Precedes tl e)
in (_119_897)::pats)
end
| (x, FStar_ToSMT_Term.Term_sort)::vars -> begin
(let _119_899 = (let _119_898 = (FStar_ToSMT_Term.mkFreeV (x, FStar_ToSMT_Term.Term_sort))
in (FStar_ToSMT_Term.mk_LexCons _119_898 tl))
in (aux _119_899 vars))
end
| _53_1642 -> begin
pats
end))
in (let _119_900 = (FStar_ToSMT_Term.mkFreeV ("Prims.LexTop", FStar_ToSMT_Term.Term_sort))
in (aux _119_900 vars)))
end)
end)
in (let env = (let _53_1644 = env
in {bindings = _53_1644.bindings; depth = _53_1644.depth; tcenv = _53_1644.tcenv; warn = _53_1644.warn; cache = _53_1644.cache; nolabels = true; use_zfuel_name = _53_1644.use_zfuel_name; encode_non_total_function_typ = _53_1644.encode_non_total_function_typ})
in (let _53_1649 = (let _119_901 = (FStar_Absyn_Util.unmeta_typ pre)
in (encode_formula _119_901 env))
in (match (_53_1649) with
| (pre, decls'') -> begin
(let _53_1652 = (let _119_902 = (FStar_Absyn_Util.unmeta_typ post)
in (encode_formula _119_902 env))
in (match (_53_1652) with
| (post, decls''') -> begin
(let decls = (FStar_List.append (FStar_List.append (FStar_List.append decls (FStar_List.flatten decls')) decls'') decls''')
in (let _119_907 = (let _119_906 = (let _119_905 = (let _119_904 = (let _119_903 = (FStar_ToSMT_Term.mk_and_l ((pre)::guards))
in (_119_903, post))
in (FStar_ToSMT_Term.mkImp _119_904))
in (pats, vars, _119_905))
in (FStar_ToSMT_Term.mkForall _119_906))
in (_119_907, decls)))
end))
end))))
end))
end))
end)))))
and encode_formula_with_labels = (fun phi env -> (let enc = (fun f -> (fun l -> (let _53_1673 = (FStar_Util.fold_map (fun decls x -> (match ((Prims.fst x)) with
| FStar_Util.Inl (t) -> begin
(let _53_1665 = (encode_typ_term t env)
in (match (_53_1665) with
| (t, decls') -> begin
((FStar_List.append decls decls'), t)
end))
end
| FStar_Util.Inr (e) -> begin
(let _53_1670 = (encode_exp e env)
in (match (_53_1670) with
| (e, decls') -> begin
((FStar_List.append decls decls'), e)
end))
end)) [] l)
in (match (_53_1673) with
| (decls, args) -> begin
(let _119_925 = (f args)
in (_119_925, [], decls))
end))))
in (let enc_prop_c = (fun f -> (fun l -> (let _53_1693 = (FStar_List.fold_right (fun t _53_1681 -> (match (_53_1681) with
| (phis, labs, decls) -> begin
(match ((Prims.fst t)) with
| FStar_Util.Inl (t) -> begin
(let _53_1687 = (encode_formula_with_labels t env)
in (match (_53_1687) with
| (phi, labs', decls') -> begin
((phi)::phis, (FStar_List.append labs' labs), (FStar_List.append decls' decls))
end))
end
| _53_1689 -> begin
(FStar_All.failwith "Expected a formula")
end)
end)) l ([], [], []))
in (match (_53_1693) with
| (phis, labs, decls) -> begin
(let _119_941 = (f phis)
in (_119_941, labs, decls))
end))))
in (let const_op = (fun f _53_1696 -> (f, [], []))
in (let un_op = (fun f l -> (let _119_955 = (FStar_List.hd l)
in (FStar_All.pipe_left f _119_955)))
in (let bin_op = (fun f _53_13 -> (match (_53_13) with
| t1::t2::[] -> begin
(f (t1, t2))
end
| _53_1707 -> begin
(FStar_All.failwith "Impossible")
end))
in (let eq_op = (fun _53_14 -> (match (_53_14) with
| _53_1715::_53_1713::e1::e2::[] -> begin
(enc (bin_op FStar_ToSMT_Term.mkEq) ((e1)::(e2)::[]))
end
| l -> begin
(enc (bin_op FStar_ToSMT_Term.mkEq) l)
end))
in (let mk_imp = (fun _53_15 -> (match (_53_15) with
| (FStar_Util.Inl (lhs), _53_1728)::(FStar_Util.Inl (rhs), _53_1723)::[] -> begin
(let _53_1734 = (encode_formula_with_labels rhs env)
in (match (_53_1734) with
| (l1, labs1, decls1) -> begin
(match (l1.FStar_ToSMT_Term.tm) with
| FStar_ToSMT_Term.App (FStar_ToSMT_Term.True, _53_1737) -> begin
(l1, labs1, decls1)
end
| _53_1741 -> begin
(let _53_1745 = (encode_formula_with_labels lhs env)
in (match (_53_1745) with
| (l2, labs2, decls2) -> begin
(let _119_969 = (FStar_ToSMT_Term.mkImp (l2, l1))
in (_119_969, (FStar_List.append labs1 labs2), (FStar_List.append decls1 decls2)))
end))
end)
end))
end
| _53_1747 -> begin
(FStar_All.failwith "impossible")
end))
in (let mk_ite = (fun _53_16 -> (match (_53_16) with
| (FStar_Util.Inl (guard), _53_1763)::(FStar_Util.Inl (_then), _53_1758)::(FStar_Util.Inl (_else), _53_1753)::[] -> begin
(let _53_1769 = (encode_formula_with_labels guard env)
in (match (_53_1769) with
| (g, labs1, decls1) -> begin
(let _53_1773 = (encode_formula_with_labels _then env)
in (match (_53_1773) with
| (t, labs2, decls2) -> begin
(let _53_1777 = (encode_formula_with_labels _else env)
in (match (_53_1777) with
| (e, labs3, decls3) -> begin
(let res = (FStar_ToSMT_Term.mkITE (g, t, e))
in (res, (FStar_List.append (FStar_List.append labs1 labs2) labs3), (FStar_List.append (FStar_List.append decls1 decls2) decls3)))
end))
end))
end))
end
| _53_1780 -> begin
(FStar_All.failwith "impossible")
end))
in (let unboxInt_l = (fun f l -> (let _119_981 = (FStar_List.map FStar_ToSMT_Term.unboxInt l)
in (f _119_981)))
in (let connectives = (let _119_1042 = (let _119_990 = (FStar_All.pipe_left enc_prop_c (bin_op FStar_ToSMT_Term.mkAnd))
in (FStar_Absyn_Const.and_lid, _119_990))
in (let _119_1041 = (let _119_1040 = (let _119_996 = (FStar_All.pipe_left enc_prop_c (bin_op FStar_ToSMT_Term.mkOr))
in (FStar_Absyn_Const.or_lid, _119_996))
in (let _119_1039 = (let _119_1038 = (let _119_1037 = (let _119_1005 = (FStar_All.pipe_left enc_prop_c (bin_op FStar_ToSMT_Term.mkIff))
in (FStar_Absyn_Const.iff_lid, _119_1005))
in (let _119_1036 = (let _119_1035 = (let _119_1034 = (let _119_1014 = (FStar_All.pipe_left enc_prop_c (un_op FStar_ToSMT_Term.mkNot))
in (FStar_Absyn_Const.not_lid, _119_1014))
in (let _119_1033 = (let _119_1032 = (let _119_1020 = (FStar_All.pipe_left enc (bin_op FStar_ToSMT_Term.mkEq))
in (FStar_Absyn_Const.eqT_lid, _119_1020))
in (_119_1032)::((FStar_Absyn_Const.eq2_lid, eq_op))::((FStar_Absyn_Const.true_lid, (const_op FStar_ToSMT_Term.mkTrue)))::((FStar_Absyn_Const.false_lid, (const_op FStar_ToSMT_Term.mkFalse)))::[])
in (_119_1034)::_119_1033))
in ((FStar_Absyn_Const.ite_lid, mk_ite))::_119_1035)
in (_119_1037)::_119_1036))
in ((FStar_Absyn_Const.imp_lid, mk_imp))::_119_1038)
in (_119_1040)::_119_1039))
in (_119_1042)::_119_1041))
in (let fallback = (fun phi -> (match (phi.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_meta (FStar_Absyn_Syntax.Meta_labeled (phi', msg, r, b)) -> begin
(let _53_1798 = (encode_formula_with_labels phi' env)
in (match (_53_1798) with
| (phi, labs, decls) -> begin
(match (env.nolabels) with
| true -> begin
(phi, [], decls)
end
| false -> begin
(let lvar = (let _119_1045 = (varops.fresh "label")
in (_119_1045, FStar_ToSMT_Term.Bool_sort))
in (let lterm = (FStar_ToSMT_Term.mkFreeV lvar)
in (let lphi = (FStar_ToSMT_Term.mkOr (lterm, phi))
in (lphi, ((lvar, msg, r))::labs, decls))))
end)
end))
end
| FStar_Absyn_Syntax.Typ_app ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Typ_const (ih); FStar_Absyn_Syntax.tk = _53_1809; FStar_Absyn_Syntax.pos = _53_1807; FStar_Absyn_Syntax.fvs = _53_1805; FStar_Absyn_Syntax.uvs = _53_1803}, _53_1824::(FStar_Util.Inr (l), _53_1821)::(FStar_Util.Inl (phi), _53_1816)::[]) when (FStar_Absyn_Syntax.lid_equals ih.FStar_Absyn_Syntax.v FStar_Absyn_Const.using_IH) -> begin
(match ((FStar_Absyn_Util.is_lemma phi)) with
| true -> begin
(let _53_1830 = (encode_exp l env)
in (match (_53_1830) with
| (e, decls) -> begin
(let _53_1833 = (encode_function_type_as_formula (Some (e)) None phi env)
in (match (_53_1833) with
| (f, decls') -> begin
(f, [], (FStar_List.append decls decls'))
end))
end))
end
| false -> begin
(FStar_ToSMT_Term.mkTrue, [], [])
end)
end
| FStar_Absyn_Syntax.Typ_app ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Typ_const (ih); FStar_Absyn_Syntax.tk = _53_1841; FStar_Absyn_Syntax.pos = _53_1839; FStar_Absyn_Syntax.fvs = _53_1837; FStar_Absyn_Syntax.uvs = _53_1835}, _53_1853::(FStar_Util.Inl (phi), _53_1849)::tl) when (FStar_Absyn_Syntax.lid_equals ih.FStar_Absyn_Syntax.v FStar_Absyn_Const.using_lem) -> begin
(match ((FStar_Absyn_Util.is_lemma phi)) with
| true -> begin
(let pat = (match (tl) with
| [] -> begin
None
end
| (FStar_Util.Inr (pat), _53_1861)::[] -> begin
Some (pat)
end)
in (let _53_1867 = (encode_function_type_as_formula None pat phi env)
in (match (_53_1867) with
| (f, decls) -> begin
(f, [], decls)
end)))
end
| false -> begin
(FStar_ToSMT_Term.mkTrue, [], [])
end)
end
| _53_1869 -> begin
(let _53_1872 = (encode_typ_term phi env)
in (match (_53_1872) with
| (tt, decls) -> begin
(let _119_1046 = (FStar_ToSMT_Term.mk_Valid tt)
in (_119_1046, [], decls))
end))
end))
in (let encode_q_body = (fun env bs ps body -> (let _53_1884 = (encode_binders None bs env)
in (match (_53_1884) with
| (vars, guards, env, decls, _53_1883) -> begin
(let _53_1900 = (let _119_1056 = (FStar_All.pipe_right ps (FStar_List.map (fun _53_17 -> (match (_53_17) with
| (FStar_Util.Inl (t), _53_1889) -> begin
(encode_typ_term t env)
end
| (FStar_Util.Inr (e), _53_1894) -> begin
(encode_exp e (let _53_1896 = env
in {bindings = _53_1896.bindings; depth = _53_1896.depth; tcenv = _53_1896.tcenv; warn = _53_1896.warn; cache = _53_1896.cache; nolabels = _53_1896.nolabels; use_zfuel_name = true; encode_non_total_function_typ = _53_1896.encode_non_total_function_typ}))
end))))
in (FStar_All.pipe_right _119_1056 FStar_List.unzip))
in (match (_53_1900) with
| (pats, decls') -> begin
(let _53_1904 = (encode_formula_with_labels body env)
in (match (_53_1904) with
| (body, labs, decls'') -> begin
(let _119_1057 = (FStar_ToSMT_Term.mk_and_l guards)
in (vars, pats, _119_1057, body, labs, (FStar_List.append (FStar_List.append decls (FStar_List.flatten decls')) decls'')))
end))
end))
end)))
in (let _53_1905 = (match ((FStar_Tc_Env.debug env.tcenv FStar_Options.Low)) with
| true -> begin
(let _119_1058 = (FStar_Absyn_Print.formula_to_string phi)
in (FStar_Util.fprint1 ">>>> Destructing as formula ... %s\n" _119_1058))
end
| false -> begin
()
end)
in (let phi = (FStar_Absyn_Util.compress_typ phi)
in (match ((FStar_Absyn_Util.destruct_typ_as_formula phi)) with
| None -> begin
(fallback phi)
end
| Some (FStar_Absyn_Util.BaseConn (op, arms)) -> begin
(match ((FStar_All.pipe_right connectives (FStar_List.tryFind (fun _53_1917 -> (match (_53_1917) with
| (l, _53_1916) -> begin
(FStar_Absyn_Syntax.lid_equals op l)
end))))) with
| None -> begin
(fallback phi)
end
| Some (_53_1920, f) -> begin
(f arms)
end)
end
| Some (FStar_Absyn_Util.QAll (vars, pats, body)) -> begin
(let _53_1930 = (match ((FStar_Tc_Env.debug env.tcenv FStar_Options.Low)) with
| true -> begin
(let _119_1075 = (FStar_All.pipe_right vars (FStar_Absyn_Print.binders_to_string "; "))
in (FStar_Util.fprint1 ">>>> Got QALL [%s]\n" _119_1075))
end
| false -> begin
()
end)
in (let _53_1938 = (encode_q_body env vars pats body)
in (match (_53_1938) with
| (vars, pats, guard, body, labs, decls) -> begin
(let _119_1078 = (let _119_1077 = (let _119_1076 = (FStar_ToSMT_Term.mkImp (guard, body))
in (pats, vars, _119_1076))
in (FStar_ToSMT_Term.mkForall _119_1077))
in (_119_1078, labs, decls))
end)))
end
| Some (FStar_Absyn_Util.QEx (vars, pats, body)) -> begin
(let _53_1951 = (encode_q_body env vars pats body)
in (match (_53_1951) with
| (vars, pats, guard, body, labs, decls) -> begin
(let _119_1081 = (let _119_1080 = (let _119_1079 = (FStar_ToSMT_Term.mkAnd (guard, body))
in (pats, vars, _119_1079))
in (FStar_ToSMT_Term.mkExists _119_1080))
in (_119_1081, labs, decls))
end))
end))))))))))))))))

type prims_t =
{mk : FStar_Absyn_Syntax.lident  ->  Prims.string  ->  FStar_ToSMT_Term.decl Prims.list; is : FStar_Absyn_Syntax.lident  ->  Prims.bool}

let is_Mkprims_t = (fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkprims_t"))

let prims = (let _53_1957 = (fresh_fvar "a" FStar_ToSMT_Term.Type_sort)
in (match (_53_1957) with
| (asym, a) -> begin
(let _53_1960 = (fresh_fvar "x" FStar_ToSMT_Term.Term_sort)
in (match (_53_1960) with
| (xsym, x) -> begin
(let _53_1963 = (fresh_fvar "y" FStar_ToSMT_Term.Term_sort)
in (match (_53_1963) with
| (ysym, y) -> begin
(let deffun = (fun vars body x -> (FStar_ToSMT_Term.DefineFun ((x, vars, FStar_ToSMT_Term.Term_sort, body, None)))::[])
in (let quant = (fun vars body -> (fun x -> (let t1 = (let _119_1124 = (let _119_1123 = (FStar_List.map FStar_ToSMT_Term.mkFreeV vars)
in (x, _119_1123))
in (FStar_ToSMT_Term.mkApp _119_1124))
in (let vname_decl = (let _119_1126 = (let _119_1125 = (FStar_All.pipe_right vars (FStar_List.map Prims.snd))
in (x, _119_1125, FStar_ToSMT_Term.Term_sort, None))
in FStar_ToSMT_Term.DeclFun (_119_1126))
in (let _119_1132 = (let _119_1131 = (let _119_1130 = (let _119_1129 = (let _119_1128 = (let _119_1127 = (FStar_ToSMT_Term.mkEq (t1, body))
in ((t1)::[], vars, _119_1127))
in (FStar_ToSMT_Term.mkForall _119_1128))
in (_119_1129, None))
in FStar_ToSMT_Term.Assume (_119_1130))
in (_119_1131)::[])
in (vname_decl)::_119_1132)))))
in (let axy = ((asym, FStar_ToSMT_Term.Type_sort))::((xsym, FStar_ToSMT_Term.Term_sort))::((ysym, FStar_ToSMT_Term.Term_sort))::[]
in (let xy = ((xsym, FStar_ToSMT_Term.Term_sort))::((ysym, FStar_ToSMT_Term.Term_sort))::[]
in (let qx = ((xsym, FStar_ToSMT_Term.Term_sort))::[]
in (let prims = (let _119_1292 = (let _119_1141 = (let _119_1140 = (let _119_1139 = (FStar_ToSMT_Term.mkEq (x, y))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxBool _119_1139))
in (quant axy _119_1140))
in (FStar_Absyn_Const.op_Eq, _119_1141))
in (let _119_1291 = (let _119_1290 = (let _119_1148 = (let _119_1147 = (let _119_1146 = (let _119_1145 = (FStar_ToSMT_Term.mkEq (x, y))
in (FStar_ToSMT_Term.mkNot _119_1145))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxBool _119_1146))
in (quant axy _119_1147))
in (FStar_Absyn_Const.op_notEq, _119_1148))
in (let _119_1289 = (let _119_1288 = (let _119_1157 = (let _119_1156 = (let _119_1155 = (let _119_1154 = (let _119_1153 = (FStar_ToSMT_Term.unboxInt x)
in (let _119_1152 = (FStar_ToSMT_Term.unboxInt y)
in (_119_1153, _119_1152)))
in (FStar_ToSMT_Term.mkLT _119_1154))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxBool _119_1155))
in (quant xy _119_1156))
in (FStar_Absyn_Const.op_LT, _119_1157))
in (let _119_1287 = (let _119_1286 = (let _119_1166 = (let _119_1165 = (let _119_1164 = (let _119_1163 = (let _119_1162 = (FStar_ToSMT_Term.unboxInt x)
in (let _119_1161 = (FStar_ToSMT_Term.unboxInt y)
in (_119_1162, _119_1161)))
in (FStar_ToSMT_Term.mkLTE _119_1163))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxBool _119_1164))
in (quant xy _119_1165))
in (FStar_Absyn_Const.op_LTE, _119_1166))
in (let _119_1285 = (let _119_1284 = (let _119_1175 = (let _119_1174 = (let _119_1173 = (let _119_1172 = (let _119_1171 = (FStar_ToSMT_Term.unboxInt x)
in (let _119_1170 = (FStar_ToSMT_Term.unboxInt y)
in (_119_1171, _119_1170)))
in (FStar_ToSMT_Term.mkGT _119_1172))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxBool _119_1173))
in (quant xy _119_1174))
in (FStar_Absyn_Const.op_GT, _119_1175))
in (let _119_1283 = (let _119_1282 = (let _119_1184 = (let _119_1183 = (let _119_1182 = (let _119_1181 = (let _119_1180 = (FStar_ToSMT_Term.unboxInt x)
in (let _119_1179 = (FStar_ToSMT_Term.unboxInt y)
in (_119_1180, _119_1179)))
in (FStar_ToSMT_Term.mkGTE _119_1181))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxBool _119_1182))
in (quant xy _119_1183))
in (FStar_Absyn_Const.op_GTE, _119_1184))
in (let _119_1281 = (let _119_1280 = (let _119_1193 = (let _119_1192 = (let _119_1191 = (let _119_1190 = (let _119_1189 = (FStar_ToSMT_Term.unboxInt x)
in (let _119_1188 = (FStar_ToSMT_Term.unboxInt y)
in (_119_1189, _119_1188)))
in (FStar_ToSMT_Term.mkSub _119_1190))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxInt _119_1191))
in (quant xy _119_1192))
in (FStar_Absyn_Const.op_Subtraction, _119_1193))
in (let _119_1279 = (let _119_1278 = (let _119_1200 = (let _119_1199 = (let _119_1198 = (let _119_1197 = (FStar_ToSMT_Term.unboxInt x)
in (FStar_ToSMT_Term.mkMinus _119_1197))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxInt _119_1198))
in (quant qx _119_1199))
in (FStar_Absyn_Const.op_Minus, _119_1200))
in (let _119_1277 = (let _119_1276 = (let _119_1209 = (let _119_1208 = (let _119_1207 = (let _119_1206 = (let _119_1205 = (FStar_ToSMT_Term.unboxInt x)
in (let _119_1204 = (FStar_ToSMT_Term.unboxInt y)
in (_119_1205, _119_1204)))
in (FStar_ToSMT_Term.mkAdd _119_1206))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxInt _119_1207))
in (quant xy _119_1208))
in (FStar_Absyn_Const.op_Addition, _119_1209))
in (let _119_1275 = (let _119_1274 = (let _119_1218 = (let _119_1217 = (let _119_1216 = (let _119_1215 = (let _119_1214 = (FStar_ToSMT_Term.unboxInt x)
in (let _119_1213 = (FStar_ToSMT_Term.unboxInt y)
in (_119_1214, _119_1213)))
in (FStar_ToSMT_Term.mkMul _119_1215))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxInt _119_1216))
in (quant xy _119_1217))
in (FStar_Absyn_Const.op_Multiply, _119_1218))
in (let _119_1273 = (let _119_1272 = (let _119_1227 = (let _119_1226 = (let _119_1225 = (let _119_1224 = (let _119_1223 = (FStar_ToSMT_Term.unboxInt x)
in (let _119_1222 = (FStar_ToSMT_Term.unboxInt y)
in (_119_1223, _119_1222)))
in (FStar_ToSMT_Term.mkDiv _119_1224))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxInt _119_1225))
in (quant xy _119_1226))
in (FStar_Absyn_Const.op_Division, _119_1227))
in (let _119_1271 = (let _119_1270 = (let _119_1236 = (let _119_1235 = (let _119_1234 = (let _119_1233 = (let _119_1232 = (FStar_ToSMT_Term.unboxInt x)
in (let _119_1231 = (FStar_ToSMT_Term.unboxInt y)
in (_119_1232, _119_1231)))
in (FStar_ToSMT_Term.mkMod _119_1233))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxInt _119_1234))
in (quant xy _119_1235))
in (FStar_Absyn_Const.op_Modulus, _119_1236))
in (let _119_1269 = (let _119_1268 = (let _119_1245 = (let _119_1244 = (let _119_1243 = (let _119_1242 = (let _119_1241 = (FStar_ToSMT_Term.unboxBool x)
in (let _119_1240 = (FStar_ToSMT_Term.unboxBool y)
in (_119_1241, _119_1240)))
in (FStar_ToSMT_Term.mkAnd _119_1242))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxBool _119_1243))
in (quant xy _119_1244))
in (FStar_Absyn_Const.op_And, _119_1245))
in (let _119_1267 = (let _119_1266 = (let _119_1254 = (let _119_1253 = (let _119_1252 = (let _119_1251 = (let _119_1250 = (FStar_ToSMT_Term.unboxBool x)
in (let _119_1249 = (FStar_ToSMT_Term.unboxBool y)
in (_119_1250, _119_1249)))
in (FStar_ToSMT_Term.mkOr _119_1251))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxBool _119_1252))
in (quant xy _119_1253))
in (FStar_Absyn_Const.op_Or, _119_1254))
in (let _119_1265 = (let _119_1264 = (let _119_1261 = (let _119_1260 = (let _119_1259 = (let _119_1258 = (FStar_ToSMT_Term.unboxBool x)
in (FStar_ToSMT_Term.mkNot _119_1258))
in (FStar_All.pipe_left FStar_ToSMT_Term.boxBool _119_1259))
in (quant qx _119_1260))
in (FStar_Absyn_Const.op_Negation, _119_1261))
in (_119_1264)::[])
in (_119_1266)::_119_1265))
in (_119_1268)::_119_1267))
in (_119_1270)::_119_1269))
in (_119_1272)::_119_1271))
in (_119_1274)::_119_1273))
in (_119_1276)::_119_1275))
in (_119_1278)::_119_1277))
in (_119_1280)::_119_1279))
in (_119_1282)::_119_1281))
in (_119_1284)::_119_1283))
in (_119_1286)::_119_1285))
in (_119_1288)::_119_1287))
in (_119_1290)::_119_1289))
in (_119_1292)::_119_1291))
in (let mk = (fun l v -> (let _119_1324 = (FStar_All.pipe_right prims (FStar_List.filter (fun _53_1983 -> (match (_53_1983) with
| (l', _53_1982) -> begin
(FStar_Absyn_Syntax.lid_equals l l')
end))))
in (FStar_All.pipe_right _119_1324 (FStar_List.collect (fun _53_1987 -> (match (_53_1987) with
| (_53_1985, b) -> begin
(b v)
end))))))
in (let is = (fun l -> (FStar_All.pipe_right prims (FStar_Util.for_some (fun _53_1993 -> (match (_53_1993) with
| (l', _53_1992) -> begin
(FStar_Absyn_Syntax.lid_equals l l')
end)))))
in {mk = mk; is = is}))))))))
end))
end))
end))

let primitive_type_axioms = (let xx = ("x", FStar_ToSMT_Term.Term_sort)
in (let x = (FStar_ToSMT_Term.mkFreeV xx)
in (let yy = ("y", FStar_ToSMT_Term.Term_sort)
in (let y = (FStar_ToSMT_Term.mkFreeV yy)
in (let mk_unit = (fun _53_1999 tt -> (let typing_pred = (FStar_ToSMT_Term.mk_HasType x tt)
in (let _119_1356 = (let _119_1347 = (let _119_1346 = (FStar_ToSMT_Term.mk_HasType FStar_ToSMT_Term.mk_Term_unit tt)
in (_119_1346, Some ("unit typing")))
in FStar_ToSMT_Term.Assume (_119_1347))
in (let _119_1355 = (let _119_1354 = (let _119_1353 = (let _119_1352 = (let _119_1351 = (let _119_1350 = (let _119_1349 = (let _119_1348 = (FStar_ToSMT_Term.mkEq (x, FStar_ToSMT_Term.mk_Term_unit))
in (typing_pred, _119_1348))
in (FStar_ToSMT_Term.mkImp _119_1349))
in ((typing_pred)::[], (xx)::[], _119_1350))
in (mkForall_fuel _119_1351))
in (_119_1352, Some ("unit inversion")))
in FStar_ToSMT_Term.Assume (_119_1353))
in (_119_1354)::[])
in (_119_1356)::_119_1355))))
in (let mk_bool = (fun _53_2004 tt -> (let typing_pred = (FStar_ToSMT_Term.mk_HasType x tt)
in (let bb = ("b", FStar_ToSMT_Term.Bool_sort)
in (let b = (FStar_ToSMT_Term.mkFreeV bb)
in (let _119_1376 = (let _119_1366 = (let _119_1365 = (let _119_1364 = (let _119_1363 = (let _119_1362 = (let _119_1361 = (FStar_ToSMT_Term.mk_tester "BoxBool" x)
in (typing_pred, _119_1361))
in (FStar_ToSMT_Term.mkImp _119_1362))
in ((typing_pred)::[], (xx)::[], _119_1363))
in (mkForall_fuel _119_1364))
in (_119_1365, Some ("bool inversion")))
in FStar_ToSMT_Term.Assume (_119_1366))
in (let _119_1375 = (let _119_1374 = (let _119_1373 = (let _119_1372 = (let _119_1371 = (let _119_1370 = (let _119_1367 = (FStar_ToSMT_Term.boxBool b)
in (_119_1367)::[])
in (let _119_1369 = (let _119_1368 = (FStar_ToSMT_Term.boxBool b)
in (FStar_ToSMT_Term.mk_HasType _119_1368 tt))
in (_119_1370, (bb)::[], _119_1369)))
in (FStar_ToSMT_Term.mkForall _119_1371))
in (_119_1372, Some ("bool typing")))
in FStar_ToSMT_Term.Assume (_119_1373))
in (_119_1374)::[])
in (_119_1376)::_119_1375))))))
in (let mk_int = (fun _53_2011 tt -> (let typing_pred = (FStar_ToSMT_Term.mk_HasType x tt)
in (let typing_pred_y = (FStar_ToSMT_Term.mk_HasType y tt)
in (let aa = ("a", FStar_ToSMT_Term.Int_sort)
in (let a = (FStar_ToSMT_Term.mkFreeV aa)
in (let bb = ("b", FStar_ToSMT_Term.Int_sort)
in (let b = (FStar_ToSMT_Term.mkFreeV bb)
in (let precedes = (let _119_1388 = (let _119_1387 = (let _119_1386 = (let _119_1385 = (let _119_1384 = (let _119_1383 = (FStar_ToSMT_Term.boxInt a)
in (let _119_1382 = (let _119_1381 = (FStar_ToSMT_Term.boxInt b)
in (_119_1381)::[])
in (_119_1383)::_119_1382))
in (tt)::_119_1384)
in (tt)::_119_1385)
in ("Prims.Precedes", _119_1386))
in (FStar_ToSMT_Term.mkApp _119_1387))
in (FStar_All.pipe_left FStar_ToSMT_Term.mk_Valid _119_1388))
in (let precedes_y_x = (let _119_1389 = (FStar_ToSMT_Term.mkApp ("Precedes", (y)::(x)::[]))
in (FStar_All.pipe_left FStar_ToSMT_Term.mk_Valid _119_1389))
in (let _119_1430 = (let _119_1395 = (let _119_1394 = (let _119_1393 = (let _119_1392 = (let _119_1391 = (let _119_1390 = (FStar_ToSMT_Term.mk_tester "BoxInt" x)
in (typing_pred, _119_1390))
in (FStar_ToSMT_Term.mkImp _119_1391))
in ((typing_pred)::[], (xx)::[], _119_1392))
in (mkForall_fuel _119_1393))
in (_119_1394, Some ("int inversion")))
in FStar_ToSMT_Term.Assume (_119_1395))
in (let _119_1429 = (let _119_1428 = (let _119_1402 = (let _119_1401 = (let _119_1400 = (let _119_1399 = (let _119_1396 = (FStar_ToSMT_Term.boxInt b)
in (_119_1396)::[])
in (let _119_1398 = (let _119_1397 = (FStar_ToSMT_Term.boxInt b)
in (FStar_ToSMT_Term.mk_HasType _119_1397 tt))
in (_119_1399, (bb)::[], _119_1398)))
in (FStar_ToSMT_Term.mkForall _119_1400))
in (_119_1401, Some ("int typing")))
in FStar_ToSMT_Term.Assume (_119_1402))
in (let _119_1427 = (let _119_1426 = (let _119_1425 = (let _119_1424 = (let _119_1423 = (let _119_1422 = (let _119_1421 = (let _119_1420 = (let _119_1419 = (let _119_1418 = (let _119_1417 = (let _119_1416 = (let _119_1405 = (let _119_1404 = (FStar_ToSMT_Term.unboxInt x)
in (let _119_1403 = (FStar_ToSMT_Term.mkInteger' 0)
in (_119_1404, _119_1403)))
in (FStar_ToSMT_Term.mkGT _119_1405))
in (let _119_1415 = (let _119_1414 = (let _119_1408 = (let _119_1407 = (FStar_ToSMT_Term.unboxInt y)
in (let _119_1406 = (FStar_ToSMT_Term.mkInteger' 0)
in (_119_1407, _119_1406)))
in (FStar_ToSMT_Term.mkGTE _119_1408))
in (let _119_1413 = (let _119_1412 = (let _119_1411 = (let _119_1410 = (FStar_ToSMT_Term.unboxInt y)
in (let _119_1409 = (FStar_ToSMT_Term.unboxInt x)
in (_119_1410, _119_1409)))
in (FStar_ToSMT_Term.mkLT _119_1411))
in (_119_1412)::[])
in (_119_1414)::_119_1413))
in (_119_1416)::_119_1415))
in (typing_pred_y)::_119_1417)
in (typing_pred)::_119_1418)
in (FStar_ToSMT_Term.mk_and_l _119_1419))
in (_119_1420, precedes_y_x))
in (FStar_ToSMT_Term.mkImp _119_1421))
in ((typing_pred)::(typing_pred_y)::(precedes_y_x)::[], (xx)::(yy)::[], _119_1422))
in (mkForall_fuel _119_1423))
in (_119_1424, Some ("well-founded ordering on nat (alt)")))
in FStar_ToSMT_Term.Assume (_119_1425))
in (_119_1426)::[])
in (_119_1428)::_119_1427))
in (_119_1430)::_119_1429)))))))))))
in (let mk_int_alias = (fun _53_2023 tt -> (let _119_1439 = (let _119_1438 = (let _119_1437 = (let _119_1436 = (let _119_1435 = (FStar_ToSMT_Term.mkApp (FStar_Absyn_Const.int_lid.FStar_Absyn_Syntax.str, []))
in (tt, _119_1435))
in (FStar_ToSMT_Term.mkEq _119_1436))
in (_119_1437, Some ("mapping to int; for now")))
in FStar_ToSMT_Term.Assume (_119_1438))
in (_119_1439)::[]))
in (let mk_str = (fun _53_2027 tt -> (let typing_pred = (FStar_ToSMT_Term.mk_HasType x tt)
in (let bb = ("b", FStar_ToSMT_Term.String_sort)
in (let b = (FStar_ToSMT_Term.mkFreeV bb)
in (let _119_1459 = (let _119_1449 = (let _119_1448 = (let _119_1447 = (let _119_1446 = (let _119_1445 = (let _119_1444 = (FStar_ToSMT_Term.mk_tester "BoxString" x)
in (typing_pred, _119_1444))
in (FStar_ToSMT_Term.mkImp _119_1445))
in ((typing_pred)::[], (xx)::[], _119_1446))
in (mkForall_fuel _119_1447))
in (_119_1448, Some ("string inversion")))
in FStar_ToSMT_Term.Assume (_119_1449))
in (let _119_1458 = (let _119_1457 = (let _119_1456 = (let _119_1455 = (let _119_1454 = (let _119_1453 = (let _119_1450 = (FStar_ToSMT_Term.boxString b)
in (_119_1450)::[])
in (let _119_1452 = (let _119_1451 = (FStar_ToSMT_Term.boxString b)
in (FStar_ToSMT_Term.mk_HasType _119_1451 tt))
in (_119_1453, (bb)::[], _119_1452)))
in (FStar_ToSMT_Term.mkForall _119_1454))
in (_119_1455, Some ("string typing")))
in FStar_ToSMT_Term.Assume (_119_1456))
in (_119_1457)::[])
in (_119_1459)::_119_1458))))))
in (let mk_ref = (fun reft_name _53_2035 -> (let r = ("r", FStar_ToSMT_Term.Ref_sort)
in (let aa = ("a", FStar_ToSMT_Term.Type_sort)
in (let bb = ("b", FStar_ToSMT_Term.Type_sort)
in (let refa = (let _119_1466 = (let _119_1465 = (let _119_1464 = (FStar_ToSMT_Term.mkFreeV aa)
in (_119_1464)::[])
in (reft_name, _119_1465))
in (FStar_ToSMT_Term.mkApp _119_1466))
in (let refb = (let _119_1469 = (let _119_1468 = (let _119_1467 = (FStar_ToSMT_Term.mkFreeV bb)
in (_119_1467)::[])
in (reft_name, _119_1468))
in (FStar_ToSMT_Term.mkApp _119_1469))
in (let typing_pred = (FStar_ToSMT_Term.mk_HasType x refa)
in (let typing_pred_b = (FStar_ToSMT_Term.mk_HasType x refb)
in (let _119_1488 = (let _119_1475 = (let _119_1474 = (let _119_1473 = (let _119_1472 = (let _119_1471 = (let _119_1470 = (FStar_ToSMT_Term.mk_tester "BoxRef" x)
in (typing_pred, _119_1470))
in (FStar_ToSMT_Term.mkImp _119_1471))
in ((typing_pred)::[], (xx)::(aa)::[], _119_1472))
in (mkForall_fuel _119_1473))
in (_119_1474, Some ("ref inversion")))
in FStar_ToSMT_Term.Assume (_119_1475))
in (let _119_1487 = (let _119_1486 = (let _119_1485 = (let _119_1484 = (let _119_1483 = (let _119_1482 = (let _119_1481 = (let _119_1480 = (FStar_ToSMT_Term.mkAnd (typing_pred, typing_pred_b))
in (let _119_1479 = (let _119_1478 = (let _119_1477 = (FStar_ToSMT_Term.mkFreeV aa)
in (let _119_1476 = (FStar_ToSMT_Term.mkFreeV bb)
in (_119_1477, _119_1476)))
in (FStar_ToSMT_Term.mkEq _119_1478))
in (_119_1480, _119_1479)))
in (FStar_ToSMT_Term.mkImp _119_1481))
in ((typing_pred)::(typing_pred_b)::[], (xx)::(aa)::(bb)::[], _119_1482))
in (mkForall_fuel' 2 _119_1483))
in (_119_1484, Some ("ref typing is injective")))
in FStar_ToSMT_Term.Assume (_119_1485))
in (_119_1486)::[])
in (_119_1488)::_119_1487))))))))))
in (let mk_false_interp = (fun _53_2045 false_tm -> (let valid = (FStar_ToSMT_Term.mkApp ("Valid", (false_tm)::[]))
in (let _119_1495 = (let _119_1494 = (let _119_1493 = (FStar_ToSMT_Term.mkIff (FStar_ToSMT_Term.mkFalse, valid))
in (_119_1493, Some ("False interpretation")))
in FStar_ToSMT_Term.Assume (_119_1494))
in (_119_1495)::[])))
in (let mk_and_interp = (fun conj _53_2051 -> (let aa = ("a", FStar_ToSMT_Term.Type_sort)
in (let bb = ("b", FStar_ToSMT_Term.Type_sort)
in (let a = (FStar_ToSMT_Term.mkFreeV aa)
in (let b = (FStar_ToSMT_Term.mkFreeV bb)
in (let valid = (let _119_1502 = (let _119_1501 = (let _119_1500 = (FStar_ToSMT_Term.mkApp (conj, (a)::(b)::[]))
in (_119_1500)::[])
in ("Valid", _119_1501))
in (FStar_ToSMT_Term.mkApp _119_1502))
in (let valid_a = (FStar_ToSMT_Term.mkApp ("Valid", (a)::[]))
in (let valid_b = (FStar_ToSMT_Term.mkApp ("Valid", (b)::[]))
in (let _119_1509 = (let _119_1508 = (let _119_1507 = (let _119_1506 = (let _119_1505 = (let _119_1504 = (let _119_1503 = (FStar_ToSMT_Term.mkAnd (valid_a, valid_b))
in (_119_1503, valid))
in (FStar_ToSMT_Term.mkIff _119_1504))
in ((valid)::[], (aa)::(bb)::[], _119_1505))
in (FStar_ToSMT_Term.mkForall _119_1506))
in (_119_1507, Some ("/\\ interpretation")))
in FStar_ToSMT_Term.Assume (_119_1508))
in (_119_1509)::[])))))))))
in (let mk_or_interp = (fun disj _53_2062 -> (let aa = ("a", FStar_ToSMT_Term.Type_sort)
in (let bb = ("b", FStar_ToSMT_Term.Type_sort)
in (let a = (FStar_ToSMT_Term.mkFreeV aa)
in (let b = (FStar_ToSMT_Term.mkFreeV bb)
in (let valid = (let _119_1516 = (let _119_1515 = (let _119_1514 = (FStar_ToSMT_Term.mkApp (disj, (a)::(b)::[]))
in (_119_1514)::[])
in ("Valid", _119_1515))
in (FStar_ToSMT_Term.mkApp _119_1516))
in (let valid_a = (FStar_ToSMT_Term.mkApp ("Valid", (a)::[]))
in (let valid_b = (FStar_ToSMT_Term.mkApp ("Valid", (b)::[]))
in (let _119_1523 = (let _119_1522 = (let _119_1521 = (let _119_1520 = (let _119_1519 = (let _119_1518 = (let _119_1517 = (FStar_ToSMT_Term.mkOr (valid_a, valid_b))
in (_119_1517, valid))
in (FStar_ToSMT_Term.mkIff _119_1518))
in ((valid)::[], (aa)::(bb)::[], _119_1519))
in (FStar_ToSMT_Term.mkForall _119_1520))
in (_119_1521, Some ("\\/ interpretation")))
in FStar_ToSMT_Term.Assume (_119_1522))
in (_119_1523)::[])))))))))
in (let mk_eq2_interp = (fun eq2 tt -> (let aa = ("a", FStar_ToSMT_Term.Type_sort)
in (let bb = ("b", FStar_ToSMT_Term.Type_sort)
in (let xx = ("x", FStar_ToSMT_Term.Term_sort)
in (let yy = ("y", FStar_ToSMT_Term.Term_sort)
in (let a = (FStar_ToSMT_Term.mkFreeV aa)
in (let b = (FStar_ToSMT_Term.mkFreeV bb)
in (let x = (FStar_ToSMT_Term.mkFreeV xx)
in (let y = (FStar_ToSMT_Term.mkFreeV yy)
in (let valid = (let _119_1530 = (let _119_1529 = (let _119_1528 = (FStar_ToSMT_Term.mkApp (eq2, (a)::(b)::(x)::(y)::[]))
in (_119_1528)::[])
in ("Valid", _119_1529))
in (FStar_ToSMT_Term.mkApp _119_1530))
in (let _119_1537 = (let _119_1536 = (let _119_1535 = (let _119_1534 = (let _119_1533 = (let _119_1532 = (let _119_1531 = (FStar_ToSMT_Term.mkEq (x, y))
in (_119_1531, valid))
in (FStar_ToSMT_Term.mkIff _119_1532))
in ((valid)::[], (aa)::(bb)::(xx)::(yy)::[], _119_1533))
in (FStar_ToSMT_Term.mkForall _119_1534))
in (_119_1535, Some ("Eq2 interpretation")))
in FStar_ToSMT_Term.Assume (_119_1536))
in (_119_1537)::[])))))))))))
in (let mk_imp_interp = (fun imp tt -> (let aa = ("a", FStar_ToSMT_Term.Type_sort)
in (let bb = ("b", FStar_ToSMT_Term.Type_sort)
in (let a = (FStar_ToSMT_Term.mkFreeV aa)
in (let b = (FStar_ToSMT_Term.mkFreeV bb)
in (let valid = (let _119_1544 = (let _119_1543 = (let _119_1542 = (FStar_ToSMT_Term.mkApp (imp, (a)::(b)::[]))
in (_119_1542)::[])
in ("Valid", _119_1543))
in (FStar_ToSMT_Term.mkApp _119_1544))
in (let valid_a = (FStar_ToSMT_Term.mkApp ("Valid", (a)::[]))
in (let valid_b = (FStar_ToSMT_Term.mkApp ("Valid", (b)::[]))
in (let _119_1551 = (let _119_1550 = (let _119_1549 = (let _119_1548 = (let _119_1547 = (let _119_1546 = (let _119_1545 = (FStar_ToSMT_Term.mkImp (valid_a, valid_b))
in (_119_1545, valid))
in (FStar_ToSMT_Term.mkIff _119_1546))
in ((valid)::[], (aa)::(bb)::[], _119_1547))
in (FStar_ToSMT_Term.mkForall _119_1548))
in (_119_1549, Some ("==> interpretation")))
in FStar_ToSMT_Term.Assume (_119_1550))
in (_119_1551)::[])))))))))
in (let mk_iff_interp = (fun iff tt -> (let aa = ("a", FStar_ToSMT_Term.Type_sort)
in (let bb = ("b", FStar_ToSMT_Term.Type_sort)
in (let a = (FStar_ToSMT_Term.mkFreeV aa)
in (let b = (FStar_ToSMT_Term.mkFreeV bb)
in (let valid = (let _119_1558 = (let _119_1557 = (let _119_1556 = (FStar_ToSMT_Term.mkApp (iff, (a)::(b)::[]))
in (_119_1556)::[])
in ("Valid", _119_1557))
in (FStar_ToSMT_Term.mkApp _119_1558))
in (let valid_a = (FStar_ToSMT_Term.mkApp ("Valid", (a)::[]))
in (let valid_b = (FStar_ToSMT_Term.mkApp ("Valid", (b)::[]))
in (let _119_1565 = (let _119_1564 = (let _119_1563 = (let _119_1562 = (let _119_1561 = (let _119_1560 = (let _119_1559 = (FStar_ToSMT_Term.mkIff (valid_a, valid_b))
in (_119_1559, valid))
in (FStar_ToSMT_Term.mkIff _119_1560))
in ((valid)::[], (aa)::(bb)::[], _119_1561))
in (FStar_ToSMT_Term.mkForall _119_1562))
in (_119_1563, Some ("<==> interpretation")))
in FStar_ToSMT_Term.Assume (_119_1564))
in (_119_1565)::[])))))))))
in (let mk_forall_interp = (fun for_all tt -> (let aa = ("a", FStar_ToSMT_Term.Type_sort)
in (let bb = ("b", FStar_ToSMT_Term.Type_sort)
in (let xx = ("x", FStar_ToSMT_Term.Term_sort)
in (let a = (FStar_ToSMT_Term.mkFreeV aa)
in (let b = (FStar_ToSMT_Term.mkFreeV bb)
in (let x = (FStar_ToSMT_Term.mkFreeV xx)
in (let valid = (let _119_1572 = (let _119_1571 = (let _119_1570 = (FStar_ToSMT_Term.mkApp (for_all, (a)::(b)::[]))
in (_119_1570)::[])
in ("Valid", _119_1571))
in (FStar_ToSMT_Term.mkApp _119_1572))
in (let valid_b_x = (let _119_1575 = (let _119_1574 = (let _119_1573 = (FStar_ToSMT_Term.mk_ApplyTE b x)
in (_119_1573)::[])
in ("Valid", _119_1574))
in (FStar_ToSMT_Term.mkApp _119_1575))
in (let _119_1588 = (let _119_1587 = (let _119_1586 = (let _119_1585 = (let _119_1584 = (let _119_1583 = (let _119_1582 = (let _119_1581 = (let _119_1580 = (let _119_1576 = (FStar_ToSMT_Term.mk_HasTypeZ x a)
in (_119_1576)::[])
in (let _119_1579 = (let _119_1578 = (let _119_1577 = (FStar_ToSMT_Term.mk_HasTypeZ x a)
in (_119_1577, valid_b_x))
in (FStar_ToSMT_Term.mkImp _119_1578))
in (_119_1580, (xx)::[], _119_1579)))
in (FStar_ToSMT_Term.mkForall _119_1581))
in (_119_1582, valid))
in (FStar_ToSMT_Term.mkIff _119_1583))
in ((valid)::[], (aa)::(bb)::[], _119_1584))
in (FStar_ToSMT_Term.mkForall _119_1585))
in (_119_1586, Some ("forall interpretation")))
in FStar_ToSMT_Term.Assume (_119_1587))
in (_119_1588)::[]))))))))))
in (let mk_exists_interp = (fun for_all tt -> (let aa = ("a", FStar_ToSMT_Term.Type_sort)
in (let bb = ("b", FStar_ToSMT_Term.Type_sort)
in (let xx = ("x", FStar_ToSMT_Term.Term_sort)
in (let a = (FStar_ToSMT_Term.mkFreeV aa)
in (let b = (FStar_ToSMT_Term.mkFreeV bb)
in (let x = (FStar_ToSMT_Term.mkFreeV xx)
in (let valid = (let _119_1595 = (let _119_1594 = (let _119_1593 = (FStar_ToSMT_Term.mkApp (for_all, (a)::(b)::[]))
in (_119_1593)::[])
in ("Valid", _119_1594))
in (FStar_ToSMT_Term.mkApp _119_1595))
in (let valid_b_x = (let _119_1598 = (let _119_1597 = (let _119_1596 = (FStar_ToSMT_Term.mk_ApplyTE b x)
in (_119_1596)::[])
in ("Valid", _119_1597))
in (FStar_ToSMT_Term.mkApp _119_1598))
in (let _119_1611 = (let _119_1610 = (let _119_1609 = (let _119_1608 = (let _119_1607 = (let _119_1606 = (let _119_1605 = (let _119_1604 = (let _119_1603 = (let _119_1599 = (FStar_ToSMT_Term.mk_HasTypeZ x a)
in (_119_1599)::[])
in (let _119_1602 = (let _119_1601 = (let _119_1600 = (FStar_ToSMT_Term.mk_HasTypeZ x a)
in (_119_1600, valid_b_x))
in (FStar_ToSMT_Term.mkImp _119_1601))
in (_119_1603, (xx)::[], _119_1602)))
in (FStar_ToSMT_Term.mkExists _119_1604))
in (_119_1605, valid))
in (FStar_ToSMT_Term.mkIff _119_1606))
in ((valid)::[], (aa)::(bb)::[], _119_1607))
in (FStar_ToSMT_Term.mkForall _119_1608))
in (_119_1609, Some ("exists interpretation")))
in FStar_ToSMT_Term.Assume (_119_1610))
in (_119_1611)::[]))))))))))
in (let mk_foralltyp_interp = (fun for_all tt -> (let kk = ("k", FStar_ToSMT_Term.Kind_sort)
in (let aa = ("aa", FStar_ToSMT_Term.Type_sort)
in (let bb = ("bb", FStar_ToSMT_Term.Term_sort)
in (let k = (FStar_ToSMT_Term.mkFreeV kk)
in (let a = (FStar_ToSMT_Term.mkFreeV aa)
in (let b = (FStar_ToSMT_Term.mkFreeV bb)
in (let valid = (let _119_1618 = (let _119_1617 = (let _119_1616 = (FStar_ToSMT_Term.mkApp (for_all, (k)::(a)::[]))
in (_119_1616)::[])
in ("Valid", _119_1617))
in (FStar_ToSMT_Term.mkApp _119_1618))
in (let valid_a_b = (let _119_1621 = (let _119_1620 = (let _119_1619 = (FStar_ToSMT_Term.mk_ApplyTE a b)
in (_119_1619)::[])
in ("Valid", _119_1620))
in (FStar_ToSMT_Term.mkApp _119_1621))
in (let _119_1634 = (let _119_1633 = (let _119_1632 = (let _119_1631 = (let _119_1630 = (let _119_1629 = (let _119_1628 = (let _119_1627 = (let _119_1626 = (let _119_1622 = (FStar_ToSMT_Term.mk_HasKind b k)
in (_119_1622)::[])
in (let _119_1625 = (let _119_1624 = (let _119_1623 = (FStar_ToSMT_Term.mk_HasKind b k)
in (_119_1623, valid_a_b))
in (FStar_ToSMT_Term.mkImp _119_1624))
in (_119_1626, (bb)::[], _119_1625)))
in (FStar_ToSMT_Term.mkForall _119_1627))
in (_119_1628, valid))
in (FStar_ToSMT_Term.mkIff _119_1629))
in ((valid)::[], (kk)::(aa)::[], _119_1630))
in (FStar_ToSMT_Term.mkForall _119_1631))
in (_119_1632, Some ("ForallTyp interpretation")))
in FStar_ToSMT_Term.Assume (_119_1633))
in (_119_1634)::[]))))))))))
in (let mk_existstyp_interp = (fun for_some tt -> (let kk = ("k", FStar_ToSMT_Term.Kind_sort)
in (let aa = ("aa", FStar_ToSMT_Term.Type_sort)
in (let bb = ("bb", FStar_ToSMT_Term.Term_sort)
in (let k = (FStar_ToSMT_Term.mkFreeV kk)
in (let a = (FStar_ToSMT_Term.mkFreeV aa)
in (let b = (FStar_ToSMT_Term.mkFreeV bb)
in (let valid = (let _119_1641 = (let _119_1640 = (let _119_1639 = (FStar_ToSMT_Term.mkApp (for_some, (k)::(a)::[]))
in (_119_1639)::[])
in ("Valid", _119_1640))
in (FStar_ToSMT_Term.mkApp _119_1641))
in (let valid_a_b = (let _119_1644 = (let _119_1643 = (let _119_1642 = (FStar_ToSMT_Term.mk_ApplyTE a b)
in (_119_1642)::[])
in ("Valid", _119_1643))
in (FStar_ToSMT_Term.mkApp _119_1644))
in (let _119_1657 = (let _119_1656 = (let _119_1655 = (let _119_1654 = (let _119_1653 = (let _119_1652 = (let _119_1651 = (let _119_1650 = (let _119_1649 = (let _119_1645 = (FStar_ToSMT_Term.mk_HasKind b k)
in (_119_1645)::[])
in (let _119_1648 = (let _119_1647 = (let _119_1646 = (FStar_ToSMT_Term.mk_HasKind b k)
in (_119_1646, valid_a_b))
in (FStar_ToSMT_Term.mkImp _119_1647))
in (_119_1649, (bb)::[], _119_1648)))
in (FStar_ToSMT_Term.mkExists _119_1650))
in (_119_1651, valid))
in (FStar_ToSMT_Term.mkIff _119_1652))
in ((valid)::[], (kk)::(aa)::[], _119_1653))
in (FStar_ToSMT_Term.mkForall _119_1654))
in (_119_1655, Some ("ExistsTyp interpretation")))
in FStar_ToSMT_Term.Assume (_119_1656))
in (_119_1657)::[]))))))))))
in (let prims = ((FStar_Absyn_Const.unit_lid, mk_unit))::((FStar_Absyn_Const.bool_lid, mk_bool))::((FStar_Absyn_Const.int_lid, mk_int))::((FStar_Absyn_Const.string_lid, mk_str))::((FStar_Absyn_Const.ref_lid, mk_ref))::((FStar_Absyn_Const.char_lid, mk_int_alias))::((FStar_Absyn_Const.uint8_lid, mk_int_alias))::((FStar_Absyn_Const.false_lid, mk_false_interp))::((FStar_Absyn_Const.and_lid, mk_and_interp))::((FStar_Absyn_Const.or_lid, mk_or_interp))::((FStar_Absyn_Const.eq2_lid, mk_eq2_interp))::((FStar_Absyn_Const.imp_lid, mk_imp_interp))::((FStar_Absyn_Const.iff_lid, mk_iff_interp))::((FStar_Absyn_Const.forall_lid, mk_forall_interp))::((FStar_Absyn_Const.exists_lid, mk_exists_interp))::[]
in (fun t s tt -> (match ((FStar_Util.find_opt (fun _53_2155 -> (match (_53_2155) with
| (l, _53_2154) -> begin
(FStar_Absyn_Syntax.lid_equals l t)
end)) prims)) with
| None -> begin
[]
end
| Some (_53_2158, f) -> begin
(f s tt)
end)))))))))))))))))))))))

let rec encode_sigelt = (fun env se -> (let _53_2164 = (match ((FStar_Tc_Env.debug env.tcenv FStar_Options.Low)) with
| true -> begin
(let _119_1800 = (FStar_Absyn_Print.sigelt_to_string se)
in (FStar_All.pipe_left (FStar_Util.fprint1 ">>>>Encoding [%s]\n") _119_1800))
end
| false -> begin
()
end)
in (let nm = (match ((FStar_Absyn_Util.lid_of_sigelt se)) with
| None -> begin
""
end
| Some (l) -> begin
l.FStar_Absyn_Syntax.str
end)
in (let _53_2172 = (encode_sigelt' env se)
in (match (_53_2172) with
| (g, e) -> begin
(match (g) with
| [] -> begin
(let _119_1803 = (let _119_1802 = (let _119_1801 = (FStar_Util.format1 "<Skipped %s/>" nm)
in FStar_ToSMT_Term.Caption (_119_1801))
in (_119_1802)::[])
in (_119_1803, e))
end
| _53_2175 -> begin
(let _119_1810 = (let _119_1809 = (let _119_1805 = (let _119_1804 = (FStar_Util.format1 "<Start encoding %s>" nm)
in FStar_ToSMT_Term.Caption (_119_1804))
in (_119_1805)::g)
in (let _119_1808 = (let _119_1807 = (let _119_1806 = (FStar_Util.format1 "</end encoding %s>" nm)
in FStar_ToSMT_Term.Caption (_119_1806))
in (_119_1807)::[])
in (FStar_List.append _119_1809 _119_1808)))
in (_119_1810, e))
end)
end)))))
and encode_sigelt' = (fun env se -> (let should_skip = (fun l -> ((((FStar_Util.starts_with l.FStar_Absyn_Syntax.str "Prims.pure_") || (FStar_Util.starts_with l.FStar_Absyn_Syntax.str "Prims.ex_")) || (FStar_Util.starts_with l.FStar_Absyn_Syntax.str "Prims.st_")) || (FStar_Util.starts_with l.FStar_Absyn_Syntax.str "Prims.all_")))
in (let encode_top_level_val = (fun env lid t quals -> (let tt = (whnf env t)
in (let _53_2188 = (encode_free_var env lid t tt quals)
in (match (_53_2188) with
| (decls, env) -> begin
(match ((FStar_Absyn_Util.is_smt_lemma t)) with
| true -> begin
(let _119_1824 = (let _119_1823 = (encode_smt_lemma env lid t)
in (FStar_List.append decls _119_1823))
in (_119_1824, env))
end
| false -> begin
(decls, env)
end)
end))))
in (let encode_top_level_vals = (fun env bindings quals -> (FStar_All.pipe_right bindings (FStar_List.fold_left (fun _53_2195 lb -> (match (_53_2195) with
| (decls, env) -> begin
(let _53_2199 = (let _119_1833 = (FStar_Util.right lb.FStar_Absyn_Syntax.lbname)
in (encode_top_level_val env _119_1833 lb.FStar_Absyn_Syntax.lbtyp quals))
in (match (_53_2199) with
| (decls', env) -> begin
((FStar_List.append decls decls'), env)
end))
end)) ([], env))))
in (match (se) with
| FStar_Absyn_Syntax.Sig_typ_abbrev (_53_2201, _53_2203, _53_2205, _53_2207, FStar_Absyn_Syntax.Effect::[], _53_2211) -> begin
([], env)
end
| FStar_Absyn_Syntax.Sig_typ_abbrev (lid, _53_2216, _53_2218, _53_2220, _53_2222, _53_2224) when (should_skip lid) -> begin
([], env)
end
| FStar_Absyn_Syntax.Sig_typ_abbrev (lid, _53_2229, _53_2231, _53_2233, _53_2235, _53_2237) when (FStar_Absyn_Syntax.lid_equals lid FStar_Absyn_Const.b2t_lid) -> begin
(let _53_2243 = (new_typ_constant_and_tok_from_lid env lid)
in (match (_53_2243) with
| (tname, ttok, env) -> begin
(let xx = ("x", FStar_ToSMT_Term.Term_sort)
in (let x = (FStar_ToSMT_Term.mkFreeV xx)
in (let valid_b2t_x = (let _119_1834 = (FStar_ToSMT_Term.mkApp ("Prims.b2t", (x)::[]))
in (FStar_ToSMT_Term.mk_Valid _119_1834))
in (let decls = (let _119_1842 = (let _119_1841 = (let _119_1840 = (let _119_1839 = (let _119_1838 = (let _119_1837 = (let _119_1836 = (let _119_1835 = (FStar_ToSMT_Term.mkApp ("BoxBool_proj_0", (x)::[]))
in (valid_b2t_x, _119_1835))
in (FStar_ToSMT_Term.mkEq _119_1836))
in ((valid_b2t_x)::[], (xx)::[], _119_1837))
in (FStar_ToSMT_Term.mkForall _119_1838))
in (_119_1839, Some ("b2t def")))
in FStar_ToSMT_Term.Assume (_119_1840))
in (_119_1841)::[])
in (FStar_ToSMT_Term.DeclFun ((tname, (FStar_ToSMT_Term.Term_sort)::[], FStar_ToSMT_Term.Type_sort, None)))::_119_1842)
in (decls, env)))))
end))
end
| FStar_Absyn_Syntax.Sig_typ_abbrev (lid, tps, _53_2251, t, tags, _53_2255) -> begin
(let _53_2261 = (new_typ_constant_and_tok_from_lid env lid)
in (match (_53_2261) with
| (tname, ttok, env) -> begin
(let _53_2270 = (match (t.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_lam (tps', body) -> begin
((FStar_List.append tps tps'), body)
end
| _53_2267 -> begin
(tps, t)
end)
in (match (_53_2270) with
| (tps, t) -> begin
(let _53_2277 = (encode_binders None tps env)
in (match (_53_2277) with
| (vars, guards, env', binder_decls, _53_2276) -> begin
(let tok_app = (let _119_1843 = (FStar_ToSMT_Term.mkApp (ttok, []))
in (mk_ApplyT _119_1843 vars))
in (let tok_decl = FStar_ToSMT_Term.DeclFun ((ttok, [], FStar_ToSMT_Term.Type_sort, None))
in (let app = (let _119_1845 = (let _119_1844 = (FStar_List.map FStar_ToSMT_Term.mkFreeV vars)
in (tname, _119_1844))
in (FStar_ToSMT_Term.mkApp _119_1845))
in (let fresh_tok = (match (vars) with
| [] -> begin
[]
end
| _53_2283 -> begin
(let _119_1847 = (let _119_1846 = (varops.next_id ())
in (FStar_ToSMT_Term.fresh_token (ttok, FStar_ToSMT_Term.Type_sort) _119_1846))
in (_119_1847)::[])
end)
in (let decls = (let _119_1858 = (let _119_1851 = (let _119_1850 = (let _119_1849 = (let _119_1848 = (FStar_List.map Prims.snd vars)
in (tname, _119_1848, FStar_ToSMT_Term.Type_sort, None))
in FStar_ToSMT_Term.DeclFun (_119_1849))
in (_119_1850)::(tok_decl)::[])
in (FStar_List.append _119_1851 fresh_tok))
in (let _119_1857 = (let _119_1856 = (let _119_1855 = (let _119_1854 = (let _119_1853 = (let _119_1852 = (FStar_ToSMT_Term.mkEq (tok_app, app))
in ((tok_app)::[], vars, _119_1852))
in (FStar_ToSMT_Term.mkForall _119_1853))
in (_119_1854, Some ("name-token correspondence")))
in FStar_ToSMT_Term.Assume (_119_1855))
in (_119_1856)::[])
in (FStar_List.append _119_1858 _119_1857)))
in (let t = (whnf env t)
in (let _53_2295 = (match ((FStar_All.pipe_right tags (FStar_Util.for_some (fun _53_18 -> (match (_53_18) with
| FStar_Absyn_Syntax.Logic -> begin
true
end
| _53_2290 -> begin
false
end))))) with
| true -> begin
(let _119_1861 = (FStar_ToSMT_Term.mk_Valid app)
in (let _119_1860 = (encode_formula t env')
in (_119_1861, _119_1860)))
end
| false -> begin
(let _119_1862 = (encode_typ_term t env')
in (app, _119_1862))
end)
in (match (_53_2295) with
| (def, (body, decls1)) -> begin
(let abbrev_def = (let _119_1869 = (let _119_1868 = (let _119_1867 = (let _119_1866 = (let _119_1865 = (let _119_1864 = (FStar_ToSMT_Term.mk_and_l guards)
in (let _119_1863 = (FStar_ToSMT_Term.mkEq (def, body))
in (_119_1864, _119_1863)))
in (FStar_ToSMT_Term.mkImp _119_1865))
in ((def)::[], vars, _119_1866))
in (FStar_ToSMT_Term.mkForall _119_1867))
in (_119_1868, Some ("abbrev. elimination")))
in FStar_ToSMT_Term.Assume (_119_1869))
in (let kindingAx = (let _53_2299 = (let _119_1870 = (FStar_Tc_Recheck.recompute_kind t)
in (encode_knd _119_1870 env' app))
in (match (_53_2299) with
| (k, decls) -> begin
(let _119_1878 = (let _119_1877 = (let _119_1876 = (let _119_1875 = (let _119_1874 = (let _119_1873 = (let _119_1872 = (let _119_1871 = (FStar_ToSMT_Term.mk_and_l guards)
in (_119_1871, k))
in (FStar_ToSMT_Term.mkImp _119_1872))
in ((app)::[], vars, _119_1873))
in (FStar_ToSMT_Term.mkForall _119_1874))
in (_119_1875, Some ("abbrev. kinding")))
in FStar_ToSMT_Term.Assume (_119_1876))
in (_119_1877)::[])
in (FStar_List.append decls _119_1878))
end))
in (let g = (let _119_1879 = (primitive_type_axioms lid tname app)
in (FStar_List.append (FStar_List.append (FStar_List.append (FStar_List.append binder_decls decls) decls1) ((abbrev_def)::kindingAx)) _119_1879))
in (g, env))))
end))))))))
end))
end))
end))
end
| FStar_Absyn_Syntax.Sig_val_decl (lid, t, quals, _53_2306) -> begin
(match (((FStar_All.pipe_right quals (FStar_List.contains FStar_Absyn_Syntax.Assumption)) || env.tcenv.FStar_Tc_Env.is_iface)) with
| true -> begin
(encode_top_level_val env lid t quals)
end
| false -> begin
([], env)
end)
end
| FStar_Absyn_Syntax.Sig_assume (l, f, _53_2312, _53_2314) -> begin
(let _53_2319 = (encode_formula f env)
in (match (_53_2319) with
| (f, decls) -> begin
(let g = (let _119_1884 = (let _119_1883 = (let _119_1882 = (let _119_1881 = (let _119_1880 = (FStar_Absyn_Print.sli l)
in (FStar_Util.format1 "Assumption: %s" _119_1880))
in Some (_119_1881))
in (f, _119_1882))
in FStar_ToSMT_Term.Assume (_119_1883))
in (_119_1884)::[])
in ((FStar_List.append decls g), env))
end))
end
| FStar_Absyn_Syntax.Sig_tycon (t, tps, k, _53_2325, datas, quals, _53_2329) when (FStar_Absyn_Syntax.lid_equals t FStar_Absyn_Const.precedes_lid) -> begin
(let _53_2335 = (new_typ_constant_and_tok_from_lid env t)
in (match (_53_2335) with
| (tname, ttok, env) -> begin
([], env)
end))
end
| FStar_Absyn_Syntax.Sig_tycon (t, _53_2338, _53_2340, _53_2342, _53_2344, _53_2346, _53_2348) when ((FStar_Absyn_Syntax.lid_equals t FStar_Absyn_Const.char_lid) || (FStar_Absyn_Syntax.lid_equals t FStar_Absyn_Const.uint8_lid)) -> begin
(let tname = t.FStar_Absyn_Syntax.str
in (let tsym = (FStar_ToSMT_Term.mkFreeV (tname, FStar_ToSMT_Term.Type_sort))
in (let decl = FStar_ToSMT_Term.DeclFun ((tname, [], FStar_ToSMT_Term.Type_sort, None))
in (let _119_1886 = (let _119_1885 = (primitive_type_axioms t tname tsym)
in (decl)::_119_1885)
in (_119_1886, (push_free_tvar env t tname (Some (tsym))))))))
end
| FStar_Absyn_Syntax.Sig_tycon (t, tps, k, _53_2358, datas, quals, _53_2362) -> begin
(let is_logical = (FStar_All.pipe_right quals (FStar_Util.for_some (fun _53_19 -> (match (_53_19) with
| (FStar_Absyn_Syntax.Logic) | (FStar_Absyn_Syntax.Assumption) -> begin
true
end
| _53_2369 -> begin
false
end))))
in (let constructor_or_logic_type_decl = (fun c -> (match (is_logical) with
| true -> begin
(let _53_2379 = c
in (match (_53_2379) with
| (name, args, _53_2376, _53_2378) -> begin
(let _119_1892 = (let _119_1891 = (let _119_1890 = (FStar_All.pipe_right args (FStar_List.map Prims.snd))
in (name, _119_1890, FStar_ToSMT_Term.Type_sort, None))
in FStar_ToSMT_Term.DeclFun (_119_1891))
in (_119_1892)::[])
end))
end
| false -> begin
(FStar_ToSMT_Term.constructor_to_decl c)
end))
in (let inversion_axioms = (fun tapp vars -> (match ((((FStar_List.length datas) = 0) || (FStar_All.pipe_right datas (FStar_Util.for_some (fun l -> (let _119_1898 = (FStar_Tc_Env.lookup_qname env.tcenv l)
in (FStar_All.pipe_right _119_1898 FStar_Option.isNone))))))) with
| true -> begin
[]
end
| false -> begin
(let _53_2386 = (fresh_fvar "x" FStar_ToSMT_Term.Term_sort)
in (match (_53_2386) with
| (xxsym, xx) -> begin
(let _53_2429 = (FStar_All.pipe_right datas (FStar_List.fold_left (fun _53_2389 l -> (match (_53_2389) with
| (out, decls) -> begin
(let data_t = (FStar_Tc_Env.lookup_datacon env.tcenv l)
in (let _53_2399 = (match ((FStar_Absyn_Util.function_formals data_t)) with
| Some (formals, res) -> begin
(formals, (FStar_Absyn_Util.comp_result res))
end
| None -> begin
([], data_t)
end)
in (match (_53_2399) with
| (args, res) -> begin
(let indices = (match ((let _119_1901 = (FStar_Absyn_Util.compress_typ res)
in _119_1901.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Typ_app (_53_2401, indices) -> begin
indices
end
| _53_2406 -> begin
[]
end)
in (let env = (FStar_All.pipe_right args (FStar_List.fold_left (fun env a -> (match ((Prims.fst a)) with
| FStar_Util.Inl (a) -> begin
(let _119_1906 = (let _119_1905 = (let _119_1904 = (mk_typ_projector_name l a.FStar_Absyn_Syntax.v)
in (_119_1904, (xx)::[]))
in (FStar_ToSMT_Term.mkApp _119_1905))
in (push_typ_var env a.FStar_Absyn_Syntax.v _119_1906))
end
| FStar_Util.Inr (x) -> begin
(let _119_1909 = (let _119_1908 = (let _119_1907 = (mk_term_projector_name l x.FStar_Absyn_Syntax.v)
in (_119_1907, (xx)::[]))
in (FStar_ToSMT_Term.mkApp _119_1908))
in (push_term_var env x.FStar_Absyn_Syntax.v _119_1909))
end)) env))
in (let _53_2417 = (encode_args indices env)
in (match (_53_2417) with
| (indices, decls') -> begin
(let _53_2418 = (match (((FStar_List.length indices) <> (FStar_List.length vars))) with
| true -> begin
(FStar_All.failwith "Impossible")
end
| false -> begin
()
end)
in (let eqs = (let _119_1916 = (FStar_List.map2 (fun v a -> (match (a) with
| FStar_Util.Inl (a) -> begin
(let _119_1913 = (let _119_1912 = (FStar_ToSMT_Term.mkFreeV v)
in (_119_1912, a))
in (FStar_ToSMT_Term.mkEq _119_1913))
end
| FStar_Util.Inr (a) -> begin
(let _119_1915 = (let _119_1914 = (FStar_ToSMT_Term.mkFreeV v)
in (_119_1914, a))
in (FStar_ToSMT_Term.mkEq _119_1915))
end)) vars indices)
in (FStar_All.pipe_right _119_1916 FStar_ToSMT_Term.mk_and_l))
in (let _119_1921 = (let _119_1920 = (let _119_1919 = (let _119_1918 = (let _119_1917 = (mk_data_tester env l xx)
in (_119_1917, eqs))
in (FStar_ToSMT_Term.mkAnd _119_1918))
in (out, _119_1919))
in (FStar_ToSMT_Term.mkOr _119_1920))
in (_119_1921, (FStar_List.append decls decls')))))
end))))
end)))
end)) (FStar_ToSMT_Term.mkFalse, [])))
in (match (_53_2429) with
| (data_ax, decls) -> begin
(let _53_2432 = (fresh_fvar "f" FStar_ToSMT_Term.Fuel_sort)
in (match (_53_2432) with
| (ffsym, ff) -> begin
(let xx_has_type = (let _119_1922 = (FStar_ToSMT_Term.mkApp ("SFuel", (ff)::[]))
in (FStar_ToSMT_Term.mk_HasTypeFuel _119_1922 xx tapp))
in (let _119_1929 = (let _119_1928 = (let _119_1927 = (let _119_1926 = (let _119_1925 = (let _119_1924 = (add_fuel (ffsym, FStar_ToSMT_Term.Fuel_sort) (((xxsym, FStar_ToSMT_Term.Term_sort))::vars))
in (let _119_1923 = (FStar_ToSMT_Term.mkImp (xx_has_type, data_ax))
in ((xx_has_type)::[], _119_1924, _119_1923)))
in (FStar_ToSMT_Term.mkForall _119_1925))
in (_119_1926, Some ("inversion axiom")))
in FStar_ToSMT_Term.Assume (_119_1927))
in (_119_1928)::[])
in (FStar_List.append decls _119_1929)))
end))
end))
end))
end))
in (let k = (FStar_Absyn_Util.close_kind tps k)
in (let _53_2444 = (match ((let _119_1930 = (FStar_Absyn_Util.compress_kind k)
in _119_1930.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Kind_arrow (bs, res) -> begin
(true, bs, res)
end
| _53_2440 -> begin
(false, [], k)
end)
in (match (_53_2444) with
| (is_kind_arrow, formals, res) -> begin
(let _53_2451 = (encode_binders None formals env)
in (match (_53_2451) with
| (vars, guards, env', binder_decls, _53_2450) -> begin
(let projection_axioms = (fun tapp vars -> (match ((FStar_All.pipe_right quals (FStar_Util.find_opt (fun _53_20 -> (match (_53_20) with
| FStar_Absyn_Syntax.Projector (_53_2457) -> begin
true
end
| _53_2460 -> begin
false
end))))) with
| Some (FStar_Absyn_Syntax.Projector (d, FStar_Util.Inl (a))) -> begin
(let rec projectee = (fun i _53_21 -> (match (_53_21) with
| [] -> begin
i
end
| f::tl -> begin
(match ((Prims.fst f)) with
| FStar_Util.Inl (_53_2475) -> begin
(projectee (i + 1) tl)
end
| FStar_Util.Inr (x) -> begin
(match ((x.FStar_Absyn_Syntax.v.FStar_Absyn_Syntax.ppname.FStar_Absyn_Syntax.idText = "projectee")) with
| true -> begin
i
end
| false -> begin
(projectee (i + 1) tl)
end)
end)
end))
in (let projectee_pos = (projectee 0 formals)
in (let _53_2490 = (match ((FStar_Util.first_N projectee_pos vars)) with
| (_53_2481, xx::suffix) -> begin
(xx, suffix)
end
| _53_2487 -> begin
(FStar_All.failwith "impossible")
end)
in (match (_53_2490) with
| (xx, suffix) -> begin
(let dproj_app = (let _119_1944 = (let _119_1943 = (let _119_1942 = (mk_typ_projector_name d a)
in (let _119_1941 = (let _119_1940 = (FStar_ToSMT_Term.mkFreeV xx)
in (_119_1940)::[])
in (_119_1942, _119_1941)))
in (FStar_ToSMT_Term.mkApp _119_1943))
in (mk_ApplyT _119_1944 suffix))
in (let _119_1949 = (let _119_1948 = (let _119_1947 = (let _119_1946 = (let _119_1945 = (FStar_ToSMT_Term.mkEq (tapp, dproj_app))
in ((tapp)::[], vars, _119_1945))
in (FStar_ToSMT_Term.mkForall _119_1946))
in (_119_1947, Some ("projector axiom")))
in FStar_ToSMT_Term.Assume (_119_1948))
in (_119_1949)::[]))
end))))
end
| _53_2493 -> begin
[]
end))
in (let pretype_axioms = (fun tapp vars -> (let _53_2499 = (fresh_fvar "x" FStar_ToSMT_Term.Term_sort)
in (match (_53_2499) with
| (xxsym, xx) -> begin
(let _53_2502 = (fresh_fvar "f" FStar_ToSMT_Term.Fuel_sort)
in (match (_53_2502) with
| (ffsym, ff) -> begin
(let xx_has_type = (FStar_ToSMT_Term.mk_HasTypeFuel ff xx tapp)
in (let _119_1962 = (let _119_1961 = (let _119_1960 = (let _119_1959 = (let _119_1958 = (let _119_1957 = (let _119_1956 = (let _119_1955 = (let _119_1954 = (FStar_ToSMT_Term.mkApp ("PreType", (xx)::[]))
in (tapp, _119_1954))
in (FStar_ToSMT_Term.mkEq _119_1955))
in (xx_has_type, _119_1956))
in (FStar_ToSMT_Term.mkImp _119_1957))
in ((xx_has_type)::[], ((xxsym, FStar_ToSMT_Term.Term_sort))::((ffsym, FStar_ToSMT_Term.Fuel_sort))::vars, _119_1958))
in (FStar_ToSMT_Term.mkForall _119_1959))
in (_119_1960, Some ("pretyping")))
in FStar_ToSMT_Term.Assume (_119_1961))
in (_119_1962)::[]))
end))
end)))
in (let _53_2507 = (new_typ_constant_and_tok_from_lid env t)
in (match (_53_2507) with
| (tname, ttok, env) -> begin
(let ttok_tm = (FStar_ToSMT_Term.mkApp (ttok, []))
in (let guard = (FStar_ToSMT_Term.mk_and_l guards)
in (let tapp = (let _119_1964 = (let _119_1963 = (FStar_List.map FStar_ToSMT_Term.mkFreeV vars)
in (tname, _119_1963))
in (FStar_ToSMT_Term.mkApp _119_1964))
in (let _53_2532 = (let tname_decl = (let _119_1968 = (let _119_1967 = (FStar_All.pipe_right vars (FStar_List.map (fun _53_2513 -> (match (_53_2513) with
| (n, s) -> begin
((Prims.strcat tname n), s)
end))))
in (let _119_1966 = (varops.next_id ())
in (tname, _119_1967, FStar_ToSMT_Term.Type_sort, _119_1966)))
in (constructor_or_logic_type_decl _119_1968))
in (let _53_2529 = (match (vars) with
| [] -> begin
(let _119_1972 = (let _119_1971 = (let _119_1970 = (FStar_ToSMT_Term.mkApp (tname, []))
in (FStar_All.pipe_left (fun _119_1969 -> Some (_119_1969)) _119_1970))
in (push_free_tvar env t tname _119_1971))
in ([], _119_1972))
end
| _53_2517 -> begin
(let ttok_decl = FStar_ToSMT_Term.DeclFun ((ttok, [], FStar_ToSMT_Term.Type_sort, Some ("token")))
in (let ttok_fresh = (let _119_1973 = (varops.next_id ())
in (FStar_ToSMT_Term.fresh_token (ttok, FStar_ToSMT_Term.Type_sort) _119_1973))
in (let ttok_app = (mk_ApplyT ttok_tm vars)
in (let pats = (match (((not (is_logical)) && (FStar_All.pipe_right quals (FStar_Util.for_some (fun _53_22 -> (match (_53_22) with
| FStar_Absyn_Syntax.Opaque -> begin
true
end
| _53_2524 -> begin
false
end)))))) with
| true -> begin
((ttok_app)::[])::((tapp)::[])::[]
end
| false -> begin
((ttok_app)::[])::[]
end)
in (let name_tok_corr = (let _119_1978 = (let _119_1977 = (let _119_1976 = (let _119_1975 = (FStar_ToSMT_Term.mkEq (ttok_app, tapp))
in (pats, None, vars, _119_1975))
in (FStar_ToSMT_Term.mkForall' _119_1976))
in (_119_1977, Some ("name-token correspondence")))
in FStar_ToSMT_Term.Assume (_119_1978))
in ((ttok_decl)::(ttok_fresh)::(name_tok_corr)::[], env))))))
end)
in (match (_53_2529) with
| (tok_decls, env) -> begin
((FStar_List.append tname_decl tok_decls), env)
end)))
in (match (_53_2532) with
| (decls, env) -> begin
(let kindingAx = (let _53_2535 = (encode_knd res env' tapp)
in (match (_53_2535) with
| (k, decls) -> begin
(let karr = (match (is_kind_arrow) with
| true -> begin
(let _119_1982 = (let _119_1981 = (let _119_1980 = (let _119_1979 = (FStar_ToSMT_Term.mk_PreKind ttok_tm)
in (FStar_ToSMT_Term.mk_tester "Kind_arrow" _119_1979))
in (_119_1980, Some ("kinding")))
in FStar_ToSMT_Term.Assume (_119_1981))
in (_119_1982)::[])
end
| false -> begin
[]
end)
in (let _119_1988 = (let _119_1987 = (let _119_1986 = (let _119_1985 = (let _119_1984 = (let _119_1983 = (FStar_ToSMT_Term.mkImp (guard, k))
in ((tapp)::[], vars, _119_1983))
in (FStar_ToSMT_Term.mkForall _119_1984))
in (_119_1985, Some ("kinding")))
in FStar_ToSMT_Term.Assume (_119_1986))
in (_119_1987)::[])
in (FStar_List.append (FStar_List.append decls karr) _119_1988)))
end))
in (let aux = (match (is_logical) with
| true -> begin
(let _119_1989 = (projection_axioms tapp vars)
in (FStar_List.append kindingAx _119_1989))
end
| false -> begin
(let _119_1996 = (let _119_1994 = (let _119_1992 = (let _119_1990 = (primitive_type_axioms t tname tapp)
in (FStar_List.append kindingAx _119_1990))
in (let _119_1991 = (inversion_axioms tapp vars)
in (FStar_List.append _119_1992 _119_1991)))
in (let _119_1993 = (projection_axioms tapp vars)
in (FStar_List.append _119_1994 _119_1993)))
in (let _119_1995 = (pretype_axioms tapp vars)
in (FStar_List.append _119_1996 _119_1995)))
end)
in (let g = (FStar_List.append (FStar_List.append decls binder_decls) aux)
in (g, env))))
end)))))
end))))
end))
end))))))
end
| FStar_Absyn_Syntax.Sig_datacon (d, _53_2542, _53_2544, _53_2546, _53_2548, _53_2550) when (FStar_Absyn_Syntax.lid_equals d FStar_Absyn_Const.lexcons_lid) -> begin
([], env)
end
| FStar_Absyn_Syntax.Sig_datacon (d, t, (_53_2556, tps, _53_2559), quals, _53_2563, drange) -> begin
(let t = (let _119_1998 = (FStar_List.map (fun _53_2570 -> (match (_53_2570) with
| (x, _53_2569) -> begin
(x, Some (FStar_Absyn_Syntax.Implicit))
end)) tps)
in (FStar_Absyn_Util.close_typ _119_1998 t))
in (let _53_2575 = (new_term_constant_and_tok_from_lid env d)
in (match (_53_2575) with
| (ddconstrsym, ddtok, env) -> begin
(let ddtok_tm = (FStar_ToSMT_Term.mkApp (ddtok, []))
in (let _53_2584 = (match ((FStar_Absyn_Util.function_formals t)) with
| Some (f, c) -> begin
(f, (FStar_Absyn_Util.comp_result c))
end
| None -> begin
([], t)
end)
in (match (_53_2584) with
| (formals, t_res) -> begin
(let _53_2587 = (fresh_fvar "f" FStar_ToSMT_Term.Fuel_sort)
in (match (_53_2587) with
| (fuel_var, fuel_tm) -> begin
(let s_fuel_tm = (FStar_ToSMT_Term.mkApp ("SFuel", (fuel_tm)::[]))
in (let _53_2594 = (encode_binders (Some (fuel_tm)) formals env)
in (match (_53_2594) with
| (vars, guards, env', binder_decls, names) -> begin
(let projectors = (FStar_All.pipe_right names (FStar_List.map (fun _53_23 -> (match (_53_23) with
| FStar_Util.Inl (a) -> begin
(let _119_2000 = (mk_typ_projector_name d a)
in (_119_2000, FStar_ToSMT_Term.Type_sort))
end
| FStar_Util.Inr (x) -> begin
(let _119_2001 = (mk_term_projector_name d x)
in (_119_2001, FStar_ToSMT_Term.Term_sort))
end))))
in (let datacons = (let _119_2003 = (let _119_2002 = (varops.next_id ())
in (ddconstrsym, projectors, FStar_ToSMT_Term.Term_sort, _119_2002))
in (FStar_All.pipe_right _119_2003 FStar_ToSMT_Term.constructor_to_decl))
in (let app = (mk_ApplyE ddtok_tm vars)
in (let guard = (FStar_ToSMT_Term.mk_and_l guards)
in (let xvars = (FStar_List.map FStar_ToSMT_Term.mkFreeV vars)
in (let dapp = (FStar_ToSMT_Term.mkApp (ddconstrsym, xvars))
in (let _53_2608 = (encode_typ_pred None t env ddtok_tm)
in (match (_53_2608) with
| (tok_typing, decls3) -> begin
(let _53_2615 = (encode_binders (Some (fuel_tm)) formals env)
in (match (_53_2615) with
| (vars', guards', env'', decls_formals, _53_2614) -> begin
(let _53_2620 = (let xvars = (FStar_List.map FStar_ToSMT_Term.mkFreeV vars')
in (let dapp = (FStar_ToSMT_Term.mkApp (ddconstrsym, xvars))
in (encode_typ_pred (Some (fuel_tm)) t_res env'' dapp)))
in (match (_53_2620) with
| (ty_pred', decls_pred) -> begin
(let guard' = (FStar_ToSMT_Term.mk_and_l guards')
in (let proxy_fresh = (match (formals) with
| [] -> begin
[]
end
| _53_2624 -> begin
(let _119_2005 = (let _119_2004 = (varops.next_id ())
in (FStar_ToSMT_Term.fresh_token (ddtok, FStar_ToSMT_Term.Term_sort) _119_2004))
in (_119_2005)::[])
end)
in (let encode_elim = (fun _53_2627 -> (match (()) with
| () -> begin
(let _53_2630 = (FStar_Absyn_Util.head_and_args t_res)
in (match (_53_2630) with
| (head, args) -> begin
(match ((let _119_2008 = (FStar_Absyn_Util.compress_typ head)
in _119_2008.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Typ_const (fv) -> begin
(let encoded_head = (lookup_free_tvar_name env' fv)
in (let _53_2636 = (encode_args args env')
in (match (_53_2636) with
| (encoded_args, arg_decls) -> begin
(let _53_2660 = (FStar_List.fold_left (fun _53_2640 arg -> (match (_53_2640) with
| (env, arg_vars, eqns) -> begin
(match (arg) with
| FStar_Util.Inl (targ) -> begin
(let _53_2648 = (let _119_2011 = (FStar_Absyn_Util.new_bvd None)
in (gen_typ_var env _119_2011))
in (match (_53_2648) with
| (_53_2645, tv, env) -> begin
(let _119_2013 = (let _119_2012 = (FStar_ToSMT_Term.mkEq (targ, tv))
in (_119_2012)::eqns)
in (env, (tv)::arg_vars, _119_2013))
end))
end
| FStar_Util.Inr (varg) -> begin
(let _53_2655 = (let _119_2014 = (FStar_Absyn_Util.new_bvd None)
in (gen_term_var env _119_2014))
in (match (_53_2655) with
| (_53_2652, xv, env) -> begin
(let _119_2016 = (let _119_2015 = (FStar_ToSMT_Term.mkEq (varg, xv))
in (_119_2015)::eqns)
in (env, (xv)::arg_vars, _119_2016))
end))
end)
end)) (env', [], []) encoded_args)
in (match (_53_2660) with
| (_53_2657, arg_vars, eqns) -> begin
(let arg_vars = (FStar_List.rev arg_vars)
in (let ty = (FStar_ToSMT_Term.mkApp (encoded_head, arg_vars))
in (let xvars = (FStar_List.map FStar_ToSMT_Term.mkFreeV vars)
in (let dapp = (FStar_ToSMT_Term.mkApp (ddconstrsym, xvars))
in (let ty_pred = (FStar_ToSMT_Term.mk_HasTypeWithFuel (Some (s_fuel_tm)) dapp ty)
in (let arg_binders = (FStar_List.map FStar_ToSMT_Term.fv_of_term arg_vars)
in (let typing_inversion = (let _119_2023 = (let _119_2022 = (let _119_2021 = (let _119_2020 = (add_fuel (fuel_var, FStar_ToSMT_Term.Fuel_sort) (FStar_List.append vars arg_binders))
in (let _119_2019 = (let _119_2018 = (let _119_2017 = (FStar_ToSMT_Term.mk_and_l (FStar_List.append eqns guards))
in (ty_pred, _119_2017))
in (FStar_ToSMT_Term.mkImp _119_2018))
in ((ty_pred)::[], _119_2020, _119_2019)))
in (FStar_ToSMT_Term.mkForall _119_2021))
in (_119_2022, Some ("data constructor typing elim")))
in FStar_ToSMT_Term.Assume (_119_2023))
in (let subterm_ordering = (match ((FStar_Absyn_Syntax.lid_equals d FStar_Absyn_Const.lextop_lid)) with
| true -> begin
(let x = (let _119_2024 = (varops.fresh "x")
in (_119_2024, FStar_ToSMT_Term.Term_sort))
in (let xtm = (FStar_ToSMT_Term.mkFreeV x)
in (let _119_2033 = (let _119_2032 = (let _119_2031 = (let _119_2030 = (let _119_2025 = (FStar_ToSMT_Term.mk_Precedes xtm dapp)
in (_119_2025)::[])
in (let _119_2029 = (let _119_2028 = (let _119_2027 = (FStar_ToSMT_Term.mk_tester "LexCons" xtm)
in (let _119_2026 = (FStar_ToSMT_Term.mk_Precedes xtm dapp)
in (_119_2027, _119_2026)))
in (FStar_ToSMT_Term.mkImp _119_2028))
in (_119_2030, (x)::[], _119_2029)))
in (FStar_ToSMT_Term.mkForall _119_2031))
in (_119_2032, Some ("lextop is top")))
in FStar_ToSMT_Term.Assume (_119_2033))))
end
| false -> begin
(let prec = (FStar_All.pipe_right vars (FStar_List.collect (fun v -> (match ((Prims.snd v)) with
| (FStar_ToSMT_Term.Type_sort) | (FStar_ToSMT_Term.Fuel_sort) -> begin
[]
end
| FStar_ToSMT_Term.Term_sort -> begin
(let _119_2036 = (let _119_2035 = (FStar_ToSMT_Term.mkFreeV v)
in (FStar_ToSMT_Term.mk_Precedes _119_2035 dapp))
in (_119_2036)::[])
end
| _53_2675 -> begin
(FStar_All.failwith "unexpected sort")
end))))
in (let _119_2043 = (let _119_2042 = (let _119_2041 = (let _119_2040 = (add_fuel (fuel_var, FStar_ToSMT_Term.Fuel_sort) (FStar_List.append vars arg_binders))
in (let _119_2039 = (let _119_2038 = (let _119_2037 = (FStar_ToSMT_Term.mk_and_l prec)
in (ty_pred, _119_2037))
in (FStar_ToSMT_Term.mkImp _119_2038))
in ((ty_pred)::[], _119_2040, _119_2039)))
in (FStar_ToSMT_Term.mkForall _119_2041))
in (_119_2042, Some ("subterm ordering")))
in FStar_ToSMT_Term.Assume (_119_2043)))
end)
in (arg_decls, (typing_inversion)::(subterm_ordering)::[])))))))))
end))
end)))
end
| _53_2679 -> begin
(let _53_2680 = (let _119_2046 = (let _119_2045 = (FStar_Absyn_Print.sli d)
in (let _119_2044 = (FStar_Absyn_Print.typ_to_string head)
in (FStar_Util.format2 "Constructor %s builds an unexpected type %s\n" _119_2045 _119_2044)))
in (FStar_Tc_Errors.warn drange _119_2046))
in ([], []))
end)
end))
end))
in (let _53_2684 = (encode_elim ())
in (match (_53_2684) with
| (decls2, elim) -> begin
(let g = (let _119_2071 = (let _119_2070 = (let _119_2055 = (let _119_2054 = (let _119_2053 = (let _119_2052 = (let _119_2051 = (let _119_2050 = (let _119_2049 = (let _119_2048 = (let _119_2047 = (FStar_Absyn_Print.sli d)
in (FStar_Util.format1 "data constructor proxy: %s" _119_2047))
in Some (_119_2048))
in (ddtok, [], FStar_ToSMT_Term.Term_sort, _119_2049))
in FStar_ToSMT_Term.DeclFun (_119_2050))
in (_119_2051)::[])
in (FStar_List.append (FStar_List.append (FStar_List.append binder_decls decls2) decls3) _119_2052))
in (FStar_List.append _119_2053 proxy_fresh))
in (FStar_List.append _119_2054 decls_formals))
in (FStar_List.append _119_2055 decls_pred))
in (let _119_2069 = (let _119_2068 = (let _119_2067 = (let _119_2059 = (let _119_2058 = (let _119_2057 = (let _119_2056 = (FStar_ToSMT_Term.mkEq (app, dapp))
in ((app)::[], vars, _119_2056))
in (FStar_ToSMT_Term.mkForall _119_2057))
in (_119_2058, Some ("equality for proxy")))
in FStar_ToSMT_Term.Assume (_119_2059))
in (let _119_2066 = (let _119_2065 = (let _119_2064 = (let _119_2063 = (let _119_2062 = (let _119_2061 = (add_fuel (fuel_var, FStar_ToSMT_Term.Fuel_sort) vars')
in (let _119_2060 = (FStar_ToSMT_Term.mkImp (guard', ty_pred'))
in ((ty_pred')::[], _119_2061, _119_2060)))
in (FStar_ToSMT_Term.mkForall _119_2062))
in (_119_2063, Some ("data constructor typing intro")))
in FStar_ToSMT_Term.Assume (_119_2064))
in (_119_2065)::[])
in (_119_2067)::_119_2066))
in (FStar_ToSMT_Term.Assume ((tok_typing, Some ("typing for data constructor proxy"))))::_119_2068)
in (FStar_List.append _119_2070 _119_2069)))
in (FStar_List.append _119_2071 elim))
in ((FStar_List.append datacons g), env))
end)))))
end))
end))
end))))))))
end)))
end))
end)))
end)))
end
| FStar_Absyn_Syntax.Sig_bundle (ses, _53_2688, _53_2690, _53_2692) -> begin
(let _53_2697 = (encode_signature env ses)
in (match (_53_2697) with
| (g, env) -> begin
(let _53_2709 = (FStar_All.pipe_right g (FStar_List.partition (fun _53_24 -> (match (_53_24) with
| FStar_ToSMT_Term.Assume (_53_2700, Some ("inversion axiom")) -> begin
false
end
| _53_2706 -> begin
true
end))))
in (match (_53_2709) with
| (g', inversions) -> begin
(let _53_2718 = (FStar_All.pipe_right g' (FStar_List.partition (fun _53_25 -> (match (_53_25) with
| FStar_ToSMT_Term.DeclFun (_53_2712) -> begin
true
end
| _53_2715 -> begin
false
end))))
in (match (_53_2718) with
| (decls, rest) -> begin
((FStar_List.append (FStar_List.append decls rest) inversions), env)
end))
end))
end))
end
| FStar_Absyn_Syntax.Sig_let (_53_2720, _53_2722, _53_2724, quals) when (FStar_All.pipe_right quals (FStar_Util.for_some (fun _53_26 -> (match (_53_26) with
| (FStar_Absyn_Syntax.Projector (_)) | (FStar_Absyn_Syntax.Discriminator (_)) -> begin
true
end
| _53_2736 -> begin
false
end)))) -> begin
([], env)
end
| FStar_Absyn_Syntax.Sig_let ((is_rec, bindings), _53_2741, _53_2743, quals) -> begin
(let eta_expand = (fun binders formals body t -> (let nbinders = (FStar_List.length binders)
in (let _53_2755 = (FStar_Util.first_N nbinders formals)
in (match (_53_2755) with
| (formals, extra_formals) -> begin
(let subst = (FStar_List.map2 (fun formal binder -> (match (((Prims.fst formal), (Prims.fst binder))) with
| (FStar_Util.Inl (a), FStar_Util.Inl (b)) -> begin
(let _119_2086 = (let _119_2085 = (FStar_Absyn_Util.btvar_to_typ b)
in (a.FStar_Absyn_Syntax.v, _119_2085))
in FStar_Util.Inl (_119_2086))
end
| (FStar_Util.Inr (x), FStar_Util.Inr (y)) -> begin
(let _119_2088 = (let _119_2087 = (FStar_Absyn_Util.bvar_to_exp y)
in (x.FStar_Absyn_Syntax.v, _119_2087))
in FStar_Util.Inr (_119_2088))
end
| _53_2769 -> begin
(FStar_All.failwith "Impossible")
end)) formals binders)
in (let extra_formals = (let _119_2089 = (FStar_Absyn_Util.subst_binders subst extra_formals)
in (FStar_All.pipe_right _119_2089 FStar_Absyn_Util.name_binders))
in (let body = (let _119_2095 = (let _119_2091 = (let _119_2090 = (FStar_Absyn_Util.args_of_binders extra_formals)
in (FStar_All.pipe_left Prims.snd _119_2090))
in (body, _119_2091))
in (let _119_2094 = (let _119_2093 = (FStar_Absyn_Util.subst_typ subst t)
in (FStar_All.pipe_left (fun _119_2092 -> Some (_119_2092)) _119_2093))
in (FStar_Absyn_Syntax.mk_Exp_app_flat _119_2095 _119_2094 body.FStar_Absyn_Syntax.pos)))
in ((FStar_List.append binders extra_formals), body))))
end))))
in (let destruct_bound_function = (fun flid t_norm e -> (match (e.FStar_Absyn_Syntax.n) with
| (FStar_Absyn_Syntax.Exp_ascribed ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Exp_abs (binders, body); FStar_Absyn_Syntax.tk = _; FStar_Absyn_Syntax.pos = _; FStar_Absyn_Syntax.fvs = _; FStar_Absyn_Syntax.uvs = _}, _, _)) | (FStar_Absyn_Syntax.Exp_abs (binders, body)) -> begin
(match (t_norm.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_fun (formals, c) -> begin
(let nformals = (FStar_List.length formals)
in (let nbinders = (FStar_List.length binders)
in (let tres = (FStar_Absyn_Util.comp_result c)
in (match (((nformals < nbinders) && (FStar_Absyn_Util.is_total_comp c))) with
| true -> begin
(let _53_2807 = (FStar_Util.first_N nformals binders)
in (match (_53_2807) with
| (bs0, rest) -> begin
(let tres = (match ((FStar_Absyn_Util.mk_subst_binder bs0 formals)) with
| Some (s) -> begin
(FStar_Absyn_Util.subst_typ s tres)
end
| _53_2811 -> begin
(FStar_All.failwith "impossible")
end)
in (let body = (FStar_Absyn_Syntax.mk_Exp_abs (rest, body) (Some (tres)) body.FStar_Absyn_Syntax.pos)
in (bs0, body, bs0, tres)))
end))
end
| false -> begin
(match ((nformals > nbinders)) with
| true -> begin
(let _53_2816 = (eta_expand binders formals body tres)
in (match (_53_2816) with
| (binders, body) -> begin
(binders, body, formals, tres)
end))
end
| false -> begin
(binders, body, formals, tres)
end)
end))))
end
| _53_2818 -> begin
(let _119_2104 = (let _119_2103 = (FStar_Absyn_Print.exp_to_string e)
in (let _119_2102 = (FStar_Absyn_Print.typ_to_string t_norm)
in (FStar_Util.format3 "Impossible! let-bound lambda %s = %s has a type that\'s not a function: %s\n" flid.FStar_Absyn_Syntax.str _119_2103 _119_2102)))
in (FStar_All.failwith _119_2104))
end)
end
| _53_2820 -> begin
(match (t_norm.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_fun (formals, c) -> begin
(let tres = (FStar_Absyn_Util.comp_result c)
in (let _53_2828 = (eta_expand [] formals e tres)
in (match (_53_2828) with
| (binders, body) -> begin
(binders, body, formals, tres)
end)))
end
| _53_2830 -> begin
([], e, [], t_norm)
end)
end))
in (FStar_All.try_with (fun _53_2832 -> (match (()) with
| () -> begin
(match (((FStar_All.pipe_right quals (FStar_Util.for_some (fun _53_27 -> (match (_53_27) with
| FStar_Absyn_Syntax.Opaque -> begin
true
end
| _53_2843 -> begin
false
end)))) || (FStar_All.pipe_right bindings (FStar_Util.for_all (fun lb -> (FStar_Absyn_Util.is_smt_lemma lb.FStar_Absyn_Syntax.lbtyp)))))) with
| true -> begin
(encode_top_level_vals env bindings quals)
end
| false -> begin
(let _53_2862 = (FStar_All.pipe_right bindings (FStar_List.fold_left (fun _53_2849 lb -> (match (_53_2849) with
| (toks, typs, decls, env) -> begin
(let _53_2851 = (match ((FStar_Absyn_Util.is_smt_lemma lb.FStar_Absyn_Syntax.lbtyp)) with
| true -> begin
(Prims.raise Let_rec_unencodeable)
end
| false -> begin
()
end)
in (let t_norm = (let _119_2110 = (whnf env lb.FStar_Absyn_Syntax.lbtyp)
in (FStar_All.pipe_right _119_2110 FStar_Absyn_Util.compress_typ))
in (let _53_2857 = (let _119_2111 = (FStar_Util.right lb.FStar_Absyn_Syntax.lbname)
in (declare_top_level_let env _119_2111 lb.FStar_Absyn_Syntax.lbtyp t_norm))
in (match (_53_2857) with
| (tok, decl, env) -> begin
(let _119_2114 = (let _119_2113 = (let _119_2112 = (FStar_Util.right lb.FStar_Absyn_Syntax.lbname)
in (_119_2112, tok))
in (_119_2113)::toks)
in (_119_2114, (t_norm)::typs, (decl)::decls, env))
end))))
end)) ([], [], [], env)))
in (match (_53_2862) with
| (toks, typs, decls, env) -> begin
(let toks = (FStar_List.rev toks)
in (let decls = (FStar_All.pipe_right (FStar_List.rev decls) FStar_List.flatten)
in (let typs = (FStar_List.rev typs)
in (match (((FStar_All.pipe_right quals (FStar_Util.for_some (fun _53_28 -> (match (_53_28) with
| FStar_Absyn_Syntax.HasMaskedEffect -> begin
true
end
| _53_2869 -> begin
false
end)))) || (FStar_All.pipe_right typs (FStar_Util.for_some (fun t -> ((FStar_Absyn_Util.is_lemma t) || (let _119_2117 = (FStar_Absyn_Util.is_pure_or_ghost_function t)
in (FStar_All.pipe_left Prims.op_Negation _119_2117)))))))) with
| true -> begin
(decls, env)
end
| false -> begin
(match ((not (is_rec))) with
| true -> begin
(match ((bindings, typs, toks)) with
| ({FStar_Absyn_Syntax.lbname = _53_2877; FStar_Absyn_Syntax.lbtyp = _53_2875; FStar_Absyn_Syntax.lbeff = _53_2873; FStar_Absyn_Syntax.lbdef = e}::[], t_norm::[], (flid, (f, ftok))::[]) -> begin
(let _53_2893 = (destruct_bound_function flid t_norm e)
in (match (_53_2893) with
| (binders, body, formals, tres) -> begin
(let _53_2900 = (encode_binders None binders env)
in (match (_53_2900) with
| (vars, guards, env', binder_decls, _53_2899) -> begin
(let app = (match (vars) with
| [] -> begin
(FStar_ToSMT_Term.mkFreeV (f, FStar_ToSMT_Term.Term_sort))
end
| _53_2903 -> begin
(let _119_2119 = (let _119_2118 = (FStar_List.map FStar_ToSMT_Term.mkFreeV vars)
in (f, _119_2118))
in (FStar_ToSMT_Term.mkApp _119_2119))
end)
in (let _53_2907 = (encode_exp body env')
in (match (_53_2907) with
| (body, decls2) -> begin
(let eqn = (let _119_2128 = (let _119_2127 = (let _119_2124 = (let _119_2123 = (let _119_2122 = (let _119_2121 = (FStar_ToSMT_Term.mk_and_l guards)
in (let _119_2120 = (FStar_ToSMT_Term.mkEq (app, body))
in (_119_2121, _119_2120)))
in (FStar_ToSMT_Term.mkImp _119_2122))
in ((app)::[], vars, _119_2123))
in (FStar_ToSMT_Term.mkForall _119_2124))
in (let _119_2126 = (let _119_2125 = (FStar_Util.format1 "Equation for %s" flid.FStar_Absyn_Syntax.str)
in Some (_119_2125))
in (_119_2127, _119_2126)))
in FStar_ToSMT_Term.Assume (_119_2128))
in ((FStar_List.append (FStar_List.append (FStar_List.append decls binder_decls) decls2) ((eqn)::[])), env))
end)))
end))
end))
end
| _53_2910 -> begin
(FStar_All.failwith "Impossible")
end)
end
| false -> begin
(let fuel = (let _119_2129 = (varops.fresh "fuel")
in (_119_2129, FStar_ToSMT_Term.Fuel_sort))
in (let fuel_tm = (FStar_ToSMT_Term.mkFreeV fuel)
in (let env0 = env
in (let _53_2927 = (FStar_All.pipe_right toks (FStar_List.fold_left (fun _53_2916 _53_2921 -> (match ((_53_2916, _53_2921)) with
| ((gtoks, env), (flid, (f, ftok))) -> begin
(let g = (varops.new_fvar flid)
in (let gtok = (varops.new_fvar flid)
in (let env = (let _119_2134 = (let _119_2133 = (FStar_ToSMT_Term.mkApp (g, (fuel_tm)::[]))
in (FStar_All.pipe_left (fun _119_2132 -> Some (_119_2132)) _119_2133))
in (push_free_var env flid gtok _119_2134))
in (((flid, f, ftok, g, gtok))::gtoks, env))))
end)) ([], env)))
in (match (_53_2927) with
| (gtoks, env) -> begin
(let gtoks = (FStar_List.rev gtoks)
in (let encode_one_binding = (fun env0 _53_2936 t_norm _53_2945 -> (match ((_53_2936, _53_2945)) with
| ((flid, f, ftok, g, gtok), {FStar_Absyn_Syntax.lbname = _53_2944; FStar_Absyn_Syntax.lbtyp = _53_2942; FStar_Absyn_Syntax.lbeff = _53_2940; FStar_Absyn_Syntax.lbdef = e}) -> begin
(let _53_2950 = (destruct_bound_function flid t_norm e)
in (match (_53_2950) with
| (binders, body, formals, tres) -> begin
(let _53_2957 = (encode_binders None binders env)
in (match (_53_2957) with
| (vars, guards, env', binder_decls, _53_2956) -> begin
(let decl_g = (let _119_2145 = (let _119_2144 = (let _119_2143 = (FStar_List.map Prims.snd vars)
in (FStar_ToSMT_Term.Fuel_sort)::_119_2143)
in (g, _119_2144, FStar_ToSMT_Term.Term_sort, Some ("Fuel-instrumented function name")))
in FStar_ToSMT_Term.DeclFun (_119_2145))
in (let env0 = (push_zfuel_name env0 flid g)
in (let decl_g_tok = FStar_ToSMT_Term.DeclFun ((gtok, [], FStar_ToSMT_Term.Term_sort, Some ("Token for fuel-instrumented partial applications")))
in (let vars_tm = (FStar_List.map FStar_ToSMT_Term.mkFreeV vars)
in (let app = (FStar_ToSMT_Term.mkApp (f, vars_tm))
in (let gsapp = (let _119_2148 = (let _119_2147 = (let _119_2146 = (FStar_ToSMT_Term.mkApp ("SFuel", (fuel_tm)::[]))
in (_119_2146)::vars_tm)
in (g, _119_2147))
in (FStar_ToSMT_Term.mkApp _119_2148))
in (let gmax = (let _119_2151 = (let _119_2150 = (let _119_2149 = (FStar_ToSMT_Term.mkApp ("MaxFuel", []))
in (_119_2149)::vars_tm)
in (g, _119_2150))
in (FStar_ToSMT_Term.mkApp _119_2151))
in (let _53_2967 = (encode_exp body env')
in (match (_53_2967) with
| (body_tm, decls2) -> begin
(let eqn_g = (let _119_2160 = (let _119_2159 = (let _119_2156 = (let _119_2155 = (let _119_2154 = (let _119_2153 = (FStar_ToSMT_Term.mk_and_l guards)
in (let _119_2152 = (FStar_ToSMT_Term.mkEq (gsapp, body_tm))
in (_119_2153, _119_2152)))
in (FStar_ToSMT_Term.mkImp _119_2154))
in ((gsapp)::[], (fuel)::vars, _119_2155))
in (FStar_ToSMT_Term.mkForall _119_2156))
in (let _119_2158 = (let _119_2157 = (FStar_Util.format1 "Equation for fuel-instrumented recursive function: %s" flid.FStar_Absyn_Syntax.str)
in Some (_119_2157))
in (_119_2159, _119_2158)))
in FStar_ToSMT_Term.Assume (_119_2160))
in (let eqn_f = (let _119_2164 = (let _119_2163 = (let _119_2162 = (let _119_2161 = (FStar_ToSMT_Term.mkEq (app, gmax))
in ((app)::[], vars, _119_2161))
in (FStar_ToSMT_Term.mkForall _119_2162))
in (_119_2163, Some ("Correspondence of recursive function to instrumented version")))
in FStar_ToSMT_Term.Assume (_119_2164))
in (let eqn_g' = (let _119_2173 = (let _119_2172 = (let _119_2171 = (let _119_2170 = (let _119_2169 = (let _119_2168 = (let _119_2167 = (let _119_2166 = (let _119_2165 = (FStar_ToSMT_Term.n_fuel 0)
in (_119_2165)::vars_tm)
in (g, _119_2166))
in (FStar_ToSMT_Term.mkApp _119_2167))
in (gsapp, _119_2168))
in (FStar_ToSMT_Term.mkEq _119_2169))
in ((gsapp)::[], (fuel)::vars, _119_2170))
in (FStar_ToSMT_Term.mkForall _119_2171))
in (_119_2172, Some ("Fuel irrelevance")))
in FStar_ToSMT_Term.Assume (_119_2173))
in (let _53_2990 = (let _53_2977 = (encode_binders None formals env0)
in (match (_53_2977) with
| (vars, v_guards, env, binder_decls, _53_2976) -> begin
(let vars_tm = (FStar_List.map FStar_ToSMT_Term.mkFreeV vars)
in (let gapp = (FStar_ToSMT_Term.mkApp (g, (fuel_tm)::vars_tm))
in (let tok_corr = (let tok_app = (let _119_2174 = (FStar_ToSMT_Term.mkFreeV (gtok, FStar_ToSMT_Term.Term_sort))
in (mk_ApplyE _119_2174 ((fuel)::vars)))
in (let _119_2178 = (let _119_2177 = (let _119_2176 = (let _119_2175 = (FStar_ToSMT_Term.mkEq (tok_app, gapp))
in ((tok_app)::[], (fuel)::vars, _119_2175))
in (FStar_ToSMT_Term.mkForall _119_2176))
in (_119_2177, Some ("Fuel token correspondence")))
in FStar_ToSMT_Term.Assume (_119_2178)))
in (let _53_2987 = (let _53_2984 = (encode_typ_pred None tres env gapp)
in (match (_53_2984) with
| (g_typing, d3) -> begin
(let _119_2186 = (let _119_2185 = (let _119_2184 = (let _119_2183 = (let _119_2182 = (let _119_2181 = (let _119_2180 = (let _119_2179 = (FStar_ToSMT_Term.mk_and_l v_guards)
in (_119_2179, g_typing))
in (FStar_ToSMT_Term.mkImp _119_2180))
in ((gapp)::[], (fuel)::vars, _119_2181))
in (FStar_ToSMT_Term.mkForall _119_2182))
in (_119_2183, None))
in FStar_ToSMT_Term.Assume (_119_2184))
in (_119_2185)::[])
in (d3, _119_2186))
end))
in (match (_53_2987) with
| (aux_decls, typing_corr) -> begin
((FStar_List.append binder_decls aux_decls), (FStar_List.append typing_corr ((tok_corr)::[])))
end)))))
end))
in (match (_53_2990) with
| (aux_decls, g_typing) -> begin
((FStar_List.append (FStar_List.append (FStar_List.append binder_decls decls2) aux_decls) ((decl_g)::(decl_g_tok)::[])), (FStar_List.append ((eqn_g)::(eqn_g')::(eqn_f)::[]) g_typing), env0)
end)))))
end)))))))))
end))
end))
end))
in (let _53_3006 = (let _119_2189 = (FStar_List.zip3 gtoks typs bindings)
in (FStar_List.fold_left (fun _53_2994 _53_2998 -> (match ((_53_2994, _53_2998)) with
| ((decls, eqns, env0), (gtok, ty, bs)) -> begin
(let _53_3002 = (encode_one_binding env0 gtok ty bs)
in (match (_53_3002) with
| (decls', eqns', env0) -> begin
((decls')::decls, (FStar_List.append eqns' eqns), env0)
end))
end)) ((decls)::[], [], env0) _119_2189))
in (match (_53_3006) with
| (decls, eqns, env0) -> begin
(let _53_3015 = (let _119_2191 = (FStar_All.pipe_right decls FStar_List.flatten)
in (FStar_All.pipe_right _119_2191 (FStar_List.partition (fun _53_29 -> (match (_53_29) with
| FStar_ToSMT_Term.DeclFun (_53_3009) -> begin
true
end
| _53_3012 -> begin
false
end)))))
in (match (_53_3015) with
| (prefix_decls, rest) -> begin
(let eqns = (FStar_List.rev eqns)
in ((FStar_List.append (FStar_List.append prefix_decls rest) eqns), env0))
end))
end))))
end)))))
end)
end))))
end))
end)
end)) (fun _53_2831 -> (match (_53_2831) with
| Let_rec_unencodeable -> begin
(let msg = (let _119_2194 = (FStar_All.pipe_right bindings (FStar_List.map (fun lb -> (FStar_Absyn_Print.lbname_to_string lb.FStar_Absyn_Syntax.lbname))))
in (FStar_All.pipe_right _119_2194 (FStar_String.concat " and ")))
in (let decl = FStar_ToSMT_Term.Caption ((Prims.strcat "let rec unencodeable: Skipping: " msg))
in ((decl)::[], env)))
end)))))
end
| (FStar_Absyn_Syntax.Sig_pragma (_)) | (FStar_Absyn_Syntax.Sig_main (_)) | (FStar_Absyn_Syntax.Sig_new_effect (_)) | (FStar_Absyn_Syntax.Sig_effect_abbrev (_)) | (FStar_Absyn_Syntax.Sig_kind_abbrev (_)) | (FStar_Absyn_Syntax.Sig_sub_effect (_)) -> begin
([], env)
end)))))
and declare_top_level_let = (fun env x t t_norm -> (match ((try_lookup_lid env x)) with
| None -> begin
(let _53_3042 = (encode_free_var env x t t_norm [])
in (match (_53_3042) with
| (decls, env) -> begin
(let _53_3047 = (lookup_lid env x)
in (match (_53_3047) with
| (n, x', _53_3046) -> begin
((n, x'), decls, env)
end))
end))
end
| Some (n, x, _53_3051) -> begin
((n, x), [], env)
end))
and encode_smt_lemma = (fun env lid t -> (let _53_3059 = (encode_function_type_as_formula None None t env)
in (match (_53_3059) with
| (form, decls) -> begin
(FStar_List.append decls ((FStar_ToSMT_Term.Assume ((form, Some ((Prims.strcat "Lemma: " lid.FStar_Absyn_Syntax.str)))))::[]))
end)))
and encode_free_var = (fun env lid tt t_norm quals -> (match (((let _119_2207 = (FStar_Absyn_Util.is_pure_or_ghost_function t_norm)
in (FStar_All.pipe_left Prims.op_Negation _119_2207)) || (FStar_Absyn_Util.is_lemma t_norm))) with
| true -> begin
(let _53_3068 = (new_term_constant_and_tok_from_lid env lid)
in (match (_53_3068) with
| (vname, vtok, env) -> begin
(let arg_sorts = (match (t_norm.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_fun (binders, _53_3071) -> begin
(FStar_All.pipe_right binders (FStar_List.map (fun _53_30 -> (match (_53_30) with
| (FStar_Util.Inl (_53_3076), _53_3079) -> begin
FStar_ToSMT_Term.Type_sort
end
| _53_3082 -> begin
FStar_ToSMT_Term.Term_sort
end))))
end
| _53_3084 -> begin
[]
end)
in (let d = FStar_ToSMT_Term.DeclFun ((vname, arg_sorts, FStar_ToSMT_Term.Term_sort, Some ("Uninterpreted function symbol for impure function")))
in (let dd = FStar_ToSMT_Term.DeclFun ((vtok, [], FStar_ToSMT_Term.Term_sort, Some ("Uninterpreted name for impure function")))
in ((d)::(dd)::[], env))))
end))
end
| false -> begin
(match ((prims.is lid)) with
| true -> begin
(let vname = (varops.new_fvar lid)
in (let definition = (prims.mk lid vname)
in (let env = (push_free_var env lid vname None)
in (definition, env))))
end
| false -> begin
(let encode_non_total_function_typ = (lid.FStar_Absyn_Syntax.nsstr <> "Prims")
in (let _53_3101 = (match ((FStar_Absyn_Util.function_formals t_norm)) with
| Some (args, comp) -> begin
(match (encode_non_total_function_typ) with
| true -> begin
(let _119_2209 = (FStar_Tc_Util.pure_or_ghost_pre_and_post env.tcenv comp)
in (args, _119_2209))
end
| false -> begin
(args, (None, (FStar_Absyn_Util.comp_result comp)))
end)
end
| None -> begin
([], (None, t_norm))
end)
in (match (_53_3101) with
| (formals, (pre_opt, res_t)) -> begin
(let _53_3105 = (new_term_constant_and_tok_from_lid env lid)
in (match (_53_3105) with
| (vname, vtok, env) -> begin
(let vtok_tm = (match (formals) with
| [] -> begin
(FStar_ToSMT_Term.mkFreeV (vname, FStar_ToSMT_Term.Term_sort))
end
| _53_3108 -> begin
(FStar_ToSMT_Term.mkApp (vtok, []))
end)
in (let mk_disc_proj_axioms = (fun guard encoded_res_t vapp vars -> (FStar_All.pipe_right quals (FStar_List.collect (fun _53_31 -> (match (_53_31) with
| FStar_Absyn_Syntax.Discriminator (d) -> begin
(let _53_3124 = (FStar_Util.prefix vars)
in (match (_53_3124) with
| (_53_3119, (xxsym, _53_3122)) -> begin
(let xx = (FStar_ToSMT_Term.mkFreeV (xxsym, FStar_ToSMT_Term.Term_sort))
in (let _119_2226 = (let _119_2225 = (let _119_2224 = (let _119_2223 = (let _119_2222 = (let _119_2221 = (let _119_2220 = (let _119_2219 = (FStar_ToSMT_Term.mk_tester (escape d.FStar_Absyn_Syntax.str) xx)
in (FStar_All.pipe_left FStar_ToSMT_Term.boxBool _119_2219))
in (vapp, _119_2220))
in (FStar_ToSMT_Term.mkEq _119_2221))
in ((vapp)::[], vars, _119_2222))
in (FStar_ToSMT_Term.mkForall _119_2223))
in (_119_2224, Some ("Discriminator equation")))
in FStar_ToSMT_Term.Assume (_119_2225))
in (_119_2226)::[]))
end))
end
| FStar_Absyn_Syntax.Projector (d, FStar_Util.Inr (f)) -> begin
(let _53_3137 = (FStar_Util.prefix vars)
in (match (_53_3137) with
| (_53_3132, (xxsym, _53_3135)) -> begin
(let xx = (FStar_ToSMT_Term.mkFreeV (xxsym, FStar_ToSMT_Term.Term_sort))
in (let prim_app = (let _119_2228 = (let _119_2227 = (mk_term_projector_name d f)
in (_119_2227, (xx)::[]))
in (FStar_ToSMT_Term.mkApp _119_2228))
in (let _119_2233 = (let _119_2232 = (let _119_2231 = (let _119_2230 = (let _119_2229 = (FStar_ToSMT_Term.mkEq (vapp, prim_app))
in ((vapp)::[], vars, _119_2229))
in (FStar_ToSMT_Term.mkForall _119_2230))
in (_119_2231, Some ("Projector equation")))
in FStar_ToSMT_Term.Assume (_119_2232))
in (_119_2233)::[])))
end))
end
| _53_3141 -> begin
[]
end)))))
in (let _53_3148 = (encode_binders None formals env)
in (match (_53_3148) with
| (vars, guards, env', decls1, _53_3147) -> begin
(let _53_3157 = (match (pre_opt) with
| None -> begin
(let _119_2234 = (FStar_ToSMT_Term.mk_and_l guards)
in (_119_2234, decls1))
end
| Some (p) -> begin
(let _53_3154 = (encode_formula p env')
in (match (_53_3154) with
| (g, ds) -> begin
(let _119_2235 = (FStar_ToSMT_Term.mk_and_l ((g)::guards))
in (_119_2235, (FStar_List.append decls1 ds)))
end))
end)
in (match (_53_3157) with
| (guard, decls1) -> begin
(let vtok_app = (mk_ApplyE vtok_tm vars)
in (let vapp = (let _119_2237 = (let _119_2236 = (FStar_List.map FStar_ToSMT_Term.mkFreeV vars)
in (vname, _119_2236))
in (FStar_ToSMT_Term.mkApp _119_2237))
in (let _53_3188 = (let vname_decl = (let _119_2240 = (let _119_2239 = (FStar_All.pipe_right formals (FStar_List.map (fun _53_32 -> (match (_53_32) with
| (FStar_Util.Inl (_53_3162), _53_3165) -> begin
FStar_ToSMT_Term.Type_sort
end
| _53_3168 -> begin
FStar_ToSMT_Term.Term_sort
end))))
in (vname, _119_2239, FStar_ToSMT_Term.Term_sort, None))
in FStar_ToSMT_Term.DeclFun (_119_2240))
in (let _53_3175 = (let env = (let _53_3170 = env
in {bindings = _53_3170.bindings; depth = _53_3170.depth; tcenv = _53_3170.tcenv; warn = _53_3170.warn; cache = _53_3170.cache; nolabels = _53_3170.nolabels; use_zfuel_name = _53_3170.use_zfuel_name; encode_non_total_function_typ = encode_non_total_function_typ})
in (match ((not ((head_normal env tt)))) with
| true -> begin
(encode_typ_pred None tt env vtok_tm)
end
| false -> begin
(encode_typ_pred None t_norm env vtok_tm)
end))
in (match (_53_3175) with
| (tok_typing, decls2) -> begin
(let tok_typing = FStar_ToSMT_Term.Assume ((tok_typing, Some ("function token typing")))
in (let _53_3185 = (match (formals) with
| [] -> begin
(let _119_2244 = (let _119_2243 = (let _119_2242 = (FStar_ToSMT_Term.mkFreeV (vname, FStar_ToSMT_Term.Term_sort))
in (FStar_All.pipe_left (fun _119_2241 -> Some (_119_2241)) _119_2242))
in (push_free_var env lid vname _119_2243))
in ((FStar_List.append decls2 ((tok_typing)::[])), _119_2244))
end
| _53_3179 -> begin
(let vtok_decl = FStar_ToSMT_Term.DeclFun ((vtok, [], FStar_ToSMT_Term.Term_sort, None))
in (let vtok_fresh = (let _119_2245 = (varops.next_id ())
in (FStar_ToSMT_Term.fresh_token (vtok, FStar_ToSMT_Term.Term_sort) _119_2245))
in (let name_tok_corr = (let _119_2249 = (let _119_2248 = (let _119_2247 = (let _119_2246 = (FStar_ToSMT_Term.mkEq (vtok_app, vapp))
in ((vtok_app)::[], vars, _119_2246))
in (FStar_ToSMT_Term.mkForall _119_2247))
in (_119_2248, None))
in FStar_ToSMT_Term.Assume (_119_2249))
in ((FStar_List.append decls2 ((vtok_decl)::(vtok_fresh)::(name_tok_corr)::(tok_typing)::[])), env))))
end)
in (match (_53_3185) with
| (tok_decl, env) -> begin
((vname_decl)::tok_decl, env)
end)))
end)))
in (match (_53_3188) with
| (decls2, env) -> begin
(let _53_3196 = (let res_t = (FStar_Absyn_Util.compress_typ res_t)
in (let _53_3192 = (encode_typ_term res_t env')
in (match (_53_3192) with
| (encoded_res_t, decls) -> begin
(let _119_2250 = (FStar_ToSMT_Term.mk_HasType vapp encoded_res_t)
in (encoded_res_t, _119_2250, decls))
end)))
in (match (_53_3196) with
| (encoded_res_t, ty_pred, decls3) -> begin
(let typingAx = (let _119_2254 = (let _119_2253 = (let _119_2252 = (let _119_2251 = (FStar_ToSMT_Term.mkImp (guard, ty_pred))
in ((vapp)::[], vars, _119_2251))
in (FStar_ToSMT_Term.mkForall _119_2252))
in (_119_2253, Some ("free var typing")))
in FStar_ToSMT_Term.Assume (_119_2254))
in (let g = (let _119_2256 = (let _119_2255 = (mk_disc_proj_axioms guard encoded_res_t vapp vars)
in (typingAx)::_119_2255)
in (FStar_List.append (FStar_List.append (FStar_List.append decls1 decls2) decls3) _119_2256))
in (g, env)))
end))
end))))
end))
end))))
end))
end)))
end)
end))
and encode_signature = (fun env ses -> (FStar_All.pipe_right ses (FStar_List.fold_left (fun _53_3203 se -> (match (_53_3203) with
| (g, env) -> begin
(let _53_3207 = (encode_sigelt env se)
in (match (_53_3207) with
| (g', env) -> begin
((FStar_List.append g g'), env)
end))
end)) ([], env))))

let encode_env_bindings = (fun env bindings -> (let encode_binding = (fun b _53_3214 -> (match (_53_3214) with
| (decls, env) -> begin
(match (b) with
| FStar_Tc_Env.Binding_var (x, t0) -> begin
(let _53_3222 = (new_term_constant env x)
in (match (_53_3222) with
| (xxsym, xx, env') -> begin
(let t1 = (FStar_Tc_Normalize.norm_typ ((FStar_Tc_Normalize.DeltaHard)::(FStar_Tc_Normalize.Beta)::(FStar_Tc_Normalize.Eta)::(FStar_Tc_Normalize.EtaArgs)::(FStar_Tc_Normalize.Simplify)::[]) env.tcenv t0)
in (let _53_3224 = (match ((FStar_All.pipe_left (FStar_Tc_Env.debug env.tcenv) (FStar_Options.Other ("Encoding")))) with
| true -> begin
(let _119_2271 = (FStar_Absyn_Print.strBvd x)
in (let _119_2270 = (FStar_Absyn_Print.typ_to_string t0)
in (let _119_2269 = (FStar_Absyn_Print.typ_to_string t1)
in (FStar_Util.fprint3 "Normalized %s : %s to %s\n" _119_2271 _119_2270 _119_2269))))
end
| false -> begin
()
end)
in (let _53_3228 = (encode_typ_pred None t1 env xx)
in (match (_53_3228) with
| (t, decls') -> begin
(let caption = (match ((FStar_ST.read FStar_Options.logQueries)) with
| true -> begin
(let _119_2275 = (let _119_2274 = (FStar_Absyn_Print.strBvd x)
in (let _119_2273 = (FStar_Absyn_Print.typ_to_string t0)
in (let _119_2272 = (FStar_Absyn_Print.typ_to_string t1)
in (FStar_Util.format3 "%s : %s (%s)" _119_2274 _119_2273 _119_2272))))
in Some (_119_2275))
end
| false -> begin
None
end)
in (let g = (FStar_List.append (FStar_List.append ((FStar_ToSMT_Term.DeclFun ((xxsym, [], FStar_ToSMT_Term.Term_sort, caption)))::[]) decls') ((FStar_ToSMT_Term.Assume ((t, None)))::[]))
in ((FStar_List.append decls g), env')))
end))))
end))
end
| FStar_Tc_Env.Binding_typ (a, k) -> begin
(let _53_3238 = (new_typ_constant env a)
in (match (_53_3238) with
| (aasym, aa, env') -> begin
(let _53_3241 = (encode_knd k env aa)
in (match (_53_3241) with
| (k, decls') -> begin
(let g = (let _119_2281 = (let _119_2280 = (let _119_2279 = (let _119_2278 = (let _119_2277 = (let _119_2276 = (FStar_Absyn_Print.strBvd a)
in Some (_119_2276))
in (aasym, [], FStar_ToSMT_Term.Type_sort, _119_2277))
in FStar_ToSMT_Term.DeclFun (_119_2278))
in (_119_2279)::[])
in (FStar_List.append _119_2280 decls'))
in (FStar_List.append _119_2281 ((FStar_ToSMT_Term.Assume ((k, None)))::[])))
in ((FStar_List.append decls g), env'))
end))
end))
end
| FStar_Tc_Env.Binding_lid (x, t) -> begin
(let t_norm = (whnf env t)
in (let _53_3250 = (encode_free_var env x t t_norm [])
in (match (_53_3250) with
| (g, env') -> begin
((FStar_List.append decls g), env')
end)))
end
| FStar_Tc_Env.Binding_sig (se) -> begin
(let _53_3255 = (encode_sigelt env se)
in (match (_53_3255) with
| (g, env') -> begin
((FStar_List.append decls g), env')
end))
end)
end))
in (FStar_List.fold_right encode_binding bindings ([], env))))

let encode_labels = (fun labs -> (let prefix = (FStar_All.pipe_right labs (FStar_List.map (fun _53_3262 -> (match (_53_3262) with
| (l, _53_3259, _53_3261) -> begin
FStar_ToSMT_Term.DeclFun (((Prims.fst l), [], FStar_ToSMT_Term.Bool_sort, None))
end))))
in (let suffix = (FStar_All.pipe_right labs (FStar_List.collect (fun _53_3269 -> (match (_53_3269) with
| (l, _53_3266, _53_3268) -> begin
(let _119_2289 = (FStar_All.pipe_left (fun _119_2285 -> FStar_ToSMT_Term.Echo (_119_2285)) (Prims.fst l))
in (let _119_2288 = (let _119_2287 = (let _119_2286 = (FStar_ToSMT_Term.mkFreeV l)
in FStar_ToSMT_Term.Eval (_119_2286))
in (_119_2287)::[])
in (_119_2289)::_119_2288))
end))))
in (prefix, suffix))))

let last_env = (FStar_Util.mk_ref [])

let init_env = (fun tcenv -> (let _119_2294 = (let _119_2293 = (let _119_2292 = (FStar_Util.smap_create 100)
in {bindings = []; depth = 0; tcenv = tcenv; warn = true; cache = _119_2292; nolabels = false; use_zfuel_name = false; encode_non_total_function_typ = true})
in (_119_2293)::[])
in (FStar_ST.op_Colon_Equals last_env _119_2294)))

let get_env = (fun tcenv -> (match ((FStar_ST.read last_env)) with
| [] -> begin
(FStar_All.failwith "No env; call init first!")
end
| e::_53_3275 -> begin
(let _53_3278 = e
in {bindings = _53_3278.bindings; depth = _53_3278.depth; tcenv = tcenv; warn = _53_3278.warn; cache = _53_3278.cache; nolabels = _53_3278.nolabels; use_zfuel_name = _53_3278.use_zfuel_name; encode_non_total_function_typ = _53_3278.encode_non_total_function_typ})
end))

let set_env = (fun env -> (match ((FStar_ST.read last_env)) with
| [] -> begin
(FStar_All.failwith "Empty env stack")
end
| _53_3284::tl -> begin
(FStar_ST.op_Colon_Equals last_env ((env)::tl))
end))

let push_env = (fun _53_3286 -> (match (()) with
| () -> begin
(match ((FStar_ST.read last_env)) with
| [] -> begin
(FStar_All.failwith "Empty env stack")
end
| hd::tl -> begin
(let refs = (FStar_Util.smap_copy hd.cache)
in (let top = (let _53_3292 = hd
in {bindings = _53_3292.bindings; depth = _53_3292.depth; tcenv = _53_3292.tcenv; warn = _53_3292.warn; cache = refs; nolabels = _53_3292.nolabels; use_zfuel_name = _53_3292.use_zfuel_name; encode_non_total_function_typ = _53_3292.encode_non_total_function_typ})
in (FStar_ST.op_Colon_Equals last_env ((top)::(hd)::tl))))
end)
end))

let pop_env = (fun _53_3295 -> (match (()) with
| () -> begin
(match ((FStar_ST.read last_env)) with
| [] -> begin
(FStar_All.failwith "Popping an empty stack")
end
| _53_3299::tl -> begin
(FStar_ST.op_Colon_Equals last_env tl)
end)
end))

let mark_env = (fun _53_3301 -> (match (()) with
| () -> begin
(push_env ())
end))

let reset_mark_env = (fun _53_3302 -> (match (()) with
| () -> begin
(pop_env ())
end))

let commit_mark_env = (fun _53_3303 -> (match (()) with
| () -> begin
(match ((FStar_ST.read last_env)) with
| hd::_53_3306::tl -> begin
(FStar_ST.op_Colon_Equals last_env ((hd)::tl))
end
| _53_3311 -> begin
(FStar_All.failwith "Impossible")
end)
end))

let init = (fun tcenv -> (let _53_3313 = (init_env tcenv)
in (let _53_3315 = (FStar_ToSMT_Z3.init ())
in (FStar_ToSMT_Z3.giveZ3 ((FStar_ToSMT_Term.DefPrelude)::[])))))

let push = (fun msg -> (let _53_3318 = (push_env ())
in (let _53_3320 = (varops.push ())
in (FStar_ToSMT_Z3.push msg))))

let pop = (fun msg -> (let _53_3323 = (let _119_2315 = (pop_env ())
in (FStar_All.pipe_left Prims.ignore _119_2315))
in (let _53_3325 = (varops.pop ())
in (FStar_ToSMT_Z3.pop msg))))

let mark = (fun msg -> (let _53_3328 = (mark_env ())
in (let _53_3330 = (varops.mark ())
in (FStar_ToSMT_Z3.mark msg))))

let reset_mark = (fun msg -> (let _53_3333 = (reset_mark_env ())
in (let _53_3335 = (varops.reset_mark ())
in (FStar_ToSMT_Z3.reset_mark msg))))

let commit_mark = (fun msg -> (let _53_3338 = (commit_mark_env ())
in (let _53_3340 = (varops.commit_mark ())
in (FStar_ToSMT_Z3.commit_mark msg))))

let encode_sig = (fun tcenv se -> (let caption = (fun decls -> (match ((FStar_ST.read FStar_Options.logQueries)) with
| true -> begin
(let _119_2329 = (let _119_2328 = (let _119_2327 = (FStar_Absyn_Print.sigelt_to_string_short se)
in (Prims.strcat "encoding sigelt " _119_2327))
in FStar_ToSMT_Term.Caption (_119_2328))
in (_119_2329)::decls)
end
| false -> begin
decls
end))
in (let env = (get_env tcenv)
in (let _53_3349 = (encode_sigelt env se)
in (match (_53_3349) with
| (decls, env) -> begin
(let _53_3350 = (set_env env)
in (let _119_2330 = (caption decls)
in (FStar_ToSMT_Z3.giveZ3 _119_2330)))
end)))))

let encode_modul = (fun tcenv modul -> (let name = (FStar_Util.format2 "%s %s" (match (modul.FStar_Absyn_Syntax.is_interface) with
| true -> begin
"interface"
end
| false -> begin
"module"
end) modul.FStar_Absyn_Syntax.name.FStar_Absyn_Syntax.str)
in (let _53_3355 = (match ((FStar_Tc_Env.debug tcenv FStar_Options.Low)) with
| true -> begin
(let _119_2335 = (FStar_All.pipe_right (FStar_List.length modul.FStar_Absyn_Syntax.exports) FStar_Util.string_of_int)
in (FStar_Util.fprint2 "Encoding externals for %s ... %s exports\n" name _119_2335))
end
| false -> begin
()
end)
in (let env = (get_env tcenv)
in (let _53_3362 = (encode_signature (let _53_3358 = env
in {bindings = _53_3358.bindings; depth = _53_3358.depth; tcenv = _53_3358.tcenv; warn = false; cache = _53_3358.cache; nolabels = _53_3358.nolabels; use_zfuel_name = _53_3358.use_zfuel_name; encode_non_total_function_typ = _53_3358.encode_non_total_function_typ}) modul.FStar_Absyn_Syntax.exports)
in (match (_53_3362) with
| (decls, env) -> begin
(let caption = (fun decls -> (match ((FStar_ST.read FStar_Options.logQueries)) with
| true -> begin
(let msg = (Prims.strcat "Externals for " name)
in (FStar_List.append ((FStar_ToSMT_Term.Caption (msg))::decls) ((FStar_ToSMT_Term.Caption ((Prims.strcat "End " msg)))::[])))
end
| false -> begin
decls
end))
in (let _53_3368 = (set_env (let _53_3366 = env
in {bindings = _53_3366.bindings; depth = _53_3366.depth; tcenv = _53_3366.tcenv; warn = true; cache = _53_3366.cache; nolabels = _53_3366.nolabels; use_zfuel_name = _53_3366.use_zfuel_name; encode_non_total_function_typ = _53_3366.encode_non_total_function_typ}))
in (let _53_3370 = (match ((FStar_Tc_Env.debug tcenv FStar_Options.Low)) with
| true -> begin
(FStar_Util.fprint1 "Done encoding externals for %s\n" name)
end
| false -> begin
()
end)
in (let decls = (caption decls)
in (FStar_ToSMT_Z3.giveZ3 decls)))))
end))))))

let solve = (fun tcenv q -> (let _53_3375 = (let _119_2344 = (let _119_2343 = (let _119_2342 = (FStar_Tc_Env.get_range tcenv)
in (FStar_All.pipe_left FStar_Range.string_of_range _119_2342))
in (FStar_Util.format1 "Starting query at %s" _119_2343))
in (push _119_2344))
in (let pop = (fun _53_3378 -> (match (()) with
| () -> begin
(let _119_2349 = (let _119_2348 = (let _119_2347 = (FStar_Tc_Env.get_range tcenv)
in (FStar_All.pipe_left FStar_Range.string_of_range _119_2347))
in (FStar_Util.format1 "Ending query at %s" _119_2348))
in (pop _119_2349))
end))
in (let _53_3408 = (let env = (get_env tcenv)
in (let bindings = (FStar_Tc_Env.fold_env tcenv (fun bs b -> (b)::bs) [])
in (let _53_3391 = (let _119_2353 = (FStar_List.filter (fun _53_33 -> (match (_53_33) with
| FStar_Tc_Env.Binding_sig (_53_3385) -> begin
false
end
| _53_3388 -> begin
true
end)) bindings)
in (encode_env_bindings env _119_2353))
in (match (_53_3391) with
| (env_decls, env) -> begin
(let _53_3392 = (match ((FStar_Tc_Env.debug tcenv FStar_Options.Low)) with
| true -> begin
(let _119_2354 = (FStar_Absyn_Print.formula_to_string q)
in (FStar_Util.fprint1 "Encoding query formula: %s\n" _119_2354))
end
| false -> begin
()
end)
in (let _53_3397 = (encode_formula_with_labels q env)
in (match (_53_3397) with
| (phi, labels, qdecls) -> begin
(let _53_3400 = (encode_labels labels)
in (match (_53_3400) with
| (label_prefix, label_suffix) -> begin
(let query_prelude = (FStar_List.append (FStar_List.append env_decls label_prefix) qdecls)
in (let qry = (let _119_2356 = (let _119_2355 = (FStar_ToSMT_Term.mkNot phi)
in (_119_2355, Some ("query")))
in FStar_ToSMT_Term.Assume (_119_2356))
in (let suffix = (FStar_List.append label_suffix ((FStar_ToSMT_Term.Echo ("Done!"))::[]))
in (query_prelude, labels, qry, suffix))))
end))
end)))
end))))
in (match (_53_3408) with
| (prefix, labels, qry, suffix) -> begin
(match (qry) with
| FStar_ToSMT_Term.Assume ({FStar_ToSMT_Term.tm = FStar_ToSMT_Term.App (FStar_ToSMT_Term.False, _53_3415); FStar_ToSMT_Term.hash = _53_3412; FStar_ToSMT_Term.freevars = _53_3410}, _53_3420) -> begin
(let _53_3423 = (pop ())
in ())
end
| _53_3426 when tcenv.FStar_Tc_Env.admit -> begin
(let _53_3427 = (pop ())
in ())
end
| FStar_ToSMT_Term.Assume (q, _53_3431) -> begin
(let fresh = ((FStar_String.length q.FStar_ToSMT_Term.hash) >= 2048)
in (let _53_3435 = (FStar_ToSMT_Z3.giveZ3 prefix)
in (let with_fuel = (fun p _53_3441 -> (match (_53_3441) with
| (n, i) -> begin
(let _119_2379 = (let _119_2378 = (let _119_2363 = (let _119_2362 = (FStar_Util.string_of_int n)
in (let _119_2361 = (FStar_Util.string_of_int i)
in (FStar_Util.format2 "<fuel=\'%s\' ifuel=\'%s\'>" _119_2362 _119_2361)))
in FStar_ToSMT_Term.Caption (_119_2363))
in (let _119_2377 = (let _119_2376 = (let _119_2368 = (let _119_2367 = (let _119_2366 = (let _119_2365 = (FStar_ToSMT_Term.mkApp ("MaxFuel", []))
in (let _119_2364 = (FStar_ToSMT_Term.n_fuel n)
in (_119_2365, _119_2364)))
in (FStar_ToSMT_Term.mkEq _119_2366))
in (_119_2367, None))
in FStar_ToSMT_Term.Assume (_119_2368))
in (let _119_2375 = (let _119_2374 = (let _119_2373 = (let _119_2372 = (let _119_2371 = (let _119_2370 = (FStar_ToSMT_Term.mkApp ("MaxIFuel", []))
in (let _119_2369 = (FStar_ToSMT_Term.n_fuel i)
in (_119_2370, _119_2369)))
in (FStar_ToSMT_Term.mkEq _119_2371))
in (_119_2372, None))
in FStar_ToSMT_Term.Assume (_119_2373))
in (_119_2374)::(p)::(FStar_ToSMT_Term.CheckSat)::[])
in (_119_2376)::_119_2375))
in (_119_2378)::_119_2377))
in (FStar_List.append _119_2379 suffix))
end))
in (let check = (fun p -> (let initial_config = (let _119_2383 = (FStar_ST.read FStar_Options.initial_fuel)
in (let _119_2382 = (FStar_ST.read FStar_Options.initial_ifuel)
in (_119_2383, _119_2382)))
in (let alt_configs = (let _119_2402 = (let _119_2401 = (match (((FStar_ST.read FStar_Options.max_ifuel) > (FStar_ST.read FStar_Options.initial_ifuel))) with
| true -> begin
(let _119_2386 = (let _119_2385 = (FStar_ST.read FStar_Options.initial_fuel)
in (let _119_2384 = (FStar_ST.read FStar_Options.max_ifuel)
in (_119_2385, _119_2384)))
in (_119_2386)::[])
end
| false -> begin
[]
end)
in (let _119_2400 = (let _119_2399 = (match ((((FStar_ST.read FStar_Options.max_fuel) / 2) > (FStar_ST.read FStar_Options.initial_fuel))) with
| true -> begin
(let _119_2389 = (let _119_2388 = ((FStar_ST.read FStar_Options.max_fuel) / 2)
in (let _119_2387 = (FStar_ST.read FStar_Options.max_ifuel)
in (_119_2388, _119_2387)))
in (_119_2389)::[])
end
| false -> begin
[]
end)
in (let _119_2398 = (let _119_2397 = (match ((((FStar_ST.read FStar_Options.max_fuel) > (FStar_ST.read FStar_Options.initial_fuel)) && ((FStar_ST.read FStar_Options.max_ifuel) > (FStar_ST.read FStar_Options.initial_ifuel)))) with
| true -> begin
(let _119_2392 = (let _119_2391 = (FStar_ST.read FStar_Options.max_fuel)
in (let _119_2390 = (FStar_ST.read FStar_Options.max_ifuel)
in (_119_2391, _119_2390)))
in (_119_2392)::[])
end
| false -> begin
[]
end)
in (let _119_2396 = (let _119_2395 = (match (((FStar_ST.read FStar_Options.min_fuel) < (FStar_ST.read FStar_Options.initial_fuel))) with
| true -> begin
(let _119_2394 = (let _119_2393 = (FStar_ST.read FStar_Options.min_fuel)
in (_119_2393, 1))
in (_119_2394)::[])
end
| false -> begin
[]
end)
in (_119_2395)::[])
in (_119_2397)::_119_2396))
in (_119_2399)::_119_2398))
in (_119_2401)::_119_2400))
in (FStar_List.flatten _119_2402))
in (let report = (fun errs -> (let errs = (match (errs) with
| [] -> begin
(("Unknown assertion failed", FStar_Absyn_Syntax.dummyRange))::[]
end
| _53_3450 -> begin
errs
end)
in (let _53_3452 = (match ((FStar_ST.read FStar_Options.print_fuels)) with
| true -> begin
(let _119_2410 = (let _119_2405 = (FStar_Tc_Env.get_range tcenv)
in (FStar_Range.string_of_range _119_2405))
in (let _119_2409 = (let _119_2406 = (FStar_ST.read FStar_Options.max_fuel)
in (FStar_All.pipe_right _119_2406 FStar_Util.string_of_int))
in (let _119_2408 = (let _119_2407 = (FStar_ST.read FStar_Options.max_ifuel)
in (FStar_All.pipe_right _119_2407 FStar_Util.string_of_int))
in (FStar_Util.fprint3 "(%s) Query failed with maximum fuel %s and ifuel %s\n" _119_2410 _119_2409 _119_2408))))
end
| false -> begin
()
end)
in (FStar_Tc_Errors.add_errors tcenv errs))))
in (let rec try_alt_configs = (fun p errs _53_34 -> (match (_53_34) with
| [] -> begin
(report errs)
end
| mi::[] -> begin
(match (errs) with
| [] -> begin
(let _119_2421 = (with_fuel p mi)
in (FStar_ToSMT_Z3.ask fresh labels _119_2421 (cb mi p [])))
end
| _53_3464 -> begin
(report errs)
end)
end
| mi::tl -> begin
(let _119_2423 = (with_fuel p mi)
in (FStar_ToSMT_Z3.ask fresh labels _119_2423 (fun _53_3470 -> (match (_53_3470) with
| (ok, errs') -> begin
(match (errs) with
| [] -> begin
(cb mi p tl (ok, errs'))
end
| _53_3473 -> begin
(cb mi p tl (ok, errs))
end)
end))))
end))
and cb = (fun _53_3476 p alt _53_3481 -> (match ((_53_3476, _53_3481)) with
| ((prev_fuel, prev_ifuel), (ok, errs)) -> begin
(match (ok) with
| true -> begin
(match ((FStar_ST.read FStar_Options.print_fuels)) with
| true -> begin
(let _119_2431 = (let _119_2428 = (FStar_Tc_Env.get_range tcenv)
in (FStar_Range.string_of_range _119_2428))
in (let _119_2430 = (FStar_Util.string_of_int prev_fuel)
in (let _119_2429 = (FStar_Util.string_of_int prev_ifuel)
in (FStar_Util.fprint3 "(%s) Query succeeded with fuel %s and ifuel %s\n" _119_2431 _119_2430 _119_2429))))
end
| false -> begin
()
end)
end
| false -> begin
(try_alt_configs p errs alt)
end)
end))
in (let _119_2432 = (with_fuel p initial_config)
in (FStar_ToSMT_Z3.ask fresh labels _119_2432 (cb initial_config p alt_configs))))))))
in (let process_query = (fun q -> (match (((FStar_ST.read FStar_Options.split_cases) > 0)) with
| true -> begin
(let _53_3486 = (let _119_2438 = (FStar_ST.read FStar_Options.split_cases)
in (FStar_ToSMT_SplitQueryCases.can_handle_query _119_2438 q))
in (match (_53_3486) with
| (b, cb) -> begin
(match (b) with
| true -> begin
(FStar_ToSMT_SplitQueryCases.handle_query cb check)
end
| false -> begin
(check q)
end)
end))
end
| false -> begin
(check q)
end))
in (let _53_3487 = (match ((FStar_ST.read FStar_Options.admit_smt_queries)) with
| true -> begin
()
end
| false -> begin
(process_query qry)
end)
in (pop ())))))))
end)
end)))))

let is_trivial = (fun tcenv q -> (let env = (get_env tcenv)
in (let _53_3492 = (push "query")
in (let _53_3499 = (encode_formula_with_labels q env)
in (match (_53_3499) with
| (f, _53_3496, _53_3498) -> begin
(let _53_3500 = (pop "query")
in (match (f.FStar_ToSMT_Term.tm) with
| FStar_ToSMT_Term.App (FStar_ToSMT_Term.True, _53_3504) -> begin
true
end
| _53_3508 -> begin
false
end))
end)))))

let solver = {FStar_Tc_Env.init = init; FStar_Tc_Env.push = push; FStar_Tc_Env.pop = pop; FStar_Tc_Env.mark = mark; FStar_Tc_Env.reset_mark = reset_mark; FStar_Tc_Env.commit_mark = commit_mark; FStar_Tc_Env.encode_modul = encode_modul; FStar_Tc_Env.encode_sig = encode_sig; FStar_Tc_Env.solve = solve; FStar_Tc_Env.is_trivial = is_trivial; FStar_Tc_Env.finish = FStar_ToSMT_Z3.finish; FStar_Tc_Env.refresh = FStar_ToSMT_Z3.refresh}

let dummy = {FStar_Tc_Env.init = (fun _53_3509 -> ()); FStar_Tc_Env.push = (fun _53_3511 -> ()); FStar_Tc_Env.pop = (fun _53_3513 -> ()); FStar_Tc_Env.mark = (fun _53_3515 -> ()); FStar_Tc_Env.reset_mark = (fun _53_3517 -> ()); FStar_Tc_Env.commit_mark = (fun _53_3519 -> ()); FStar_Tc_Env.encode_modul = (fun _53_3521 _53_3523 -> ()); FStar_Tc_Env.encode_sig = (fun _53_3525 _53_3527 -> ()); FStar_Tc_Env.solve = (fun _53_3529 _53_3531 -> ()); FStar_Tc_Env.is_trivial = (fun _53_3533 _53_3535 -> false); FStar_Tc_Env.finish = (fun _53_3537 -> ()); FStar_Tc_Env.refresh = (fun _53_3538 -> ())}




