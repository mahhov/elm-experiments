module Arvee exposing (..)

import Html exposing (..)

quote : String
quote = "9.50"

type LiabilityCoverage = Medical | BodilyInjury | Uninsured
type RangeCoverage = Comprehensive | Collision
type YesNoCoverage = Rental | Roadside

display : RangeCoverage -> String
display coverage =
  case coverage of
    Comprehensive -> "Comprehensive coverage"
    Collision -> "Collision coverage"

prices : RangeCoverage -> List Int
prices coverage =
  case coverage of
    Comprehensive -> [100, 200, 300]
    Collision -> [50, 150, 250]
    
toLi : String -> Html msg
toLi s =
  li [] [ text s ]

main =
  div [] [
    text (display Comprehensive)
    , ul [] 
      (List.map toLi (List.map toString (prices Comprehensive)))
    , text ("Your new insurance will cost $" ++ quote)
  ]
