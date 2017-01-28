module Pages.Dashboard.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Pages.Dashboard.Model exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ div
            [ class "ui divider" ]
            [ viewSuspects model.suspects
            , viewWeapons model.weapons
            , viewLocations model.locations
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
        , viewDiscardMessage <| DiscardSuspect suspect
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
        , viewDiscardMessage <| DiscardReason reason
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
        , td [ class "discarded" ] [ viewDiscardMessage <| DiscardWeapon weapon ]
        ]


viewLocations : List Location -> Html Msg
viewLocations locations =
    div
        [ class "locations-container" ]
        [ h2 [] [ text "Locations" ]
        , table
            []
            (tr
                []
                [ td [ class "name" ] [ text "Name" ]
                , td [ class "weapons" ] [ text "Weapons on it" ]
                , td [ class "number-of-people" ] [ text "Number of people" ]
                , td [ class "who-was-here" ] [ text "Who was here" ]
                ]
                :: List.map viewLocation locations
            )
        ]


viewLocation : Location -> Html Msg
viewLocation location =
    tr
        []
        [ td [ class "name" ] [ text location.name ]
        , td [ class "weapons" ] [ text <| viewNameOfItems location.weapons ]
        , td [ class "number-of-people" ] [ text <| viewNumberOfPeople location.numberOfPeople ]
        , td [ class "who-was-here" ] [ text <| viewNameOfItems location.peopleOnIt ]
        ]


viewNameOfItems : List { a | name : String } -> String
viewNameOfItems items =
    String.concat <|
        List.intersperse ", " <|
            List.map .name items


viewNumberOfPeople : Maybe Int -> String
viewNumberOfPeople amount =
    case amount of
        Nothing ->
            "Unknown"

        Just aNumber ->
            toString amount


viewDiscardMessage : Msg -> Html Msg
viewDiscardMessage msg =
    let
        isDiscarded =
            case msg of
                DiscardReason reason ->
                    reason.discarded

                DiscardSuspect suspect ->
                    suspect.discarded

                DiscardWeapon weapon ->
                    weapon.discarded
    in
        if isDiscarded then
            div
                []
                [ text "Discarded" ]
        else
            div
                [ onClick <| msg ]
                [ text "Not discarded" ]
