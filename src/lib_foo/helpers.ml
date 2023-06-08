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

