module App.Update exposing (init, update, subscriptions)

import App.Model exposing (..)
import Pages.Dashboard.Update as Dashboard


init : ( Model, Cmd Msg )
init =
    ( emptyModel
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetActivePage page ->
            ( { model | activePage = page }
            , Cmd.none
            )

        MsgDashboard subMsg ->
            let
                ( game, command ) =
                    Dashboard.update subMsg model.game
            in
                ( { model | game = game }
                , Cmd.none
                )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        []
