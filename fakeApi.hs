module Api where

callApi :: String -> String -> IO()
callApi rootUrl path = 
    putStrLn $ "calling: " ++ rootUrl ++ "/" ++ path
