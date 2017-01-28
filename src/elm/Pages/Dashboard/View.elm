module Pages.Dashboard.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Pages.Dashboard.Model exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ h1 [ class "ui header" ] [ text "Dashboard" ]
        , div
            [ class "ui divider" ]
            [ viewSuspects model.suspects
            , viewWeapons model.weapons
            ]
        ]


viewSuspects : List Suspect -> Html Msg
viewSuspects suspects =
    div
        [ class "suspects-container" ]
        (h2 [] [ text "List of suspects" ]
            :: List.map viewSuspect suspects
        )


viewSuspect : Suspect -> Html Msg
viewSuspect suspect =
    div
        [ class "suspect-wrapper" ]
        [ h3
            [ class "suspect" ]
            [ text suspect.name ]
        , viewDiscardMessage suspect
        , viewReasons suspect.possibleReasons
        ]


viewReasons : List Reason -> Html Msg
viewReasons reasons =
    ul
        []
        (List.map viewReason reasons)


viewReason : Reason -> Html Msg
viewReason reason =
    li
        []
        [ div
            []
            [ text reason.name ]
        , div
            []
            [ strong [] [ text <| toString reason.kind ] ]
        , viewDiscardMessage reason
        ]


viewWeapons : List Weapon -> Html Msg
viewWeapons weapons =
    div
        [ class "weapons-container" ]
        [ h2 [] [ text "List of Weapons" ]
        , table
            []
            (tr
                []
                [ td [ class "name" ] [ text "Name" ]
                , td [ class "type" ] [ text "Type" ]
                , td [ class "symptoms" ] [ text "Symptoms" ]
                , td [ class "discarded" ] [ text "Is discarded?" ]
                ]
                :: List.map viewWeapon weapons
            )
        ]


viewWeapon : Weapon -> Html Msg
viewWeapon weapon =
    tr
        []
        [ td [ class "name" ] [ text weapon.name ]
        , td [ class "type" ] [ text <| toString weapon.kind ]
        , td [ class "symptoms" ] [ text <| toString weapon.symptoms ]
        , td [ class "discarded" ] [ viewDiscardMessage weapon ]
        ]


viewDiscardMessage : { a | discarded : Bool } -> Html Msg
viewDiscardMessage object =
    if .discarded object then
        div
            []
            [ text "Discarded" ]
    else
        div
            []
            [ text "Not discarded" ]
