module App.Model exposing (emptyModel, Msg(..), Model)

import App.PageType exposing (Page(..))
import Pages.Dashboard.Model as Dashboard exposing (emptyGame)


type Msg
    = SetActivePage Page
    | MsgDashboard Dashboard.Msg


type alias Model =
    { activePage : Page
    , game : Dashboard.Model
    }


emptyModel : Model
emptyModel =
    { activePage = Dashboard
    , game = emptyGame
    }
