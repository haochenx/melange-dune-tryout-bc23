let () = print_endline "hello melange?!"

module Printexc = struct
  module Printexc_re' : sig
    val to_string : exn -> string
    val print : ('a -> 'b) -> 'a -> 'b
    val catch : ('a -> 'b) -> 'a -> 'b
    val register_printer : (exn -> string option) -> unit
  end = struct
    include[@warning "-3"] Printexc
  end
  include Printexc_re'
  type raw_backtrace
end

module ImportedDate = struct
  type t
  external _create : unit -> t = "Date"
  [@@bs.new]
  external _getTime : t -> float = "getTime"
  [@@bs.send]
end

let get_sys_current_time_millis () = ImportedDate.(_create() |> _getTime)

let foo : int list -> int = fun xs -> Belt.List.reduce xs 0 (+)

let bar : int -> int -> int = fun a b -> Caml.caml_int_max a b

