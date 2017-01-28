module App.View exposing (..)

import App.Model exposing (..)
import App.PageType exposing (Page(..))
import Html exposing (..)
import Html.Attributes exposing (class, classList, href, src, style, target)
import Html.Events exposing (onClick)
import Pages.Dashboard.View as Dashboard


view : Model -> Html Msg
view model =
    div []
        [ div [ class "ui container main" ]
            [ div
                [ class "pusher" ]
                [ div
                    [ class "ui grid container" ]
                    [ div
                        [ class "ui main grid" ]
                        [ viewMainContent model
                        ]
                    ]
                ]
            ]
        ]


viewMainContent : Model -> Html Msg
viewMainContent model =
    Html.map MsgDashboard <|
        Dashboard.view model.game


{-| Get menu items classes. This function gets the active page and checks if
it is indeed the page used.
-}
classByPage : Page -> Page -> Attribute a
classByPage page activePage =
    classList
        [ ( "item", True )
        , ( "active", page == activePage )
        ]
