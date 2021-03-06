module type T = sig
  type t
  val terms : t -> Rule.t
  val rule : t -> Rule.t
  val compare : t -> t -> int
  val equal : t -> t -> bool
  val of_rule : Yices.context -> Rule.t -> t
  (* Whether node is superfluous *)
  val is_trivial : t -> bool
  (* Returns a combination of the two nodes if they are equivalent, and None
     otherwise. Check only equality, ie. assume normalization *)
  val combine : t -> t -> t option
  (* Returns a combination of the two nodes if one subsumes the other,
     and None otherwise (more expensive than plain combine) *)
  val combine_subsumed : t -> t -> t option
  (* Mirror its terms *)
  val flip : t -> t
  (* Apply rule function *)
  val rule_map : (Rule.t -> Rule.t) -> t -> t
  (* Rename variables in node in a uniform way *)
  val normalize : t -> t
  (* Compute critical pairs of rule n and rule n'. Result is not normalized *)
  val cps : t -> t -> t list
  (* Compute normal form of term with respect to rules. Upon progress, return
    pair (old, ns) of (modified) old and new nodes. Result is not normalized  *)
  val nf_with : t list -> t -> (t list * t list * Rule.t list) option
  (* whether the TRS joins the equation *)
  val joins : Rules.t -> t -> bool
  val print : Format.formatter -> t -> unit
end

module Equation : T with type t = Term.t * Term.t

module ConstraintEquality : T
