(* $Id: subst.mli,v 1.1 2013/11/28 08:50:10 swinkler Exp $ *)

type t = Term.subst

exception Not_unifiable
exception Not_matched

val mgu : Term.t -> Term.t -> t

val mgu_list : (Term.t * Term.t) list -> t

val unifiable : Term.t -> Term.t -> bool

val pattern_match : Term.t -> Term.t -> t

val is_instance_of : Term.t -> Term.t -> bool

val enc : Term.t -> Term.t -> bool
