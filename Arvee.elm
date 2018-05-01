module Arvee exposing (..)

import Html exposing (..)

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
    
toLi : String -> Html msg
toLi s =
  li [] [ text s ]

main =
  div [] [
    text (display (C2 Comprehensive))
    , ul [] 
      (List.map toLi (List.map toString (prices Comprehensive)))
    , text ("Your new insurance will cost $" ++ quote)
  ]
