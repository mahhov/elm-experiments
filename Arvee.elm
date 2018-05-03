module Arvee exposing (..)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)

quote : String
quote = "9.50"

type LiabilityCoverage = Medical | BodilyInjury | Uninsured
type RangeCoverage = Comprehensive | Collision
type YesNoCoverage = Rental | Roadside
type Coverage = C1 LiabilityCoverage | C2 RangeCoverage | C3 YesNoCoverage

display : Coverage -> String
display coverage =
  case coverage of
    C2 Comprehensive -> "Comprehensive coverage"
    C2 Collision -> "Collision coverage"
    C1 Medical -> "Medical coverage"
    C1 BodilyInjury -> "Bodily Injury coverage"
    C1 Uninsured -> "Uninsure coverage"
    C3 Rental -> "Rental reimbursement coverage"
    C3 Roadside -> "Roadside coverage"

prices : RangeCoverage -> List Int
prices coverage =
  case coverage of
    Comprehensive -> [100, 200, 300]
    Collision -> [50, 150, 250]
    
price : LiabilityCoverage -> Int
price coverage =
  case coverage of
    Medical -> 100
    BodilyInjury -> 200
    Uninsured -> 300
    
toLi : LiabilityCoverage -> Html msg
toLi coverage =
  li [] [
         h3 [] [ display (C1 coverage) |> text ] 
         , div [] [ price coverage |> toString |> text ]]
         
coveragesListStyle : List Style
coveragesListStyle = [listStyle none]

liabilityCoverages : List LiabilityCoverage
liabilityCoverages = [ Medical, BodilyInjury, Uninsured ]

view : Model -> Html Msg
view model =
    div [] [
        text (display (C2 Comprehensive))
        , ul [ css coveragesListStyle]
          (List.map toLi liabilityCoverages)
        , text ("Your new insurance will cost $" ++ quote)
      ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { view = view >> toUnstyled
        , update = update
        , model = initialModel
        }


update : Msg -> Model -> Model
update msg model =
    model


type Msg
    = DoSomething


type alias Model =
    ()


initialModel : Model
initialModel =
    ()