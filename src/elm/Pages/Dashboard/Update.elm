module Pages.Dashboard.Update exposing (update)

import Pages.Dashboard.Model exposing (Model, Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DiscardReason reason ->
            let
                suspects =
                    List.map (discardReasonFromSuspect reason) model.suspects
            in
                ( model
                , Cmd.none
                )

        DiscardSuspect suspect ->
            ( model
            , Cmd.none
            )

        DiscardWeapon weapon ->
            ( model
            , Cmd.none
            )


discardReasonFromSuspect : Reason -> Suspect -> Suspect
discardReasonFromSuspect reason suspect =
    suspect
