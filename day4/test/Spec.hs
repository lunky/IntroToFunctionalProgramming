import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
  describe "Lib" $ do 
    describe "Test harness" $ do 
        it "demonstrates that tests are working" $ do
          1 `shouldBe` 1

    describe "parseName" $ do 
      it "should parse name and checksum" $ do
        let input =   "aaaaa-bbb-z-y-x-123[abxyz]"
        let output = ("aaaaa-bbb-z-y-x", "123", "abxyz")
        parseName input `shouldBe` output

      it "should parse name and checksum 2" $ do
        let input =   "plolwdub-judgh-frqvxphu-judgh-sodvwlf-judvv-frqwdlqphqw-959[duhlq]"
        let output = ("plolwdub-judgh-frqvxphu-judgh-sodvwlf-judvv-frqwdlqphqw", "959", "duhlq")
        parseName input `shouldBe` output

    describe "testRealRoom" $ do 
      it "should be real 1" $ do
        let input = "aaaaa-bbb-z-y-x-123[abxyz]"
        let output = 123
        testRealRoom input `shouldBe` output
      it "should be real 1" $ do
        let input = "nzydfxpc-rclop-qwzhpc-qtylyntyr-769[oshgk]"
        let output = 0 
        testRealRoom input `shouldBe` output

      it "should be real 2" $ do
        let input = "a-b-c-d-e-f-g-h-987[abcde]"
        let output = 987
        testRealRoom input `shouldBe` output

      it "should not be real" $ do
        let input = "totally-real-room-200[decoy]"
        let output = 0
        testRealRoom input `shouldBe` output

      it "should be a real room" $ do 
        let input = "not-a-real-room-404[oarel]"
        let output = 404
        testRealRoom input `shouldBe` output

      it "should compute a checksum" $ do
        let input = "aaaaa-bbb-z-y-x"
        let output = "abxyz"
        getChecksum input `shouldBe` output

    describe "sum" $ do
      it "should sum the answers" $ do
        let input = "aaaaa-bbb-z-y-x-123[abxyz]\na-b-c-d-e-f-g-h-987[abcde]\nnot-a-real-room-404[oarel]\ntotally-real-room-200[decoy]"
        let output = 1514
        sumSectorIds input `shouldBe` output

    describe "decryptName" $ do
      it "should decrypt the string" $ do
        let input =   "qzmt-zixmtkozy-ivhz-343[lkjlk]"
        let output =  "very encrypted name"
        decryptName input `shouldBe` output

      it "should decrypt the answer" $ do
        let input =   "ijmockjgz-jwezxo-nojmvbz-993[jozmb]"
        let output =  "northpole object storage"
        decryptName input `shouldBe` output
