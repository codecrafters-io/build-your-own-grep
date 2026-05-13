-module(main_ffi).
-export([get_line/1]).

-spec get_line(binary()) -> {ok, binary()} | {error, eof | no_data}.
get_line(Prompt) ->
    case io:get_line(Prompt) of
        eof -> {error, eof};
        {error, _} -> {error, no_data};
        Data when is_binary(Data) -> {ok, Data};
        Data when is_list(Data) -> {ok, unicode:characters_to_binary(Data)}
    end.
