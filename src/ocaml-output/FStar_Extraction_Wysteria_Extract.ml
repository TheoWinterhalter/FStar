
open Prims
type name =
Prims.string

type wexp =
Prims.string

type wtyp =
Prims.string

type tlet =
| Mk_tlet of (name * wtyp * wexp)

let is_Mk_tlet = (fun _discr_ -> (match (_discr_) with
| Mk_tlet (_) -> begin
true
end
| _ -> begin
false
end))

let ___Mk_tlet____0 = (fun projectee -> (match (projectee) with
| Mk_tlet (_65_2) -> begin
_65_2
end))

let fn_map = (FStar_Util.smap_create 10)

type wys_lib_fn =
{fn_name : Prims.string; rem_args : Prims.int; arity : Prims.int; extracted_fn_name : Prims.string}

let is_Mkwys_lib_fn = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkwys_lib_fn"))))

let to_wys_lib_fn = (fun s1 n1 n2 s2 -> {fn_name = s1; rem_args = n1; arity = n2; extracted_fn_name = s2})

let wys_lib_args_map = (FStar_Util.smap_create 10)

let prims_trans_map = (FStar_Util.smap_create 10)

let slice_id = "slice_id"

let compose_ids = "compose_ids"

let slice_id_sps = "slice_id_sps"

let initialize = (fun _65_12 -> (let _65_14 = (FStar_Util.smap_add fn_map "Prims.int" (slice_id, compose_ids, slice_id_sps))
in (let _65_16 = (FStar_Util.smap_add fn_map "Prims.nat" (slice_id, compose_ids, slice_id_sps))
in (let _65_18 = (FStar_Util.smap_add fn_map "Prims.list" ("slice_list", "compose_lists", "slice_list_sps"))
in (let _65_20 = (FStar_Util.smap_add fn_map "Prims.option" ("slice_option", "compose_options", "slice_option_sps"))
in (let _65_22 = (FStar_Util.smap_add fn_map "Prims.Tuple2" ("slice_tuple", "compose_tuples", "slice_tuple_sps"))
in (let _65_24 = (FStar_Util.smap_add wys_lib_args_map "as_par" (to_wys_lib_fn "as_par" 0 2 "mk_aspar"))
in (let _65_26 = (FStar_Util.smap_add wys_lib_args_map "as_sec" (to_wys_lib_fn "as_sec" 0 2 "mk_assec"))
in (let _65_28 = (FStar_Util.smap_add wys_lib_args_map "unbox_p" (to_wys_lib_fn "unbox_p" 1 1 "mk_unbox"))
in (let _65_30 = (FStar_Util.smap_add wys_lib_args_map "unbox_s" (to_wys_lib_fn "unbox_s" 1 1 "mk_unbox"))
in (let _65_32 = (FStar_Util.smap_add wys_lib_args_map "box" (to_wys_lib_fn "box" 0 2 "mk_box"))
in (let _65_34 = (FStar_Util.smap_add wys_lib_args_map "mkwire_p" (to_wys_lib_fn "mkwire_p" 1 2 "mk_mkwire"))
in (let _65_36 = (FStar_Util.smap_add wys_lib_args_map "mkwire_s" (to_wys_lib_fn "mkwire_s" 0 2 "mk_mkwire"))
in (let _65_38 = (FStar_Util.smap_add wys_lib_args_map "projwire_p" (to_wys_lib_fn "projwire_p" 1 2 "mk_projwire"))
in (let _65_40 = (FStar_Util.smap_add wys_lib_args_map "projwire_s" (to_wys_lib_fn "projwire_s" 1 2 "mk_projwire"))
in (let _65_42 = (FStar_Util.smap_add wys_lib_args_map "concat_wire" (to_wys_lib_fn "concat_wire" 2 2 "mk_concatwire"))
in (let _65_44 = (FStar_Util.smap_add wys_lib_args_map "mk_sh" (to_wys_lib_fn "mk_sh" 0 1 "mk_mksh"))
in (let _65_46 = (FStar_Util.smap_add wys_lib_args_map "comb_sh" (to_wys_lib_fn "comb_sh" 0 1 "mk_combsh"))
in (let _65_48 = (FStar_Util.smap_add prims_trans_map "Prims.op_Multiply" "Prims.( * )")
in (let _65_50 = (FStar_Util.smap_add prims_trans_map "Prims.op_Subtraction" "Prims.(-)")
in (let _65_52 = (FStar_Util.smap_add prims_trans_map "Prims.op_Addition" "Prims.(+)")
in (let _65_54 = (FStar_Util.smap_add prims_trans_map "Prims.op_LessThanOrEqual" "Prims.(<=)")
in (let _65_56 = (FStar_Util.smap_add prims_trans_map "Prims.op_GreaterThan" "Prims.(>)")
in (let _65_58 = (FStar_Util.smap_add prims_trans_map "Prims.op_GreaterThanOrEqual" "Prims.(>=)")
in (let _65_60 = (FStar_Util.smap_add prims_trans_map "Prims.op_LessThan" "Prims.(<)")
in (let _65_62 = (FStar_Util.smap_add prims_trans_map "Prims.op_Modulus" "Prims.(%)")
in ()))))))))))))))))))))))))))

let lookup_ffi_map = (fun t -> (let m = (FStar_Util.smap_try_find fn_map t)
in (match (m) with
| Some (m) -> begin
m
end
| _65_69 -> begin
(FStar_All.failwith (Prims.strcat "Unknown user type: " t))
end)))

let lookup_wys_lib_map = (fun s -> (match ((FStar_Util.smap_try_find wys_lib_args_map s)) with
| Some (x) -> begin
x
end
| _65_74 -> begin
(FStar_All.failwith "Unknown wysteria library function")
end))

let translate_ffi_name = (fun s -> (match ((FStar_Util.smap_try_find prims_trans_map s)) with
| Some (x) -> begin
x
end
| None -> begin
s
end))

let rec sublist = (fun s l n -> if (n > (FStar_List.length l)) then begin
(let _132_46 = (let _132_45 = (FStar_Util.string_of_int (FStar_List.length l))
in (let _132_44 = (FStar_Util.string_of_int n)
in (FStar_Util.format3 "Error removing arguments in sublist for %s, list len is %s, n is %s " s _132_45 _132_44)))
in (FStar_All.failwith _132_46))
end else begin
if (n = 0) then begin
l
end else begin
(let _132_47 = (FStar_List.tl l)
in (sublist s _132_47 (n - 1)))
end
end)

let is_bool = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (_65_85, p) -> begin
((FStar_Extraction_ML_Syntax.string_of_mlpath p) = "Prims.bool")
end
| _65_90 -> begin
false
end))

let is_int = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (_65_93, p) -> begin
((FStar_Extraction_ML_Syntax.string_of_mlpath p) = "Prims.int")
end
| _65_98 -> begin
false
end))

let is_unit = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (_65_101, p) -> begin
((FStar_Extraction_ML_Syntax.string_of_mlpath p) = "Prims.unit")
end
| _65_106 -> begin
false
end))

let is_prin = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (_65_109, p) -> begin
((FStar_Extraction_ML_Syntax.string_of_mlpath p) = "Prins.prin")
end
| _65_114 -> begin
false
end))

let is_prins = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (_65_117, p) -> begin
((FStar_Extraction_ML_Syntax.string_of_mlpath p) = "Prins.prins")
end
| _65_122 -> begin
false
end))

let is_eprins = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (_65_125, p) -> begin
((FStar_Extraction_ML_Syntax.string_of_mlpath p) = "Prins.eprins")
end
| _65_130 -> begin
false
end))

let is_box = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (_65_133, p) -> begin
((FStar_Extraction_ML_Syntax.string_of_mlpath p) = "Wysteria.Box")
end
| _65_138 -> begin
false
end))

let is_wire = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (_65_141, p) -> begin
((FStar_Extraction_ML_Syntax.string_of_mlpath p) = "Wysteria.Wire")
end
| _65_146 -> begin
false
end))

let is_share = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (_65_149, p) -> begin
((FStar_Extraction_ML_Syntax.string_of_mlpath p) = "Wysteria.Sh")
end
| _65_154 -> begin
false
end))

let box_content_type = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (l, p) -> begin
if ((FStar_Extraction_ML_Syntax.string_of_mlpath p) = "Wysteria.Box") then begin
(FStar_List.hd l)
end else begin
(FStar_All.failwith "Cannot get content for non box named type")
end
end
| _65_161 -> begin
(FStar_All.failwith "Cannot get content for non-named type")
end))

let wire_content_type = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (l, p) -> begin
if ((FStar_Extraction_ML_Syntax.string_of_mlpath p) = "Wysteria.Wire") then begin
(FStar_List.hd l)
end else begin
(FStar_All.failwith "Cannot get content for non wire named type")
end
end
| _65_168 -> begin
(FStar_All.failwith "Cannot get content for non-named type")
end))

let is_wysteria_type = (fun t -> ((((((is_prin t) || (is_prins t)) || (is_eprins t)) || (is_box t)) || (is_wire t)) || (is_share t)))

let slice_value = "Semantics.slice_v_ffi"

let slice_value_sps = "Semantics.slice_v_sps_ffi"

let compose_values = "Semantics.compose_vals_ffi"

let rec get_opaque_fns = (fun t -> if (((((is_bool t) || (is_unit t)) || (is_prin t)) || (is_prins t)) || (is_eprins t)) then begin
(slice_id, compose_ids, slice_id_sps)
end else begin
if (((is_box t) || (is_wire t)) || (is_share t)) then begin
(slice_value, compose_values, slice_value_sps)
end else begin
(match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named ([], p) -> begin
(lookup_ffi_map (FStar_Extraction_ML_Syntax.string_of_mlpath p))
end
| FStar_Extraction_ML_Syntax.MLTY_Named (args, p) -> begin
(let _65_182 = (get_opaque_fns (FStar_Extraction_ML_Syntax.MLTY_Named (([], p))))
in (match (_65_182) with
| (e1, e2, e3) -> begin
(FStar_List.fold_left (fun _65_186 arg -> (match (_65_186) with
| (a1, a2, a3) -> begin
(match (arg) with
| FStar_Extraction_ML_Syntax.MLTY_Named (_65_189) -> begin
(let _65_194 = (get_opaque_fns arg)
in (match (_65_194) with
| (e1_arg, e2_arg, e3_arg) -> begin
((Prims.strcat (Prims.strcat (Prims.strcat (Prims.strcat "(" a1) " ") e1_arg) ")"), (Prims.strcat (Prims.strcat (Prims.strcat (Prims.strcat "(" a2) " ") e2_arg) ")"), (Prims.strcat (Prims.strcat (Prims.strcat (Prims.strcat "(" a3) " ") e3_arg) ")"))
end))
end
| _65_196 -> begin
(FStar_All.failwith "Did not expect type argument to be something other than named type")
end)
end)) (e1, e2, e3) args)
end))
end
| _65_198 -> begin
(FStar_All.failwith "Did not expect a non named type in get_opaque_fns")
end)
end
end)

let get_injection = (fun t -> (let s = "fun x -> "
in (let s' = if (is_bool t) then begin
"D_v (const_meta, V_bool x)"
end else begin
if (is_unit t) then begin
"D_v (const_meta, V_unit)"
end else begin
if (is_prin t) then begin
"D_v (const_meta, V_prin x)"
end else begin
if ((is_prins t) || (is_eprins t)) then begin
"D_v (const_meta, V_eprins x)"
end else begin
if (((is_box t) || (is_wire t)) || (is_share t)) then begin
"x"
end else begin
(let _65_204 = (get_opaque_fns t)
in (match (_65_204) with
| (s1, s2, s3) -> begin
(Prims.strcat (Prims.strcat (Prims.strcat (Prims.strcat (Prims.strcat "mk_v_opaque x " s1) " ") s2) " ") s3)
end))
end
end
end
end
end
in (Prims.strcat s s'))))

let is_known_named_type = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (_65_208, p) -> begin
(let s_opt = (FStar_Util.smap_try_find fn_map (FStar_Extraction_ML_Syntax.string_of_mlpath p))
in if (s_opt = None) then begin
false
end else begin
true
end)
end
| _65_214 -> begin
(FStar_All.failwith "Is_known_named_type was not called with a named type")
end))

let name_to_string = (fun s -> (Prims.strcat (Prims.strcat "\"" s) "\""))

let rec mlty_to_typ = (fun t -> if (is_bool t) then begin
"T_bool"
end else begin
if (is_unit t) then begin
"T_unit"
end else begin
if (is_prin t) then begin
"T_prin"
end else begin
if (is_prins t) then begin
"T_eprins"
end else begin
if (is_box t) then begin
(let _132_86 = (let _132_85 = (let _132_84 = (box_content_type t)
in (mlty_to_typ _132_84))
in (Prims.strcat "T_box (" _132_85))
in (Prims.strcat _132_86 ")"))
end else begin
if (is_wire t) then begin
(let _132_89 = (let _132_88 = (let _132_87 = (wire_content_type t)
in (mlty_to_typ _132_87))
in (Prims.strcat "T_wire (" _132_88))
in (Prims.strcat _132_89 ")"))
end else begin
if (is_share t) then begin
"T_sh"
end else begin
(match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (l, p) -> begin
(let n = (Prims.strcat "T_cons (" (name_to_string (FStar_Extraction_ML_Syntax.string_of_mlpath p)))
in (let args = (FStar_List.fold_left (fun s a -> (let _132_93 = (let _132_92 = (mlty_to_typ a)
in (Prims.strcat (Prims.strcat s " (") _132_92))
in (Prims.strcat _132_93 ");"))) "" l)
in (Prims.strcat (Prims.strcat (Prims.strcat n ", [") args) "])")))
end
| _65_226 -> begin
"T_unknown"
end)
end
end
end
end
end
end
end)

let get_constant_injection = (fun t x -> if (is_bool t) then begin
(Prims.strcat "C_bool " x)
end else begin
if (is_unit t) then begin
"C_unit ()"
end else begin
if (is_known_named_type t) then begin
(let _132_99 = (let _132_98 = (mlty_to_typ t)
in (Prims.strcat (Prims.strcat (Prims.strcat "C_opaque ((), Obj.magic " x) ", ") _132_98))
in (Prims.strcat _132_99 ")"))
end else begin
(FStar_All.failwith "Constant injection does not support this type")
end
end
end)

let is_ffi = (fun _65_231 -> (match (_65_231) with
| {FStar_Extraction_ML_Syntax.expr = e; FStar_Extraction_ML_Syntax.ty = t} -> begin
(match (e) with
| FStar_Extraction_ML_Syntax.MLE_Name (p, n) -> begin
(let _132_102 = (translate_ffi_name (FStar_Extraction_ML_Syntax.string_of_mlpath (p, n)))
in (((p = ("FFI")::[]) || (p = ("Prims")::[])), _132_102))
end
| _65_237 -> begin
(false, "")
end)
end))

let tag_of_mlconst = (fun c -> (match (c) with
| FStar_Extraction_ML_Syntax.MLC_Unit -> begin
"MLC_Unit"
end
| FStar_Extraction_ML_Syntax.MLC_Bool (_65_241) -> begin
"MLC_Bool"
end
| FStar_Extraction_ML_Syntax.MLC_Char (_65_244) -> begin
"MLC_Char"
end
| FStar_Extraction_ML_Syntax.MLC_Byte (_65_247) -> begin
"MLC_Byte"
end
| FStar_Extraction_ML_Syntax.MLC_Int32 (_65_250) -> begin
"MLC_Int32"
end
| FStar_Extraction_ML_Syntax.MLC_Int64 (_65_253) -> begin
"MLC_Int64"
end
| FStar_Extraction_ML_Syntax.MLC_Int (_65_256) -> begin
"MLC_Int"
end
| FStar_Extraction_ML_Syntax.MLC_Float (_65_259) -> begin
"MLC_Float"
end
| FStar_Extraction_ML_Syntax.MLC_Bytes (_65_262) -> begin
"MLC_Bytes"
end
| FStar_Extraction_ML_Syntax.MLC_String (_65_265) -> begin
"MLC_String"
end))

let extract_mlconst = (fun c -> (match (c) with
| FStar_Extraction_ML_Syntax.MLC_Unit -> begin
"C_unit ()"
end
| FStar_Extraction_ML_Syntax.MLC_Bool (b) -> begin
(Prims.strcat "C_bool " (if b then begin
"true"
end else begin
"false"
end))
end
| FStar_Extraction_ML_Syntax.MLC_Int32 (n) -> begin
(Prims.strcat (Prims.strcat "C_opaque ((), Obj.magic " (FStar_Util.string_of_int32 n)) ", T_cons (\"Prims.int\", []))")
end
| FStar_Extraction_ML_Syntax.MLC_Int64 (n) -> begin
(Prims.strcat (Prims.strcat "C_opaque ((), Obj.magic " (FStar_Util.string_of_int64 n)) ", T_cons (\"Prims.int\", []))")
end
| FStar_Extraction_ML_Syntax.MLC_Int (x) -> begin
(Prims.strcat (Prims.strcat "C_opaque ((), Obj.magic " x) ", T_cons (\"Prims.int\", []))")
end
| FStar_Extraction_ML_Syntax.MLC_String (s) -> begin
(Prims.strcat (Prims.strcat "C_opaque ((), Obj.magic (\"" s) "\"), T_unknown)")
end
| _65_280 -> begin
(FStar_All.failwith (Prims.strcat "Unsupported constant: tag: " (tag_of_mlconst c)))
end))

let is_wys_lib_fn = (fun _65_283 -> (match (_65_283) with
| {FStar_Extraction_ML_Syntax.expr = e; FStar_Extraction_ML_Syntax.ty = t} -> begin
(match (e) with
| FStar_Extraction_ML_Syntax.MLE_Name (p) -> begin
(FStar_Util.starts_with (FStar_Extraction_ML_Syntax.string_of_mlpath p) "Wysteria")
end
| _65_287 -> begin
false
end)
end))

let check_pats_for_bool = (fun l -> (let def = (false, FStar_Extraction_ML_Syntax.ml_unit, FStar_Extraction_ML_Syntax.ml_unit)
in if ((FStar_List.length l) <> 2) then begin
def
end else begin
(let _65_294 = (FStar_List.hd l)
in (match (_65_294) with
| (p1, _65_292, e1) -> begin
(let _65_299 = (let _132_111 = (FStar_List.tl l)
in (FStar_List.hd _132_111))
in (match (_65_299) with
| (p2, _65_297, e2) -> begin
(match ((p1, p2)) with
| (FStar_Extraction_ML_Syntax.MLP_Const (FStar_Extraction_ML_Syntax.MLC_Bool (_65_301)), FStar_Extraction_ML_Syntax.MLP_Const (FStar_Extraction_ML_Syntax.MLC_Bool (_65_305))) -> begin
(true, e1, e2)
end
| _65_310 -> begin
def
end)
end))
end))
end))

let mk_var = (fun s t -> (let _132_117 = (let _132_116 = (mlty_to_typ t)
in (Prims.strcat (Prims.strcat (Prims.strcat "mk_var " (name_to_string s)) " (") _132_116))
in (Prims.strcat _132_117 ")")))

let mk_varname = (fun s t -> (let _132_123 = (let _132_122 = (mlty_to_typ t)
in (Prims.strcat (Prims.strcat (Prims.strcat "mk_varname " (name_to_string s)) " (") _132_122))
in (Prims.strcat _132_123 ")")))

let rec extract_mlexp = (fun _65_317 -> (match (_65_317) with
| {FStar_Extraction_ML_Syntax.expr = e; FStar_Extraction_ML_Syntax.ty = t} -> begin
(match (e) with
| FStar_Extraction_ML_Syntax.MLE_Const (c) -> begin
(let _132_130 = (let _132_129 = (extract_mlconst c)
in (Prims.strcat "mk_const (" _132_129))
in (Prims.strcat _132_130 ")"))
end
| FStar_Extraction_ML_Syntax.MLE_Var (x) -> begin
(mk_var (FStar_Extraction_ML_Syntax.idsym x) t)
end
| FStar_Extraction_ML_Syntax.MLE_Name (p, s) -> begin
(let ss = (FStar_Extraction_ML_Syntax.string_of_mlpath (p, s))
in (let _65_327 = if (not ((FStar_Util.starts_with ss "SMC."))) then begin
(let _132_131 = (FStar_Util.format1 "Warning: name not applied: %s\n" (FStar_Extraction_ML_Syntax.string_of_mlpath (p, s)))
in (FStar_Util.print_string _132_131))
end else begin
()
end
in (mk_var s t)))
end
| FStar_Extraction_ML_Syntax.MLE_Let ((b, l), e') -> begin
if b then begin
(FStar_All.failwith "Nested recursive lets are not supported yet")
end else begin
(let lb = (FStar_List.hd l)
in (let lbname = (FStar_Extraction_ML_Syntax.idsym lb.FStar_Extraction_ML_Syntax.mllb_name)
in (let lbbody = lb.FStar_Extraction_ML_Syntax.mllb_def
in (let _132_139 = (let _132_138 = (let _132_136 = (let _132_135 = (let _132_133 = (let _132_132 = (mk_varname lbname lbbody.FStar_Extraction_ML_Syntax.ty)
in (Prims.strcat "mk_let (" _132_132))
in (Prims.strcat _132_133 ") ("))
in (let _132_134 = (extract_mlexp lbbody)
in (Prims.strcat _132_135 _132_134)))
in (Prims.strcat _132_136 ") ("))
in (let _132_137 = (extract_mlexp e')
in (Prims.strcat _132_138 _132_137)))
in (Prims.strcat _132_139 ")")))))
end
end
| FStar_Extraction_ML_Syntax.MLE_App (f, args) -> begin
(let _65_344 = (is_ffi f)
in (match (_65_344) with
| (b, ffi) -> begin
if b then begin
(let inj = (get_injection t)
in (let args_exp = (FStar_List.fold_left (fun s a -> (let _132_143 = (let _132_142 = (extract_mlexp a)
in (Prims.strcat (Prims.strcat s " (") _132_142))
in (Prims.strcat _132_143 ");"))) "" args)
in (let _132_153 = (let _132_152 = (let _132_151 = (let _132_150 = (let _132_149 = (let _132_148 = (let _132_147 = (let _132_146 = (let _132_145 = (let _132_144 = (FStar_Util.string_of_int (FStar_List.length args))
in (Prims.strcat "mk_ffi " _132_144))
in (Prims.strcat _132_145 " "))
in (Prims.strcat _132_146 (name_to_string ffi)))
in (Prims.strcat _132_147 " ("))
in (Prims.strcat _132_148 ffi))
in (Prims.strcat _132_149 ") [ "))
in (Prims.strcat _132_150 args_exp))
in (Prims.strcat _132_151 " ] ("))
in (Prims.strcat _132_152 inj))
in (Prims.strcat _132_153 ")"))))
end else begin
if (is_wys_lib_fn f) then begin
(extract_wysteria_specific_ast f args t)
end else begin
(let s = (extract_mlexp f)
in if (s = "_assert") then begin
"mk_const (C_unit ())"
end else begin
(FStar_List.fold_left (fun s a -> (let _132_157 = (let _132_156 = (extract_mlexp a)
in (Prims.strcat (Prims.strcat (Prims.strcat "mk_app (" s) ") (") _132_156))
in (Prims.strcat _132_157 ")"))) s args)
end)
end
end
end))
end
| FStar_Extraction_ML_Syntax.MLE_Fun (bs, body) -> begin
(let body_str = (extract_mlexp body)
in (FStar_List.fold_left (fun s _65_363 -> (match (_65_363) with
| ((b, _65_360), t) -> begin
(let _132_163 = (let _132_162 = (let _132_161 = (let _132_160 = (mk_varname b t)
in (Prims.strcat "mk_abs (" _132_160))
in (Prims.strcat _132_161 ") ("))
in (Prims.strcat _132_162 s))
in (Prims.strcat _132_163 ")"))
end)) body_str (FStar_List.rev bs)))
end
| FStar_Extraction_ML_Syntax.MLE_Match (e, bs) -> begin
(let _65_371 = (check_pats_for_bool bs)
in (match (_65_371) with
| (b, e1, e2) -> begin
if b then begin
(let _132_171 = (let _132_170 = (let _132_168 = (let _132_167 = (let _132_165 = (let _132_164 = (extract_mlexp e)
in (Prims.strcat "mk_cond (" _132_164))
in (Prims.strcat _132_165 ") ("))
in (let _132_166 = (extract_mlexp e1)
in (Prims.strcat _132_167 _132_166)))
in (Prims.strcat _132_168 ") ("))
in (let _132_169 = (extract_mlexp e2)
in (Prims.strcat _132_170 _132_169)))
in (Prims.strcat _132_171 ")"))
end else begin
(FStar_All.failwith "Only if-then-else patterns are supported")
end
end))
end
| FStar_Extraction_ML_Syntax.MLE_Coerce (e, _65_374, _65_376) -> begin
(extract_mlexp e)
end
| FStar_Extraction_ML_Syntax.MLE_If (e, e1, e2_opt) -> begin
(match (e2_opt) with
| None -> begin
(FStar_All.failwith "If Then Else should have an else branch?")
end
| Some (e2) -> begin
(let _132_179 = (let _132_178 = (let _132_176 = (let _132_175 = (let _132_173 = (let _132_172 = (extract_mlexp e)
in (Prims.strcat "mk_cond (" _132_172))
in (Prims.strcat _132_173 ") ("))
in (let _132_174 = (extract_mlexp e1)
in (Prims.strcat _132_175 _132_174)))
in (Prims.strcat _132_176 ") ("))
in (let _132_177 = (extract_mlexp e2)
in (Prims.strcat _132_178 _132_177)))
in (Prims.strcat _132_179 ")"))
end)
end
| _65_388 -> begin
(FStar_All.failwith "This expression extraction is not supported yet")
end)
end))
and extract_wysteria_specific_ast = (fun _65_392 args t -> (match (_65_392) with
| {FStar_Extraction_ML_Syntax.expr = f; FStar_Extraction_ML_Syntax.ty = _65_390} -> begin
(match (f) with
| FStar_Extraction_ML_Syntax.MLE_Name (_65_396, s) -> begin
if (s = "main") then begin
(let f = (let _132_183 = (FStar_List.tl args)
in (FStar_List.hd _132_183))
in (let f_exp = (extract_mlexp f)
in (Prims.strcat (Prims.strcat "mk_app (" f_exp) ") (E_const (C_unit ()))")))
end else begin
if (s = "w_read_int") then begin
(let inj_str = (get_injection t)
in (Prims.strcat (Prims.strcat "mk_ffi 1 \"FFI.read_int\" FFI.read_int [ E_const (C_unit ()) ] (" inj_str) ")"))
end else begin
if (s = "w_read_int_tuple") then begin
(let inj_str = (get_injection t)
in (Prims.strcat (Prims.strcat "mk_ffi 1 \"FFI.read_int_tuple\" FFI.read_int_tuple [ E_const (C_unit ()) ] (" inj_str) ")"))
end else begin
if (s = "w_read_int_list") then begin
(let inj_str = (get_injection t)
in (Prims.strcat (Prims.strcat "mk_ffi 1 \"FFI.read_int_list\" FFI.read_int_list [ E_const (C_unit ()) ] (" inj_str) ")"))
end else begin
(let r = (lookup_wys_lib_map s)
in (let args = (sublist s args r.rem_args)
in (FStar_List.fold_left (fun acc arg -> (let _132_187 = (let _132_186 = (extract_mlexp arg)
in (Prims.strcat (Prims.strcat acc " (") _132_186))
in (Prims.strcat _132_187 ")"))) r.extracted_fn_name args)))
end
end
end
end
end
| _65_410 -> begin
(FStar_All.failwith "Expected wysteria lib fn to be a MLE_Name")
end)
end))

let extract_mllb = (fun _65_413 -> (match (_65_413) with
| (b, l) -> begin
if ((FStar_List.length l) <> 1) then begin
(FStar_All.failwith "Mutually recursive lets are not yet suppored")
end else begin
(let lb = (FStar_List.hd l)
in (let lbname = (FStar_Extraction_ML_Syntax.idsym lb.FStar_Extraction_ML_Syntax.mllb_name)
in (let lbbody = lb.FStar_Extraction_ML_Syntax.mllb_def
in if b then begin
(match (lbbody.FStar_Extraction_ML_Syntax.expr) with
| FStar_Extraction_ML_Syntax.MLE_Fun (bs, e) -> begin
(let _65_423 = (let _132_191 = (FStar_List.hd bs)
in (let _132_190 = (FStar_List.tl bs)
in (_132_191, _132_190)))
in (match (_65_423) with
| (first_b, rest_bs) -> begin
(let body_exp = (extract_mlexp e)
in (let tl_abs_exp = (FStar_List.fold_left (fun e _65_428 -> (match (_65_428) with
| (bname, btyp) -> begin
(let _132_197 = (let _132_196 = (let _132_195 = (let _132_194 = (mk_varname (FStar_Extraction_ML_Syntax.idsym bname) btyp)
in (Prims.strcat "mk_abs (" _132_194))
in (Prims.strcat _132_195 ") ("))
in (Prims.strcat _132_196 e))
in (Prims.strcat _132_197 ")"))
end)) body_exp (FStar_List.rev rest_bs))
in (let fix_exp = (let _132_204 = (let _132_203 = (let _132_202 = (let _132_201 = (let _132_199 = (let _132_198 = (mk_varname lbname lbbody.FStar_Extraction_ML_Syntax.ty)
in (Prims.strcat "mk_fix (" _132_198))
in (Prims.strcat _132_199 ") ("))
in (let _132_200 = (mk_varname (FStar_Extraction_ML_Syntax.idsym (Prims.fst first_b)) (Prims.snd first_b))
in (Prims.strcat _132_201 _132_200)))
in (Prims.strcat _132_202 ") ("))
in (Prims.strcat _132_203 tl_abs_exp))
in (Prims.strcat _132_204 ")"))
in (let _132_206 = (let _132_205 = (mlty_to_typ lbbody.FStar_Extraction_ML_Syntax.ty)
in (lbname, _132_205, fix_exp))
in Mk_tlet (_132_206)))))
end))
end
| _65_432 -> begin
(FStar_All.failwith "Recursive let binding is not an abstraction ?")
end)
end else begin
(let _132_209 = (let _132_208 = (mlty_to_typ lbbody.FStar_Extraction_ML_Syntax.ty)
in (let _132_207 = (extract_mlexp lbbody)
in (lbname, _132_208, _132_207)))
in Mk_tlet (_132_209))
end)))
end
end))

let extract_mlmodule = (fun m -> (FStar_List.fold_left (fun _65_436 tld -> (match (_65_436) with
| (l, top_opt) -> begin
(match (tld) with
| FStar_Extraction_ML_Syntax.MLM_Ty (_65_439) -> begin
(l, top_opt)
end
| FStar_Extraction_ML_Syntax.MLM_Exn (_65_442) -> begin
(FStar_All.failwith "Cannot extract an exception")
end
| FStar_Extraction_ML_Syntax.MLM_Let (lb) -> begin
(let _132_216 = (let _132_215 = (let _132_214 = (extract_mllb lb)
in (_132_214)::[])
in (FStar_List.append l _132_215))
in (_132_216, top_opt))
end
| FStar_Extraction_ML_Syntax.MLM_Top (e) -> begin
(match (top_opt) with
| None -> begin
(let _132_218 = (let _132_217 = (extract_mlexp e)
in Some (_132_217))
in (l, _132_218))
end
| Some (_65_450) -> begin
(FStar_All.failwith "Impossible: more than one top expressions")
end)
end)
end)) ([], None) m))

let rec find_smc_module = (fun mllibs -> (let rec find_smc_module' = (fun mllib -> (match (mllib) with
| [] -> begin
None
end
| (x, mlsig_opt, FStar_Extraction_ML_Syntax.MLLib (mllib'))::tl -> begin
if (x = "SMC") then begin
(match (mlsig_opt) with
| Some (_65_464, m) -> begin
Some (m)
end
| None -> begin
(Prims.raise (FStar_Util.NYI ("Found the SMC module name but no module")))
end)
end else begin
(let m_opt = (find_smc_module' mllib')
in (match (m_opt) with
| Some (m) -> begin
Some (m)
end
| None -> begin
(find_smc_module' tl)
end))
end
end))
in (match (mllibs) with
| [] -> begin
None
end
| FStar_Extraction_ML_Syntax.MLLib (s)::tl -> begin
(let m_opt = (find_smc_module' s)
in (match (m_opt) with
| Some (m) -> begin
Some (m)
end
| None -> begin
(find_smc_module tl)
end))
end)))

let mltyp_to_string = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Named (_65_484, p) -> begin
(FStar_Extraction_ML_Syntax.string_of_mlpath p)
end
| _65_489 -> begin
"Something other than named type"
end))

let rec get_iface_arg_ret_typ = (fun t -> (match (t) with
| FStar_Extraction_ML_Syntax.MLTY_Fun (arg, _65_493, ret) -> begin
(match (ret) with
| FStar_Extraction_ML_Syntax.MLTY_Fun (_65_498, _65_500, _65_502) -> begin
(get_iface_arg_ret_typ ret)
end
| _65_506 -> begin
(arg, ret)
end)
end
| _65_508 -> begin
(FStar_All.failwith "Get wys arg ret type has a non-arrow type")
end))

let extract_smc_exports = (fun g -> (FStar_List.fold_left (fun s b -> (match (b) with
| FStar_Extraction_ML_Env.Fv (fvv, _65_514, t) -> begin
if (FStar_Util.starts_with fvv.FStar_Absyn_Syntax.v.FStar_Absyn_Syntax.str "Smciface") then begin
(let fn_name = fvv.FStar_Absyn_Syntax.v.FStar_Absyn_Syntax.ident.FStar_Absyn_Syntax.idText
in (let _65_521 = (get_iface_arg_ret_typ (Prims.snd t))
in (match (_65_521) with
| (arg, ret) -> begin
(let arg_inj = (get_constant_injection arg "x")
in (let s0 = (Prims.strcat (Prims.strcat "let " fn_name) " ps p x = \n")
in (let s1 = "let e1 = mk_const (C_eprins ps) in\n"
in (let s2 = (Prims.strcat (Prims.strcat "let e2 = mk_mkwire (mk_const (C_eprins (singleton p))) (mk_box (mk_const (C_eprins (singleton p))) (mk_const (" arg_inj) "))) in\n")
in (let s3 = (let _132_232 = (let _132_231 = (mlty_to_typ (Prims.snd t))
in (Prims.strcat (Prims.strcat (Prims.strcat "let dv = Interpreteriface.run p \"" fn_name) "\" ") _132_231))
in (Prims.strcat _132_232 " [e1; e2] in\n"))
in (let s4 = "Obj.magic (Interpreteriface.project_value_content dv)\n"
in (Prims.strcat (Prims.strcat s (Prims.strcat (Prims.strcat (Prims.strcat (Prims.strcat s0 s1) s2) s3) s4)) "\n\n")))))))
end)))
end else begin
s
end
end
| _65_529 -> begin
s
end)) "" g.FStar_Extraction_ML_Env.gamma))

let extract = (fun l en -> (let _65_532 = (initialize ())
in (let _65_536 = (let _132_237 = (FStar_Extraction_ML_Env.mkContext en)
in (FStar_Util.fold_map FStar_Extraction_ML_ExtractMod.extract _132_237 l))
in (match (_65_536) with
| (c, mllibs) -> begin
(let mllibs = (FStar_List.flatten mllibs)
in (let m_opt = (find_smc_module mllibs)
in (let s_smc = (match (m_opt) with
| Some (m) -> begin
(let _65_543 = (extract_mlmodule m)
in (match (_65_543) with
| (l, m_opt) -> begin
(FStar_List.fold_left (fun s _65_549 -> (match (_65_549) with
| Mk_tlet (n, t, b) -> begin
(Prims.strcat (Prims.strcat (Prims.strcat (Prims.strcat (Prims.strcat (Prims.strcat (Prims.strcat s "(") (name_to_string n)) ", (") t) "), (") b) "));\n")
end)) "" l)
end))
end
| _65_551 -> begin
""
end)
in (let prog = (let _132_240 = (FStar_Options.prependOutputDir "prog.ml")
in (FStar_Util.open_file_for_writing _132_240))
in (let _65_554 = (FStar_Util.append_to_file prog "open AST")
in (let _65_556 = (FStar_Util.append_to_file prog "open FFI")
in (let _65_558 = (FStar_Util.append_to_file prog "\n")
in (let _65_560 = (FStar_Util.append_to_file prog "let const_meta = Meta ([], Can_b, [], Can_w)")
in (let _65_562 = (FStar_Util.append_to_file prog "\n")
in (let _65_564 = (FStar_Util.append_to_file prog (Prims.strcat (Prims.strcat "let program = [\n" s_smc) "]"))
in (FStar_Util.close_file prog)))))))))))
end))))




