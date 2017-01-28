module Pages.Dashboard.Update exposing (update)

import Pages.Dashboard.Model exposing (Model, Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            ( model
            , Cmd.none
            )
