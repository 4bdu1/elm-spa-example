module Data.User.Username exposing (Username, decoder, encode, parser, toHtml, toString)

import Html exposing (Html)
import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode exposing (Value)
import Url.Parser


type Username
    = Username String


toString : Username -> String
toString (Username username) =
    username


parser : Url.Parser.Parser (Username -> a) a
parser =
    Url.Parser.custom "USERNAME" (\str -> Just (Username str))


decoder : Decoder Username
decoder =
    Decode.map Username Decode.string


encode : Username -> Value
encode (Username username) =
    Encode.string username


toHtml : Username -> Html msg
toHtml (Username username) =
    Html.text username
