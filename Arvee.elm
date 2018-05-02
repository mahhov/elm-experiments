module Arvee exposing (..)

import Html exposing (..)
import Css exposing (..)
import Style exposing (..)

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
coveragesListStyle = [listStyle, none]

liabilityCoverages : List LiabilityCoverage
liabilityCoverages = [ Medical, BodilyInjury, Uninsured ]

main =
  div [] [
    text (display (C2 Comprehensive))
    , ul [ style coveragesListStyle] 
      (List.map toLi liabilityCoverages)
    , text ("Your new insurance will cost $" ++ quote)
  ]
