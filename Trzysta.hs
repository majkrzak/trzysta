import Network.Wai (responseLBS, Application, remoteHost, requestHeaderHost, rawPathInfo, rawQueryString)
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (movedPermanently301)
import Network.HTTP.Types.Header (hLocation)
import Data.Maybe (fromMaybe)

main :: IO()
main = run 8080 app

app :: Application
app req respond = do
  print req
  respond $
    responseLBS
      movedPermanently301
      [ ( hLocation
        , "https"
        <> "://"
        <> fromMaybe "" (requestHeaderHost req)
        <> rawPathInfo req
        <> rawQueryString req
        )
      ] ""
