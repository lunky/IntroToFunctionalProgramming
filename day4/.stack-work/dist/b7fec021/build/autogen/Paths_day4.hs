{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_day4 (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "D:\\git\\IntroToFunctionalProgramming\\day4\\.stack-work\\install\\eb32346d\\bin"
libdir     = "D:\\git\\IntroToFunctionalProgramming\\day4\\.stack-work\\install\\eb32346d\\lib\\x86_64-windows-ghc-8.0.1\\day4-0.1.0.0-7USI4MQsS1HFcbVwywqYLQ"
datadir    = "D:\\git\\IntroToFunctionalProgramming\\day4\\.stack-work\\install\\eb32346d\\share\\x86_64-windows-ghc-8.0.1\\day4-0.1.0.0"
libexecdir = "D:\\git\\IntroToFunctionalProgramming\\day4\\.stack-work\\install\\eb32346d\\libexec"
sysconfdir = "D:\\git\\IntroToFunctionalProgramming\\day4\\.stack-work\\install\\eb32346d\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "day4_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "day4_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "day4_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "day4_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "day4_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
