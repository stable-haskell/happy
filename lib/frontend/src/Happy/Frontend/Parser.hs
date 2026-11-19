{-# OPTIONS_GHC -w #-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE PatternGuards #-}
{-# LANGUAGE NoStrictData #-}
{-# OPTIONS_GHC -w #-}
module Happy.Frontend.Parser (ourParser) where
import Happy.Frontend.ParseMonad.Class
import Happy.Frontend.ParseMonad
import Happy.Frontend.AbsSyn
import Happy.Frontend.Lexer
import qualified Control.Monad as Happy_Prelude
import qualified Data.Bool as Happy_Prelude
import qualified Data.Eq as Happy_Prelude
import qualified Data.Function as Happy_Prelude
import qualified Data.Functor as Happy_Prelude
import qualified Data.Int as Happy_Prelude
import qualified Data.List as Happy_Prelude
import qualified Data.Maybe as Happy_Prelude
import qualified Data.Ord as Happy_Prelude
import qualified Data.String as Happy_Prelude
import qualified Data.Tuple as Happy_Prelude
import qualified Text.Show as Happy_Prelude
import qualified Data.Foldable as Happy_Prelude (sequence_)
#if defined(__GLASGOW_HASKELL__)
import qualified GHC.Num as Happy_Prelude
import qualified GHC.Err as Happy_Prelude
import qualified GHC.Exts as Happy_Prelude
#else
import qualified Data.Num as Happy_Prelude
import qualified Control.Error as Happy_Prelude
#endif
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 2.2.1

data HappyAbsSyn 
        = HappyTerminal (Token)
        | HappyErrorToken Happy_Prelude.Int
        | HappyAbsSyn5 (BookendedAbsSyn)
        | HappyAbsSyn6 (AbsSyn String)
        | HappyAbsSyn7 ([Rule String])
        | HappyAbsSyn8 (Rule String)
        | HappyAbsSyn9 ([String])
        | HappyAbsSyn11 ([Prod String])
        | HappyAbsSyn12 (Prod String)
        | HappyAbsSyn13 (Term)
        | HappyAbsSyn14 ([Term])
        | HappyAbsSyn17 (Prec)
        | HappyAbsSyn18 ([Directive String])
        | HappyAbsSyn19 (Directive String)
        | HappyAbsSyn20 (Maybe String)
        | HappyAbsSyn21 ([(String, TokenSpec)])
        | HappyAbsSyn22 ((String, TokenSpec))

{-# NOINLINE happyTokenStrings #-}
happyTokenStrings = ["id","spec_tokentype","spec_token","spec_name","spec_partial","spec_lexer","spec_imported_identity","spec_monad","spec_nonassoc","spec_left","spec_right","spec_prec","spec_shift","spec_expect","spec_error","spec_errorexpected","spec_errorhandlertype","spec_attribute","spec_attributetype","pragma","code","int","\":\"","\";\"","\"::\"","\"%%\"","\"|\"","\"(\"","\")\"","\",\"","%eof"]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA (Happy_Data_Array.listArray (0,97) ([3,(-1),48,0,31,0,48,(-2),0,60,66,81,82,63,0,64,85,85,85,22,67,0,86,88,69,0,70,0,71,0,0,92,0,0,73,74,95,95,0,96,77,0,0,98,0,98,0,72,0,0,0,0,0,0,80,0,0,0,83,45,101,0,23,0,102,84,0,9,0,79,0,59,106,87,0,107,0,108,0,89,110,0,111,90,113,0,113,0,0,93,0,46,0,115,0,0,0,0
	]))

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA (Happy_Data_Array.listArray (0,97) ([12,0,100,0,43,0,103,109,0,0,58,0,0,0,0,0,112,114,116,0,0,0,0,0,0,0,0,0,105,0,0,117,0,0,0,0,118,121,0,62,0,0,0,78,0,122,0,123,0,0,0,0,0,0,0,0,0,0,0,0,124,0,0,0,13,0,0,0,0,0,0,119,120,0,0,0,0,44,0,0,0,0,20,0,52,0,57,0,0,0,0,0,0,129,0,0,0,0
	]))

happyAdjustOffset :: Happy_Prelude.Int -> Happy_Prelude.Int
happyAdjustOffset = Happy_Prelude.id

happyDefActions :: HappyAddr
happyDefActions = HappyA (Happy_Data_Array.listArray (0,96) ([(-59),0,(-57),(-58),0,(-56),(-57),0,(-29),0,0,0,0,0,(-34),0,(-55),(-55),(-55),0,0,(-45),0,0,0,(-47),0,(-46),(-57),(-43),(-41),(-55),(-42),(-40),(-36),0,(-50),(-50),(-31),(-52),0,(-30),(-28),0,(-2),(-3),(-5),(-10),(-53),(-51),(-32),(-49),(-33),(-35),(-37),(-54),(-44),(-48),(-38),0,0,(-4),0,(-11),(-20),0,(-39),0,(-8),(-14),(-21),(-27),(-19),(-17),(-9),0,(-12),0,(-22),0,0,(-26),(-20),0,(-20),(-6),(-20),(-13),(-25),(-16),(-23),0,(-18),0,(-15),(-7),(-24)
	]))

happyCheck :: HappyAddr
happyCheck = HappyA (Happy_Data_Array.listArray (0,161) ([(-1),3,4,5,6,7,8,9,10,11,12,2,0,15,16,17,18,19,20,6,7,8,9,10,21,27,6,7,8,9,10,32,20,24,3,4,5,6,7,8,9,10,11,12,1,23,15,16,17,18,19,20,8,30,31,11,13,14,6,7,8,9,10,6,7,8,9,10,2,24,22,26,13,14,16,17,30,31,16,17,2,3,22,2,2,22,22,2,2,22,2,22,22,22,2,22,22,2,2,22,2,29,22,2,2,22,22,28,2,2,2,22,2,2,24,2,29,2,25,19,(-1),(-1),19,14,19,3,(-1),4,8,5,18,12,18,15,18,18,15,8,(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1),(-1)
	]))

happyTable :: HappyAddr
happyTable = HappyA (Happy_Data_Array.listArray (0,161) ([0,10,11,12,13,14,15,16,17,18,19,84,1,20,21,22,23,24,25,68,69,70,71,72,4,44,87,69,70,71,72,(-1),2,85,10,11,12,13,14,15,16,17,18,19,6,30,20,21,22,23,24,25,90,75,76,91,7,8,85,69,70,71,72,95,69,70,71,72,41,65,6,66,81,82,38,39,93,94,49,39,45,46,42,38,37,36,35,32,28,29,27,26,58,6,32,55,54,52,41,49,48,61,59,64,74,67,68,83,74,77,74,90,89,74,87,74,78,74,95,4,0,0,44,42,56,61,0,59,78,62,33,79,32,52,30,55,50,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	]))

happyReduceArr = Happy_Data_Array.array (1, 58) [
        (1 , happyReduce_1),
        (2 , happyReduce_2),
        (3 , happyReduce_3),
        (4 , happyReduce_4),
        (5 , happyReduce_5),
        (6 , happyReduce_6),
        (7 , happyReduce_7),
        (8 , happyReduce_8),
        (9 , happyReduce_9),
        (10 , happyReduce_10),
        (11 , happyReduce_11),
        (12 , happyReduce_12),
        (13 , happyReduce_13),
        (14 , happyReduce_14),
        (15 , happyReduce_15),
        (16 , happyReduce_16),
        (17 , happyReduce_17),
        (18 , happyReduce_18),
        (19 , happyReduce_19),
        (20 , happyReduce_20),
        (21 , happyReduce_21),
        (22 , happyReduce_22),
        (23 , happyReduce_23),
        (24 , happyReduce_24),
        (25 , happyReduce_25),
        (26 , happyReduce_26),
        (27 , happyReduce_27),
        (28 , happyReduce_28),
        (29 , happyReduce_29),
        (30 , happyReduce_30),
        (31 , happyReduce_31),
        (32 , happyReduce_32),
        (33 , happyReduce_33),
        (34 , happyReduce_34),
        (35 , happyReduce_35),
        (36 , happyReduce_36),
        (37 , happyReduce_37),
        (38 , happyReduce_38),
        (39 , happyReduce_39),
        (40 , happyReduce_40),
        (41 , happyReduce_41),
        (42 , happyReduce_42),
        (43 , happyReduce_43),
        (44 , happyReduce_44),
        (45 , happyReduce_45),
        (46 , happyReduce_46),
        (47 , happyReduce_47),
        (48 , happyReduce_48),
        (49 , happyReduce_49),
        (50 , happyReduce_50),
        (51 , happyReduce_51),
        (52 , happyReduce_52),
        (53 , happyReduce_53),
        (54 , happyReduce_54),
        (55 , happyReduce_55),
        (56 , happyReduce_56),
        (57 , happyReduce_57),
        (58 , happyReduce_58)
        ]

happyRuleArr :: HappyAddr
happyRuleArr = HappyA (Happy_Data_Array.listArray (0,115) ([0,4,1,3,2,2,2,1,3,6,3,7,3,4,4,3,4,0,5,1,5,3,6,3,6,1,7,4,7,3,8,1,8,4,9,1,9,0,10,1,10,2,11,1,11,3,12,2,12,1,12,0,13,2,13,1,14,2,14,2,14,3,14,3,14,1,14,3,14,2,14,3,14,4,14,5,14,2,14,2,14,2,14,2,14,3,14,1,14,2,14,2,14,3,15,1,15,0,16,2,16,1,17,2,18,2,18,0,19,1,19,0,20,1,20,0
	]))

happyCatchStates :: [Happy_Prelude.Int]
happyCatchStates = []

happy_n_terms = 33 :: Happy_Prelude.Int
happy_n_nonterms = 21 :: Happy_Prelude.Int

happy_n_starts = 1 :: Happy_Prelude.Int

happyReduce_1 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_1 = happyReduce 4 0 happyReduction_1
happyReduction_1 ((HappyAbsSyn20  happy_var_4) `HappyStk`
        (HappyAbsSyn6  happy_var_3) `HappyStk`
        (HappyAbsSyn20  happy_var_2) `HappyStk`
        (HappyAbsSyn20  happy_var_1) `HappyStk`
        happyRest)
         = HappyAbsSyn5
                 (BookendedAbsSyn happy_var_1 happy_var_2 happy_var_3 happy_var_4
        ) `HappyStk` happyRest

happyReduce_2 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_2 = happySpecReduce_3  1 happyReduction_2
happyReduction_2 (HappyAbsSyn7  happy_var_3)
        _
        (HappyAbsSyn18  happy_var_1)
         =  HappyAbsSyn6
                 (AbsSyn (reverse happy_var_1) (reverse happy_var_3)
        )
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_3 = happySpecReduce_2  2 happyReduction_3
happyReduction_3 (HappyAbsSyn8  happy_var_2)
        (HappyAbsSyn7  happy_var_1)
         =  HappyAbsSyn7
                 (happy_var_2 : happy_var_1
        )
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_4 = happySpecReduce_1  2 happyReduction_4
happyReduction_4 (HappyAbsSyn8  happy_var_1)
         =  HappyAbsSyn7
                 ([happy_var_1]
        )
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_5 = happyReduce 6 3 happyReduction_5
happyReduction_5 ((HappyAbsSyn11  happy_var_6) `HappyStk`
        _ `HappyStk`
        (HappyTerminal (TokenInfo happy_var_4 TokCodeQuote)) `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn9  happy_var_2) `HappyStk`
        (HappyTerminal (TokenInfo happy_var_1 TokId)) `HappyStk`
        happyRest)
         = HappyAbsSyn8
                 (Rule happy_var_1 happy_var_2 happy_var_6 (Just happy_var_4)
        ) `HappyStk` happyRest

happyReduce_6 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_6 = happyReduce 7 3 happyReduction_6
happyReduction_6 ((HappyAbsSyn11  happy_var_7) `HappyStk`
        _ `HappyStk`
        _ `HappyStk`
        (HappyTerminal (TokenInfo happy_var_4 TokCodeQuote)) `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn9  happy_var_2) `HappyStk`
        (HappyTerminal (TokenInfo happy_var_1 TokId)) `HappyStk`
        happyRest)
         = HappyAbsSyn8
                 (Rule happy_var_1 happy_var_2 happy_var_7 (Just happy_var_4)
        ) `HappyStk` happyRest

happyReduce_7 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_7 = happyReduce 4 3 happyReduction_7
happyReduction_7 ((HappyAbsSyn11  happy_var_4) `HappyStk`
        _ `HappyStk`
        (HappyAbsSyn9  happy_var_2) `HappyStk`
        (HappyTerminal (TokenInfo happy_var_1 TokId)) `HappyStk`
        happyRest)
         = HappyAbsSyn8
                 (Rule happy_var_1 happy_var_2 happy_var_4 Nothing
        ) `HappyStk` happyRest

happyReduce_8 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 _
        (HappyAbsSyn9  happy_var_2)
        _
         =  HappyAbsSyn9
                 (reverse happy_var_2
        )
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_9 = happySpecReduce_0  4 happyReduction_9
happyReduction_9  =  HappyAbsSyn9
                 ([]
        )

happyReduce_10 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_10 = happySpecReduce_1  5 happyReduction_10
happyReduction_10 (HappyTerminal (TokenInfo happy_var_1 TokId))
         =  HappyAbsSyn9
                 ([happy_var_1]
        )
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_11 = happySpecReduce_3  5 happyReduction_11
happyReduction_11 (HappyTerminal (TokenInfo happy_var_3 TokId))
        _
        (HappyAbsSyn9  happy_var_1)
         =  HappyAbsSyn9
                 (happy_var_3 : happy_var_1
        )
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn11  happy_var_3)
        _
        (HappyAbsSyn12  happy_var_1)
         =  HappyAbsSyn11
                 (happy_var_1 : happy_var_3
        )
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_13 = happySpecReduce_1  6 happyReduction_13
happyReduction_13 (HappyAbsSyn12  happy_var_1)
         =  HappyAbsSyn11
                 ([happy_var_1]
        )
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_14 = happyMonadReduce 4 7 happyReduction_14
happyReduction_14 (_ `HappyStk`
        (HappyTerminal (TokenInfo happy_var_3 TokCodeQuote)) `HappyStk`
        (HappyAbsSyn17  happy_var_2) `HappyStk`
        (HappyAbsSyn14  happy_var_1) `HappyStk`
        happyRest) tk
         = happyThen ((( lineP >>= \l -> return (Prod happy_var_1 happy_var_3 l happy_var_2)))
        ) (\r -> happyReturn (HappyAbsSyn12 r))

happyReduce_15 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_15 = happyMonadReduce 3 7 happyReduction_15
happyReduction_15 ((HappyTerminal (TokenInfo happy_var_3 TokCodeQuote)) `HappyStk`
        (HappyAbsSyn17  happy_var_2) `HappyStk`
        (HappyAbsSyn14  happy_var_1) `HappyStk`
        happyRest) tk
         = happyThen ((( lineP >>= \l -> return (Prod happy_var_1 happy_var_3 l happy_var_2)))
        ) (\r -> happyReturn (HappyAbsSyn12 r))

happyReduce_16 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_16 = happySpecReduce_1  8 happyReduction_16
happyReduction_16 (HappyTerminal (TokenInfo happy_var_1 TokId))
         =  HappyAbsSyn13
                 (App happy_var_1 []
        )
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_17 = happyReduce 4 8 happyReduction_17
happyReduction_17 (_ `HappyStk`
        (HappyAbsSyn14  happy_var_3) `HappyStk`
        _ `HappyStk`
        (HappyTerminal (TokenInfo happy_var_1 TokId)) `HappyStk`
        happyRest)
         = HappyAbsSyn13
                 (App happy_var_1 (reverse happy_var_3)
        ) `HappyStk` happyRest

happyReduce_18 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_18 = happySpecReduce_1  9 happyReduction_18
happyReduction_18 (HappyAbsSyn14  happy_var_1)
         =  HappyAbsSyn14
                 (reverse happy_var_1
        )
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_19 = happySpecReduce_0  9 happyReduction_19
happyReduction_19  =  HappyAbsSyn14
                 ([]
        )

happyReduce_20 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_20 = happySpecReduce_1  10 happyReduction_20
happyReduction_20 (HappyAbsSyn13  happy_var_1)
         =  HappyAbsSyn14
                 ([happy_var_1]
        )
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_21 = happySpecReduce_2  10 happyReduction_21
happyReduction_21 (HappyAbsSyn13  happy_var_2)
        (HappyAbsSyn14  happy_var_1)
         =  HappyAbsSyn14
                 (happy_var_2 : happy_var_1
        )
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 (HappyAbsSyn13  happy_var_1)
         =  HappyAbsSyn14
                 ([happy_var_1]
        )
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_23 = happySpecReduce_3  11 happyReduction_23
happyReduction_23 (HappyAbsSyn13  happy_var_3)
        _
        (HappyAbsSyn14  happy_var_1)
         =  HappyAbsSyn14
                 (happy_var_3 : happy_var_1
        )
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_24 = happySpecReduce_2  12 happyReduction_24
happyReduction_24 (HappyTerminal (TokenInfo happy_var_2 TokId))
        _
         =  HappyAbsSyn17
                 (PrecId happy_var_2
        )
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_25 = happySpecReduce_1  12 happyReduction_25
happyReduction_25 _
         =  HappyAbsSyn17
                 (PrecShift
        )

happyReduce_26 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_26 = happySpecReduce_0  12 happyReduction_26
happyReduction_26  =  HappyAbsSyn17
                 (PrecNone
        )

happyReduce_27 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_27 = happySpecReduce_2  13 happyReduction_27
happyReduction_27 (HappyAbsSyn19  happy_var_2)
        (HappyAbsSyn18  happy_var_1)
         =  HappyAbsSyn18
                 (happy_var_2 : happy_var_1
        )
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 (HappyAbsSyn19  happy_var_1)
         =  HappyAbsSyn18
                 ([happy_var_1]
        )
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_29 = happySpecReduce_2  14 happyReduction_29
happyReduction_29 (HappyTerminal (TokenInfo happy_var_2 TokCodeQuote))
        _
         =  HappyAbsSyn19
                 (TokenType happy_var_2
        )
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_30 = happySpecReduce_2  14 happyReduction_30
happyReduction_30 (HappyAbsSyn21  happy_var_2)
        _
         =  HappyAbsSyn19
                 (TokenSpec happy_var_2
        )
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_31 = happySpecReduce_3  14 happyReduction_31
happyReduction_31 (HappyAbsSyn20  happy_var_3)
        (HappyTerminal (TokenInfo happy_var_2 TokId))
        _
         =  HappyAbsSyn19
                 (TokenName happy_var_2 happy_var_3 False
        )
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_32 = happySpecReduce_3  14 happyReduction_32
happyReduction_32 (HappyAbsSyn20  happy_var_3)
        (HappyTerminal (TokenInfo happy_var_2 TokId))
        _
         =  HappyAbsSyn19
                 (TokenName happy_var_2 happy_var_3 True
        )
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_33 = happySpecReduce_1  14 happyReduction_33
happyReduction_33 _
         =  HappyAbsSyn19
                 (TokenImportedIdentity
        )

happyReduce_34 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_34 = happySpecReduce_3  14 happyReduction_34
happyReduction_34 (HappyTerminal (TokenInfo happy_var_3 TokCodeQuote))
        (HappyTerminal (TokenInfo happy_var_2 TokCodeQuote))
        _
         =  HappyAbsSyn19
                 (TokenLexer happy_var_2 happy_var_3
        )
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_35 = happySpecReduce_2  14 happyReduction_35
happyReduction_35 (HappyTerminal (TokenInfo happy_var_2 TokCodeQuote))
        _
         =  HappyAbsSyn19
                 (TokenMonad "()" happy_var_2 "Happy_Prelude.>>=" "Happy_Prelude.return"
        )
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_36 = happySpecReduce_3  14 happyReduction_36
happyReduction_36 (HappyTerminal (TokenInfo happy_var_3 TokCodeQuote))
        (HappyTerminal (TokenInfo happy_var_2 TokCodeQuote))
        _
         =  HappyAbsSyn19
                 (TokenMonad happy_var_2 happy_var_3 "Happy_Prelude.>>=" "Happy_Prelude.return"
        )
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_37 = happyReduce 4 14 happyReduction_37
happyReduction_37 ((HappyTerminal (TokenInfo happy_var_4 TokCodeQuote)) `HappyStk`
        (HappyTerminal (TokenInfo happy_var_3 TokCodeQuote)) `HappyStk`
        (HappyTerminal (TokenInfo happy_var_2 TokCodeQuote)) `HappyStk`
        _ `HappyStk`
        happyRest)
         = HappyAbsSyn19
                 (TokenMonad "()" happy_var_2 happy_var_3 happy_var_4
        ) `HappyStk` happyRest

happyReduce_38 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_38 = happyReduce 5 14 happyReduction_38
happyReduction_38 ((HappyTerminal (TokenInfo happy_var_5 TokCodeQuote)) `HappyStk`
        (HappyTerminal (TokenInfo happy_var_4 TokCodeQuote)) `HappyStk`
        (HappyTerminal (TokenInfo happy_var_3 TokCodeQuote)) `HappyStk`
        (HappyTerminal (TokenInfo happy_var_2 TokCodeQuote)) `HappyStk`
        _ `HappyStk`
        happyRest)
         = HappyAbsSyn19
                 (TokenMonad happy_var_2 happy_var_3 happy_var_4 happy_var_5
        ) `HappyStk` happyRest

happyReduce_39 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_39 = happySpecReduce_2  14 happyReduction_39
happyReduction_39 (HappyAbsSyn9  happy_var_2)
        _
         =  HappyAbsSyn19
                 (TokenNonassoc happy_var_2
        )
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_40 = happySpecReduce_2  14 happyReduction_40
happyReduction_40 (HappyAbsSyn9  happy_var_2)
        _
         =  HappyAbsSyn19
                 (TokenRight happy_var_2
        )
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_41 = happySpecReduce_2  14 happyReduction_41
happyReduction_41 (HappyAbsSyn9  happy_var_2)
        _
         =  HappyAbsSyn19
                 (TokenLeft happy_var_2
        )
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_42 = happySpecReduce_2  14 happyReduction_42
happyReduction_42 (HappyTerminal (TokenNum happy_var_2  TokNum))
        _
         =  HappyAbsSyn19
                 (TokenExpect happy_var_2
        )
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_43 = happySpecReduce_3  14 happyReduction_43
happyReduction_43 (HappyAbsSyn20  happy_var_3)
        (HappyTerminal (TokenInfo happy_var_2 TokCodeQuote))
        _
         =  HappyAbsSyn19
                 (TokenError happy_var_2 happy_var_3
        )
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_44 = happySpecReduce_1  14 happyReduction_44
happyReduction_44 _
         =  HappyAbsSyn19
                 (TokenErrorExpected
        )

happyReduce_45 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_45 = happySpecReduce_2  14 happyReduction_45
happyReduction_45 (HappyTerminal (TokenInfo happy_var_2 TokId))
        _
         =  HappyAbsSyn19
                 (TokenErrorHandlerType happy_var_2
        )
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_46 = happySpecReduce_2  14 happyReduction_46
happyReduction_46 (HappyTerminal (TokenInfo happy_var_2 TokCodeQuote))
        _
         =  HappyAbsSyn19
                 (TokenAttributetype happy_var_2
        )
happyReduction_46 _ _  = notHappyAtAll 

happyReduce_47 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_47 = happySpecReduce_3  14 happyReduction_47
happyReduction_47 (HappyTerminal (TokenInfo happy_var_3 TokCodeQuote))
        (HappyTerminal (TokenInfo happy_var_2 TokId))
        _
         =  HappyAbsSyn19
                 (TokenAttribute happy_var_2 happy_var_3
        )
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_48 = happySpecReduce_1  15 happyReduction_48
happyReduction_48 (HappyTerminal (TokenInfo happy_var_1 TokId))
         =  HappyAbsSyn20
                 (Just happy_var_1
        )
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_49 = happySpecReduce_0  15 happyReduction_49
happyReduction_49  =  HappyAbsSyn20
                 (Nothing
        )

happyReduce_50 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_50 = happySpecReduce_2  16 happyReduction_50
happyReduction_50 (HappyAbsSyn21  happy_var_2)
        (HappyAbsSyn22  happy_var_1)
         =  HappyAbsSyn21
                 (happy_var_1:happy_var_2
        )
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_51 = happySpecReduce_1  16 happyReduction_51
happyReduction_51 (HappyAbsSyn22  happy_var_1)
         =  HappyAbsSyn21
                 ([happy_var_1]
        )
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_52 = happySpecReduce_2  17 happyReduction_52
happyReduction_52 (HappyTerminal (TokenInfo happy_var_2 TokCodeQuote))
        (HappyTerminal (TokenInfo happy_var_1 TokId))
         =  HappyAbsSyn22
                 ((happy_var_1, parseTokenSpec happy_var_2)
        )
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_53 = happySpecReduce_2  18 happyReduction_53
happyReduction_53 (HappyAbsSyn9  happy_var_2)
        (HappyTerminal (TokenInfo happy_var_1 TokId))
         =  HappyAbsSyn9
                 (happy_var_1 : happy_var_2
        )
happyReduction_53 _ _  = notHappyAtAll 

happyReduce_54 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_54 = happySpecReduce_0  18 happyReduction_54
happyReduction_54  =  HappyAbsSyn9
                 ([]
        )

happyReduce_55 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_55 = happySpecReduce_1  19 happyReduction_55
happyReduction_55 (HappyTerminal (TokenInfo happy_var_1 TokCodeQuote))
         =  HappyAbsSyn20
                 (Just happy_var_1
        )
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_56 = happySpecReduce_0  19 happyReduction_56
happyReduction_56  =  HappyAbsSyn20
                 (Nothing
        )

happyReduce_57 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_57 = happySpecReduce_1  20 happyReduction_57
happyReduction_57 (HappyTerminal (TokenInfo happy_var_1 TokPragmaQuote))
         =  HappyAbsSyn20
                 (Just happy_var_1
        )
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_58 = happySpecReduce_0  20 happyReduction_58
happyReduction_58  =  HappyAbsSyn20
                 (Nothing
        )

happyTerminalToTok term = case term of {
        TokenEOF -> 32;
        TokenInfo happy_dollar_dollar TokId -> 2;
        TokenKW      TokSpecId_TokenType -> 3;
        TokenKW      TokSpecId_Token -> 4;
        TokenKW      TokSpecId_Name -> 5;
        TokenKW      TokSpecId_Partial -> 6;
        TokenKW      TokSpecId_Lexer -> 7;
        TokenKW      TokSpecId_ImportedIdentity -> 8;
        TokenKW      TokSpecId_Monad -> 9;
        TokenKW      TokSpecId_Nonassoc -> 10;
        TokenKW      TokSpecId_Left -> 11;
        TokenKW      TokSpecId_Right -> 12;
        TokenKW      TokSpecId_Prec -> 13;
        TokenKW      TokSpecId_Shift -> 14;
        TokenKW      TokSpecId_Expect -> 15;
        TokenKW      TokSpecId_Error -> 16;
        TokenKW      TokSpecId_ErrorExpected -> 17;
        TokenKW      TokSpecId_ErrorHandlerType -> 18;
        TokenKW      TokSpecId_Attribute -> 19;
        TokenKW      TokSpecId_Attributetype -> 20;
        TokenInfo happy_dollar_dollar TokPragmaQuote -> 21;
        TokenInfo happy_dollar_dollar TokCodeQuote -> 22;
        TokenNum happy_dollar_dollar  TokNum -> 23;
        TokenKW      TokColon -> 24;
        TokenKW      TokSemiColon -> 25;
        TokenKW      TokDoubleColon -> 26;
        TokenKW      TokDoublePercent -> 27;
        TokenKW      TokBar -> 28;
        TokenKW      TokParenL -> 29;
        TokenKW      TokParenR -> 30;
        TokenKW      TokComma -> 31;
        _ -> (-1);
        }
{-# NOINLINE happyTerminalToTok #-}

happyLex kend kmore = lexTokenP (\tk -> case tk of {
        TokenEOF -> kend tk;
        _ -> kmore (happyTerminalToTok tk) tk })
{-# INLINE happyLex #-}

happyNewToken action sts stk = happyLex (\tk -> happyDoAction 32 tk action sts stk) (\i tk -> happyDoAction i tk action sts stk)

happyReport 32 = happyReport'
happyReport _ = happyReport'


happyThen :: () => (P a) -> (a -> (P b)) -> (P b)
happyThen = (Happy_Prelude.>>=)
happyReturn :: () => a -> (P a)
happyReturn = (Happy_Prelude.return)
happyDoParse :: () => Happy_Prelude.Int -> P (HappyAbsSyn )

happyNewToken :: () => Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> (P (HappyAbsSyn ))

happyDoAction :: () => Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> (P (HappyAbsSyn ))

happyReduceArr :: () => Happy_Data_Array.Array Happy_Prelude.Int (Happy_Prelude.Int -> Token -> Happy_Prelude.Int -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> (P (HappyAbsSyn )))

happyThen1 :: () => P a -> (a -> P b) -> P b
happyThen1 = happyThen
happyFmap1 f m = happyThen m (\a -> happyReturn (f a))
happyReturn1 :: () => a -> (P a)
happyReturn1 = happyReturn
happyReport' :: () => (Token) -> [Happy_Prelude.String] -> (P a) -> (P a)
happyReport' = (\tokens expected resume -> happyError)

happyAbort :: () => (P a)
happyAbort = Happy_Prelude.error "Called abort handler in non-resumptive parser"

ourParser = happySomeParser where
 happySomeParser = happyThen (happyDoParse 0) (\x -> case x of {HappyAbsSyn5 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


happyError :: P a
happyError = failP (\l -> show l ++ ": Parse error\n")
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $

#if defined(HAPPY_GHC)

#if !defined(__GLASGOW_HASKELL__)
#  error This code isn't being built with GHC.
#endif

-- Get WORDS_BIGENDIAN (if defined)
#include "MachDeps.h"

-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Happy_Prelude.Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Happy_Prelude.Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Happy_Prelude.Bool)
#define PLUS(n,m) (n Happy_GHC_Exts.+# m)
#define MINUS(n,m) (n Happy_GHC_Exts.-# m)
#define TIMES(n,m) (n Happy_GHC_Exts.*# m)
#define NEGATE(n) (Happy_GHC_Exts.negateInt# (n))

type Happy_Int = Happy_GHC_Exts.Int#
data Happy_IntList = HappyCons Happy_Int Happy_IntList

#define INVALID_TOK -1#
#define ERROR_TOK 0#
#define CATCH_TOK 1#

#if defined(HAPPY_COERCE)
#  define GET_ERROR_TOKEN(x)  (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# i) -> i })
#  define MK_ERROR_TOKEN(i)   (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# i))
#  define MK_TOKEN(x)         (happyInTok (x))
#else
#  define GET_ERROR_TOKEN(x)  (case x of { HappyErrorToken (Happy_GHC_Exts.I# i) -> i })
#  define MK_ERROR_TOKEN(i)   (HappyErrorToken (Happy_GHC_Exts.I# i))
#  define MK_TOKEN(x)         (HappyTerminal (x))
#endif

#if defined(HAPPY_DEBUG)
#  define DEBUG_TRACE(s)    (happyTrace (s)) Happy_Prelude.$
happyTrace string expr = Happy_System_IO_Unsafe.unsafePerformIO Happy_Prelude.$ do
    Happy_System_IO.hPutStr Happy_System_IO.stderr string
    Happy_Prelude.return expr
#else
#  define DEBUG_TRACE(s)    {- nothing -}
#endif

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyDoParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept ERROR_TOK tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) =
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

happyDoAction i tk st =
  DEBUG_TRACE("state: " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++
              ",\ttoken: " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# i) Happy_Prelude.++
              ",\taction: ")
  case happyDecodeAction (happyNextAction i st) of
    HappyFail             -> DEBUG_TRACE("failing.\n")
                             happyFail i tk st
    HappyAccept           -> DEBUG_TRACE("accept.\n")
                             happyAccept i tk st
    HappyReduce rule      -> DEBUG_TRACE("reduce (rule " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# rule) Happy_Prelude.++ ")")
                             (happyReduceArr Happy_Data_Array.! (Happy_GHC_Exts.I# rule)) i tk st
    HappyShift  new_state -> DEBUG_TRACE("shift, enter state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# new_state) Happy_Prelude.++ "\n")
                             happyShift new_state i tk st

{-# INLINE happyNextAction #-}
happyNextAction i st = case happyIndexActionTable i st of
  Happy_Prelude.Just (Happy_GHC_Exts.I# act) -> act
  Happy_Prelude.Nothing                      -> happyIndexOffAddr happyDefActions st

{-# INLINE happyIndexActionTable #-}
happyIndexActionTable i st
  | GTE(i, 0#), GTE(off, 0#), EQ(happyIndexOffAddr happyCheck off, i)
  -- i >= 0:   Guard against INVALID_TOK (do the default action, which ultimately errors)
  -- off >= 0: Otherwise it's a default action
  -- equality check: Ensure that the entry in the compressed array is owned by st
  = Happy_Prelude.Just (Happy_GHC_Exts.I# (happyIndexOffAddr happyTable off))
  | Happy_Prelude.otherwise
  = Happy_Prelude.Nothing
  where
    off = PLUS(happyIndexOffAddr happyActOffsets st, i)

data HappyAction
  = HappyFail
  | HappyAccept
  | HappyReduce Happy_Int -- rule number
  | HappyShift Happy_Int  -- new state
  deriving Happy_Prelude.Show

{-# INLINE happyDecodeAction #-}
happyDecodeAction :: Happy_Int -> HappyAction
happyDecodeAction  0#                        = HappyFail
happyDecodeAction -1#                        = HappyAccept
happyDecodeAction action | LT(action, 0#)    = HappyReduce NEGATE(PLUS(action, 1#))
                         | Happy_Prelude.otherwise = HappyShift MINUS(action, 1#)

{-# INLINE happyIndexGotoTable #-}
happyIndexGotoTable nt st = happyIndexOffAddr happyTable off
  where
    off = PLUS(happyIndexOffAddr happyGotoOffsets st, nt)

{-# INLINE happyIndexOffAddr #-}
happyIndexOffAddr :: HappyAddr -> Happy_Int -> Happy_Int
happyIndexOffAddr (HappyA# arr) off =
#if __GLASGOW_HASKELL__ >= 901
  Happy_GHC_Exts.int32ToInt# -- qualified import because it doesn't exist on older GHC's
#endif
#ifdef WORDS_BIGENDIAN
  -- The CI of `alex` tests this code path
  (Happy_GHC_Exts.word32ToInt32# (Happy_GHC_Exts.wordToWord32# (Happy_GHC_Exts.byteSwap32# (Happy_GHC_Exts.word32ToWord# (Happy_GHC_Exts.int32ToWord32#
#endif
  (Happy_GHC_Exts.indexInt32OffAddr# arr off)
#ifdef WORDS_BIGENDIAN
  )))))
#endif

happyIndexRuleArr :: Happy_Int -> (# Happy_Int, Happy_Int #)
happyIndexRuleArr r = (# nt, len #)
  where
    !(Happy_GHC_Exts.I# n_starts) = happy_n_starts
    offs = TIMES(MINUS(r,n_starts),2#)
    nt = happyIndexOffAddr happyRuleArr offs
    len = happyIndexOffAddr happyRuleArr PLUS(offs,1#)

data HappyAddr = HappyA# Happy_GHC_Exts.Addr#

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state ERROR_TOK tk st sts stk@(x `HappyStk` _) =
     -- See "Error Fixup" below
     let i = GET_ERROR_TOKEN(x) in
     DEBUG_TRACE("shifting the error token")
     happyDoAction i tk new_state (HappyCons st sts) stk

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons st sts) (MK_TOKEN(tk) `HappyStk` stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 nt fn j tk st sts stk
     = happySeq fn (happyGoto nt j tk st (HappyCons st sts) (fn `HappyStk` stk))

happySpecReduce_1 nt fn j tk old_st sts@(HappyCons st _) (v1 `HappyStk` stk')
     = let r = fn v1 in
       happyTcHack old_st (happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk')))

happySpecReduce_2 nt fn j tk old_st
  (HappyCons _ sts@(HappyCons st _))
  (v1 `HappyStk` v2 `HappyStk` stk')
     = let r = fn v1 v2 in
       happyTcHack old_st (happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk')))

happySpecReduce_3 nt fn j tk old_st
  (HappyCons _ (HappyCons _ sts@(HappyCons st _)))
  (v1 `HappyStk` v2 `HappyStk` v3 `HappyStk` stk')
     = let r = fn v1 v2 v3 in
       happyTcHack old_st (happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk')))

happyReduce k nt fn j tk st sts stk
     = case happyDrop MINUS(k,(1# :: Happy_Int)) sts of
         sts1@(HappyCons st1 _) ->
                let r = fn stk in -- it doesn't hurt to always seq here...
                st `happyTcHack` happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons st sts) of
        sts1@(HappyCons st1 _) ->
          let drop_stk = happyDropStk k stk in
          j `happyTcHack` happyThen1 (fn stk tk)
                                     (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons st sts) of
        sts1@(HappyCons st1 _) ->
          let drop_stk = happyDropStk k stk
              off = happyIndexOffAddr happyGotoOffsets st1
              off_i = PLUS(off, nt)
              new_state = happyIndexOffAddr happyTable off_i
          in
            j `happyTcHack` happyThen1 (fn stk tk)
                                       (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l               = l
happyDrop n  (HappyCons _ t) = happyDrop MINUS(n,(1# :: Happy_Int)) t

happyDropStk 0# l                 = l
happyDropStk n  (x `HappyStk` xs) = happyDropStk MINUS(n,(1#::Happy_Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

happyGoto nt j tk st =
   DEBUG_TRACE(", goto state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# new_state) Happy_Prelude.++ "\n")
   happyDoAction j tk new_state
  where new_state = happyIndexGotoTable nt st

{- Note [Error recovery]
~~~~~~~~~~~~~~~~~~~~~~~~
When there is no applicable action for the current lookahead token `tk`,
happy enters error recovery mode. Depending on whether the grammar file
declares the two action form `%error { abort } { report }` for
    Resumptive Error Handling,
it works in one (not resumptive) or two phases (resumptive):

 1. Fixup mode:
    Try to see if there is an action for the error token ERROR_TOK. If there
    is, do *not* emit an error and pretend instead that an `error` token was
    inserted.
    When there is no ERROR_TOK action, report an error.

    In non-resumptive error handling, calling the single error handler
    (e.g. `happyError`) will throw an exception and abort the parser.
    However, in resumptive error handling we enter *error resumption mode*.

 2. Error resumption mode:
    After reporting the error (with `report`), happy will attempt to find
    a good state stack to resume parsing in.
    For each candidate stack, it discards input until one of the candidates
    resumes (i.e. shifts the current input).
    If no candidate resumes before the end of input, resumption failed and
    calls the `abort` function, to much the same effect as in non-resumptive
    error handling.

    Candidate stacks are declared by the grammar author using the special
    `catch` terminal and called "catch frames".
    This mechanism is described in detail in Note [happyResume].

The `catch` resumption mechanism (2) is what usually is associated with
`error` in `bison` or `menhir`. Since `error` is used for the Fixup mechanism
(1) above, we call the corresponding token `catch`.
Furthermore, in constrast to `bison`, our implementation of `catch`
non-deterministically considers multiple catch frames on the stack for
resumption (See Note [Multiple catch frames]).

Note [happyResume]
~~~~~~~~~~~~~~~~~~
`happyResume` implements the resumption mechanism from Note [Error recovery].
It is best understood by example. Consider

Exp :: { String }
Exp : '1'                { "1" }
    | catch              { "catch" }
    | Exp '+' Exp %shift { $1 Happy_Prelude.++ " + " Happy_Prelude.++ $3 } -- %shift: associate 1 + 1 + 1 to the right
    | '(' Exp ')'        { "(" Happy_Prelude.++ $2 Happy_Prelude.++ ")" }

The idea of the use of `catch` here is that upon encountering a parse error
during expression parsing, we can gracefully degrade using the `catch` rule,
still producing a partial syntax tree and keep on parsing to find further
syntax errors.

Let's trace the parser state for input 11+1, which will error out after shifting 1.
After shifting, we have the following item stack (growing downwards and omitting
transitive closure items):

  State 0: %start_parseExp -> . Exp
  State 5: Exp -> '1' .

(Stack as a list of state numbers: [5,0].)
As Note [Error recovery] describes, we will first try Fixup mode.
That fails because no production can shift the `error` token.
Next we try Error resumption mode. This works as follows:

  1. Pop off the item stack until we find an item that can shift the `catch`
     token. (Implemented in `pop_items`.)
       * State 5 cannot shift catch. Pop.
       * State 0 can shift catch, which would transition into
          State 4: Exp -> catch .
     So record the *stack* `[4,0]` after doing the shift transition.
     We call this a *catch frame*, where the top is a *catch state*,
     corresponding to an item in which we just shifted a `catch` token.
     There can be multiple such catch stacks, see Note [Multiple catch frames].

  2. Discard tokens from the input until the lookahead can be shifted in one
     of the catch stacks. (Implemented in `discard_input_until_exp` and
     `some_catch_state_shifts`.)
       * We cannot shift the current lookahead '1' in state 4, so we discard
       * We *can* shift the next lookahead '+' in state 4, but only after
         reducing, which pops State 4 and goes to State 3:
           State 3: %start_parseExp -> Exp .
                    Exp -> Exp . '+' Exp
         Here we can shift '+'.
     As you can see, to implement this machinery we need to simulate
     the operation of the LALR automaton, especially reduction
     (`happySimulateReduce`).

Note [Multiple catch frames]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
For fewer spurious error messages, it can be beneficial to trace multiple catch
items. Consider

Exp : '1'
    | catch
    | Exp '+' Exp %shift
    | '(' Exp ')'

Let's trace the parser state for input (;+1, which will error out after shifting (.
After shifting, we have the following item stack (growing downwards):

  State 0: %start_parseExp -> . Exp
  State 6: Exp -> '(' . Exp ')'

Upon error, we want to find items in the stack which can shift a catch token.
Note that both State 0 and State 6 can shift a catch token, transitioning into
  State 4: Exp -> catch .
Hence we record the catch frames `[4,6,0]` and `[4,0]` for possible resumption.

Which catch frame do we pick for resumption?
Note that resuming catch frame `[4,0]` will parse as "catch+1", whereas
resuming the innermost frame `[4,6,0]` corresponds to parsing "(catch+1".
The latter would keep discarding input until the closing ')' is found.
So we will discard + and 1, leading to a spurious syntax error at the end of
input, aborting the parse and never producing a partial syntax tree. Bad!

It is far preferable to resume with catch frame `[4,0]`, where we can resume
successfully on input +, so that is what we do.

In general, we pick the catch frame for resumption that discards the least
amount of input for a successful shift, preferring the topmost such catch frame.
-}

-- happyFail :: Happy_Int -> Token -> Happy_Int -> _
-- This function triggers Note [Error recovery].
-- If the current token is ERROR_TOK, phase (1) has failed and we might try
-- phase (2).
happyFail ERROR_TOK = happyFixupFailed
happyFail i         = happyTryFixup i

-- Enter Error Fixup (see Note [Error recovery]):
-- generate an error token, save the old token and carry on.
-- When a `happyShift` accepts the error token, we will pop off the error token
-- to resume parsing with the current lookahead `i`.
happyTryFixup i tk action sts stk =
  DEBUG_TRACE("entering `error` fixup.\n")
  happyDoAction ERROR_TOK tk action sts (MK_ERROR_TOKEN(i) `HappyStk` stk)
  -- NB: `happyShift` will simply pop the error token and carry on with
  --     `tk`. Hence we don't change `tk` in the call here

-- See Note [Error recovery], phase (2).
-- Enter resumption mode after reporting the error by calling `happyResume`.
happyFixupFailed tk st sts (x `HappyStk` stk) =
  let i = GET_ERROR_TOKEN(x) in
  DEBUG_TRACE("`error` fixup failed.\n")
  let resume   = happyResume i tk st sts stk
      expected = happyExpectedTokens st sts in
  happyReport i tk expected resume

-- happyResume :: Happy_Int -> Token -> Happy_Int -> _
-- See Note [happyResume]
happyResume i tk st sts stk = pop_items [] st sts stk
  where
    !(Happy_GHC_Exts.I# n_starts) = happy_n_starts   -- this is to test whether we have a start token
    !(Happy_GHC_Exts.I# eof_i) = happy_n_terms Happy_Prelude.- 1   -- this is the token number of the EOF token
    happy_list_to_list :: Happy_IntList -> [Happy_Prelude.Int]
    happy_list_to_list (HappyCons st sts)
      | LT(st, n_starts)
      = [(Happy_GHC_Exts.I# st)]
      | Happy_Prelude.otherwise
      = (Happy_GHC_Exts.I# st) : happy_list_to_list sts

    -- See (1) of Note [happyResume]
    pop_items catch_frames st sts stk
      | LT(st, n_starts)
      = DEBUG_TRACE("reached start state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++ ", ")
        if Happy_Prelude.null catch_frames_new
          then DEBUG_TRACE("no resumption.\n")
               happyAbort
          else DEBUG_TRACE("now discard input, trying to anchor in states " Happy_Prelude.++ Happy_Prelude.show (Happy_Prelude.map (happy_list_to_list . Happy_Prelude.fst) (Happy_Prelude.reverse catch_frames_new)) Happy_Prelude.++ ".\n")
               discard_input_until_exp i tk (Happy_Prelude.reverse catch_frames_new)
      | (HappyCons st1 sts1) <- sts, _ `HappyStk` stk1 <- stk
      = pop_items catch_frames_new st1 sts1 stk1
      where
        !catch_frames_new
          | HappyShift new_state <- happyDecodeAction (happyNextAction CATCH_TOK st)
          , DEBUG_TRACE("can shift catch token in state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++ ", into state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# new_state) Happy_Prelude.++ "\n")
            Happy_Prelude.null (Happy_Prelude.filter (\(HappyCons _ (HappyCons h _),_) -> EQ(st,h)) catch_frames)
          = (HappyCons new_state (HappyCons st sts), MK_ERROR_TOKEN(i) `HappyStk` stk):catch_frames -- MK_ERROR_TOKEN(i) is just some dummy that should not be accessed by user code
          | Happy_Prelude.otherwise
          = DEBUG_TRACE("already shifted or can't shift catch in " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++ "\n")
            catch_frames

    -- See (2) of Note [happyResume]
    discard_input_until_exp i tk catch_frames
      | Happy_Prelude.Just (HappyCons st (HappyCons catch_st sts), catch_frame) <- some_catch_state_shifts i catch_frames
      = DEBUG_TRACE("found expected token in state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++ " after shifting from " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# catch_st) Happy_Prelude.++ ": " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# i) Happy_Prelude.++ "\n")
        happyDoAction i tk st (HappyCons catch_st sts) catch_frame
      | EQ(i,eof_i) -- is i EOF?
      = DEBUG_TRACE("reached EOF, cannot resume. abort parse :(\n")
        happyAbort
      | Happy_Prelude.otherwise
      = DEBUG_TRACE("discard token " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# i) Happy_Prelude.++ "\n")
        happyLex (\eof_tk -> discard_input_until_exp eof_i eof_tk catch_frames) -- eof
                 (\i tk   -> discard_input_until_exp i tk catch_frames)         -- not eof

    some_catch_state_shifts _ [] = DEBUG_TRACE("no catch state could shift.\n") Happy_Prelude.Nothing
    some_catch_state_shifts i catch_frames@(((HappyCons st sts),_):_) = try_head i st sts catch_frames
      where
        try_head i st sts catch_frames = -- PRECONDITION: head catch_frames = (HappyCons st sts)
          DEBUG_TRACE("trying token " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# i) Happy_Prelude.++ " in state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++ ": ")
          case happyDecodeAction (happyNextAction i st) of
            HappyFail     -> DEBUG_TRACE("fail.\n")   some_catch_state_shifts i (Happy_Prelude.tail catch_frames)
            HappyAccept   -> DEBUG_TRACE("accept.\n") Happy_Prelude.Just (Happy_Prelude.head catch_frames)
            HappyShift _  -> DEBUG_TRACE("shift.\n")  Happy_Prelude.Just (Happy_Prelude.head catch_frames)
            HappyReduce r -> case happySimulateReduce r st sts of
              (HappyCons st1 sts1) -> try_head i st1 sts1 catch_frames

happySimulateReduce r st sts =
  DEBUG_TRACE("simulate reduction of rule " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# r) Happy_Prelude.++ ", ")
  let (# nt, len #) = happyIndexRuleArr r in
  DEBUG_TRACE("nt " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# nt) Happy_Prelude.++ ", len: " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# len) Happy_Prelude.++ ", new_st ")
  let !(sts1@(HappyCons st1 _)) = happyDrop len (HappyCons st sts)
      new_st = happyIndexGotoTable nt st1 in
  DEBUG_TRACE(Happy_Prelude.show (Happy_GHC_Exts.I# new_st) Happy_Prelude.++ ".\n")
  (HappyCons new_st sts1)

happyTokenToString :: Happy_Prelude.Int -> Happy_Prelude.String
happyTokenToString i = happyTokenStrings Happy_Prelude.!! (i Happy_Prelude.- 2) -- 2: errorTok, catchTok

happyExpectedTokens :: Happy_Int -> Happy_IntList -> [Happy_Prelude.String]
-- Upon a parse error, we want to suggest tokens that are expected in that
-- situation. This function computes such tokens.
-- It works by examining the top of the state stack.
-- For every token number that does a shift transition, record that token number.
-- For every token number that does a reduce transition, simulate that reduction
-- on the state state stack and repeat.
-- The recorded token numbers are then formatted with 'happyTokenToString' and
-- returned.
happyExpectedTokens st sts =
  DEBUG_TRACE("constructing expected tokens.\n")
  Happy_Prelude.map happyTokenToString (search_shifts st sts [])
  where
    search_shifts st sts shifts = Happy_Prelude.foldr (add_action st sts) shifts (distinct_actions st)
    add_action st sts (Happy_GHC_Exts.I# i, Happy_GHC_Exts.I# act) shifts =
      DEBUG_TRACE("found action in state " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# st) Happy_Prelude.++ ", input " Happy_Prelude.++ Happy_Prelude.show (Happy_GHC_Exts.I# i) Happy_Prelude.++ ", " Happy_Prelude.++ Happy_Prelude.show (happyDecodeAction act) Happy_Prelude.++ "\n")
      case happyDecodeAction act of
        HappyFail     -> shifts
        HappyAccept   -> shifts -- This would always be %eof or error... Not helpful
        HappyShift _  -> Happy_Prelude.insert (Happy_GHC_Exts.I# i) shifts
        HappyReduce r -> case happySimulateReduce r st sts of
          (HappyCons st1 sts1) -> search_shifts st1 sts1 shifts
    distinct_actions st
      -- The (token number, action) pairs of all actions in the given state
      = ((-1), (Happy_GHC_Exts.I# (happyIndexOffAddr happyDefActions st)))
      : [ (i, act) | i <- [begin_i..happy_n_terms], act <- get_act row_off i ]
      where
        row_off = happyIndexOffAddr happyActOffsets st
        begin_i = 2 -- +2: errorTok,catchTok
    get_act off (Happy_GHC_Exts.I# i) -- happyIndexActionTable with cached row offset
      | let off_i = PLUS(off,i)
      , GTE(off_i,0#)
      , EQ(happyIndexOffAddr happyCheck off_i,i)
      = [(Happy_GHC_Exts.I# (happyIndexOffAddr happyTable off_i))]
      | Happy_Prelude.otherwise
      = []

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Happy_Prelude.error "Internal Happy parser panic. This is not supposed to happen! Please open a bug report at https://github.com/haskell/happy/issues.\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions

happyTcHack :: Happy_Int -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}

-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Happy_GHC_Exts.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.


#else

-- Portable Haskell 2010 implementation (used when -g/--ghc is NOT passed).
-- Compiles with GHC and MicroHs, with or without NoImplicitPrelude.


-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#define LT(n,m) (n Happy_Prelude.< m)
#define GTE(n,m) (n Happy_Prelude.>= m)
#define EQ(n,m) (n Happy_Prelude.== m)
#define PLUS(n,m) (n Happy_Prelude.+ m)
#define MINUS(n,m) (n Happy_Prelude.- m)
#define TIMES(n,m) (n Happy_Prelude.* m)
#define NEGATE(n) (Happy_Prelude.negate (n))

type Happy_Int = Happy_Prelude.Int
data Happy_IntList = HappyCons Happy_Int Happy_IntList

#define INVALID_TOK (-1)
#define ERROR_TOK 0
#define CATCH_TOK 1

#if defined(HAPPY_COERCE)
#  error `HAPPY_COERCE` requires `HAPPY_GHC`
#else
#  define GET_ERROR_TOKEN(x)  (case x of { HappyErrorToken i -> i })
#  define MK_ERROR_TOKEN(i)   (HappyErrorToken i)
#  define MK_TOKEN(x)         (HappyTerminal (x))
#endif

#if defined(HAPPY_DEBUG)
#  define DEBUG_TRACE(s)    (happyTrace (s)) Happy_Prelude.$
happyTrace string expr = Happy_System_IO_Unsafe.unsafePerformIO Happy_Prelude.$ do
    Happy_System_IO.hPutStr Happy_System_IO.stderr string
    Happy_Prelude.return expr
#else
#  define DEBUG_TRACE(s)    {- nothing -}
#endif

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyDoParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept ERROR_TOK tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) =
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

happyDoAction i tk st =
  DEBUG_TRACE("state: " Happy_Prelude.++ Happy_Prelude.show (st) Happy_Prelude.++
              ",\ttoken: " Happy_Prelude.++ Happy_Prelude.show (i) Happy_Prelude.++
              ",\taction: ")
  case happyDecodeAction (happyNextAction i st) of
    HappyFail             -> DEBUG_TRACE("failing.\n")
                             happyFail i tk st
    HappyAccept           -> DEBUG_TRACE("accept.\n")
                             happyAccept i tk st
    HappyReduce rule      -> DEBUG_TRACE("reduce (rule " Happy_Prelude.++ Happy_Prelude.show (rule) Happy_Prelude.++ ")")
                             (happyReduceArr Happy_Data_Array.! (rule)) i tk st
    HappyShift  new_state -> DEBUG_TRACE("shift, enter state " Happy_Prelude.++ Happy_Prelude.show (new_state) Happy_Prelude.++ "\n")
                             happyShift new_state i tk st

{-# INLINE happyNextAction #-}
happyNextAction i st = case happyIndexActionTable i st of
  Happy_Prelude.Just (act) -> act
  Happy_Prelude.Nothing                      -> happyIndexOffAddr happyDefActions st

{-# INLINE happyIndexActionTable #-}
happyIndexActionTable i st
  | GTE(i, 0), GTE(off, 0), EQ(happyIndexOffAddr happyCheck off, i)
  -- i >= 0:   Guard against INVALID_TOK (do the default action, which ultimately errors)
  -- off >= 0: Otherwise it's a default action
  -- equality check: Ensure that the entry in the compressed array is owned by st
  = Happy_Prelude.Just ((happyIndexOffAddr happyTable off))
  | Happy_Prelude.otherwise
  = Happy_Prelude.Nothing
  where
    off = PLUS(happyIndexOffAddr happyActOffsets st, i)

data HappyAction
  = HappyFail
  | HappyAccept
  | HappyReduce Happy_Int -- rule number
  | HappyShift Happy_Int  -- new state
  deriving Happy_Prelude.Show

{-# INLINE happyDecodeAction #-}
happyDecodeAction :: Happy_Int -> HappyAction
happyDecodeAction  0                        = HappyFail
happyDecodeAction (-1)                        = HappyAccept
happyDecodeAction action | LT(action, 0)    = HappyReduce NEGATE(PLUS(action, 1))
                         | Happy_Prelude.otherwise = HappyShift MINUS(action, 1)

{-# INLINE happyIndexGotoTable #-}
happyIndexGotoTable nt st = happyIndexOffAddr happyTable off
  where
    off = PLUS(happyIndexOffAddr happyGotoOffsets st, nt)

{-# INLINE happyIndexOffAddr #-}
happyIndexOffAddr :: HappyAddr -> Happy_Int -> Happy_Int
happyIndexOffAddr (HappyA arr) off = arr Happy_Data_Array.! off

happyIndexRuleArr :: Happy_Int -> (Happy_Int, Happy_Int)
happyIndexRuleArr r = (nt, len)
  where
    !n_starts = happy_n_starts   -- this is to test whether we have a start token
    offs = TIMES(MINUS(r,n_starts),2)
    nt = happyIndexOffAddr happyRuleArr offs
    len = happyIndexOffAddr happyRuleArr PLUS(offs,1)

newtype HappyAddr = HappyA (Happy_Data_Array.Array Happy_Prelude.Int Happy_Prelude.Int)

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state ERROR_TOK tk st sts stk@(x `HappyStk` _) =
     -- See "Error Fixup" below
     let i = GET_ERROR_TOKEN(x) in
     DEBUG_TRACE("shifting the error token")
     happyDoAction i tk new_state (HappyCons st sts) stk

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons st sts) (MK_TOKEN(tk) `HappyStk` stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 nt fn j tk st sts stk
     = happySeq fn (happyGoto nt j tk st (HappyCons st sts) (fn `HappyStk` stk))

happySpecReduce_1 nt fn j tk old_st sts@(HappyCons st _) (v1 `HappyStk` stk')
     = let r = fn v1 in
       happyTcHack old_st (happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk')))

happySpecReduce_2 nt fn j tk old_st
  (HappyCons _ sts@(HappyCons st _))
  (v1 `HappyStk` v2 `HappyStk` stk')
     = let r = fn v1 v2 in
       happyTcHack old_st (happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk')))

happySpecReduce_3 nt fn j tk old_st
  (HappyCons _ (HappyCons _ sts@(HappyCons st _)))
  (v1 `HappyStk` v2 `HappyStk` v3 `HappyStk` stk')
     = let r = fn v1 v2 v3 in
       happyTcHack old_st (happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk')))

happyReduce k nt fn j tk st sts stk
     = case happyDrop MINUS(k,(1 :: Happy_Int)) sts of
         sts1@(HappyCons st1 _) ->
                let r = fn stk in -- it doesn't hurt to always seq here...
                st `happyTcHack` happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons st sts) of
        sts1@(HappyCons st1 _) ->
          let drop_stk = happyDropStk k stk in
          j `happyTcHack` happyThen1 (fn stk tk)
                                     (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons st sts) of
        sts1@(HappyCons st1 _) ->
          let drop_stk = happyDropStk k stk
              off = happyIndexOffAddr happyGotoOffsets st1
              off_i = PLUS(off, nt)
              new_state = happyIndexOffAddr happyTable off_i
          in
            j `happyTcHack` happyThen1 (fn stk tk)
                                       (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0 l               = l
happyDrop n  (HappyCons _ t) = happyDrop MINUS(n,(1 :: Happy_Int)) t

happyDropStk 0 l                 = l
happyDropStk n  (x `HappyStk` xs) = happyDropStk MINUS(n,(1::Happy_Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

happyGoto nt j tk st =
   DEBUG_TRACE(", goto state " Happy_Prelude.++ Happy_Prelude.show (new_state) Happy_Prelude.++ "\n")
   happyDoAction j tk new_state
  where new_state = happyIndexGotoTable nt st

{- Note [Error recovery]
~~~~~~~~~~~~~~~~~~~~~~~~
When there is no applicable action for the current lookahead token `tk`,
happy enters error recovery mode. Depending on whether the grammar file
declares the two action form `%error { abort } { report }` for
    Resumptive Error Handling,
it works in one (not resumptive) or two phases (resumptive):

 1. Fixup mode:
    Try to see if there is an action for the error token ERROR_TOK. If there
    is, do *not* emit an error and pretend instead that an `error` token was
    inserted.
    When there is no ERROR_TOK action, report an error.

    In non-resumptive error handling, calling the single error handler
    (e.g. `happyError`) will throw an exception and abort the parser.
    However, in resumptive error handling we enter *error resumption mode*.

 2. Error resumption mode:
    After reporting the error (with `report`), happy will attempt to find
    a good state stack to resume parsing in.
    For each candidate stack, it discards input until one of the candidates
    resumes (i.e. shifts the current input).
    If no candidate resumes before the end of input, resumption failed and
    calls the `abort` function, to much the same effect as in non-resumptive
    error handling.

    Candidate stacks are declared by the grammar author using the special
    `catch` terminal and called "catch frames".
    This mechanism is described in detail in Note [happyResume].

The `catch` resumption mechanism (2) is what usually is associated with
`error` in `bison` or `menhir`. Since `error` is used for the Fixup mechanism
(1) above, we call the corresponding token `catch`.
Furthermore, in constrast to `bison`, our implementation of `catch`
non-deterministically considers multiple catch frames on the stack for
resumption (See Note [Multiple catch frames]).

Note [happyResume]
~~~~~~~~~~~~~~~~~~
`happyResume` implements the resumption mechanism from Note [Error recovery].
It is best understood by example. Consider

Exp :: { String }
Exp : '1'                { "1" }
    | catch              { "catch" }
    | Exp '+' Exp %shift { $1 Happy_Prelude.++ " + " Happy_Prelude.++ $3 } -- %shift: associate 1 + 1 + 1 to the right
    | '(' Exp ')'        { "(" Happy_Prelude.++ $2 Happy_Prelude.++ ")" }

The idea of the use of `catch` here is that upon encountering a parse error
during expression parsing, we can gracefully degrade using the `catch` rule,
still producing a partial syntax tree and keep on parsing to find further
syntax errors.

Let's trace the parser state for input 11+1, which will error out after shifting 1.
After shifting, we have the following item stack (growing downwards and omitting
transitive closure items):

  State 0: %start_parseExp -> . Exp
  State 5: Exp -> '1' .

(Stack as a list of state numbers: [5,0].)
As Note [Error recovery] describes, we will first try Fixup mode.
That fails because no production can shift the `error` token.
Next we try Error resumption mode. This works as follows:

  1. Pop off the item stack until we find an item that can shift the `catch`
     token. (Implemented in `pop_items`.)
       * State 5 cannot shift catch. Pop.
       * State 0 can shift catch, which would transition into
          State 4: Exp -> catch .
     So record the *stack* `[4,0]` after doing the shift transition.
     We call this a *catch frame*, where the top is a *catch state*,
     corresponding to an item in which we just shifted a `catch` token.
     There can be multiple such catch stacks, see Note [Multiple catch frames].

  2. Discard tokens from the input until the lookahead can be shifted in one
     of the catch stacks. (Implemented in `discard_input_until_exp` and
     `some_catch_state_shifts`.)
       * We cannot shift the current lookahead '1' in state 4, so we discard
       * We *can* shift the next lookahead '+' in state 4, but only after
         reducing, which pops State 4 and goes to State 3:
           State 3: %start_parseExp -> Exp .
                    Exp -> Exp . '+' Exp
         Here we can shift '+'.
     As you can see, to implement this machinery we need to simulate
     the operation of the LALR automaton, especially reduction
     (`happySimulateReduce`).

Note [Multiple catch frames]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
For fewer spurious error messages, it can be beneficial to trace multiple catch
items. Consider

Exp : '1'
    | catch
    | Exp '+' Exp %shift
    | '(' Exp ')'

Let's trace the parser state for input (;+1, which will error out after shifting (.
After shifting, we have the following item stack (growing downwards):

  State 0: %start_parseExp -> . Exp
  State 6: Exp -> '(' . Exp ')'

Upon error, we want to find items in the stack which can shift a catch token.
Note that both State 0 and State 6 can shift a catch token, transitioning into
  State 4: Exp -> catch .
Hence we record the catch frames `[4,6,0]` and `[4,0]` for possible resumption.

Which catch frame do we pick for resumption?
Note that resuming catch frame `[4,0]` will parse as "catch+1", whereas
resuming the innermost frame `[4,6,0]` corresponds to parsing "(catch+1".
The latter would keep discarding input until the closing ')' is found.
So we will discard + and 1, leading to a spurious syntax error at the end of
input, aborting the parse and never producing a partial syntax tree. Bad!

It is far preferable to resume with catch frame `[4,0]`, where we can resume
successfully on input +, so that is what we do.

In general, we pick the catch frame for resumption that discards the least
amount of input for a successful shift, preferring the topmost such catch frame.
-}

-- happyFail :: Happy_Int -> Token -> Happy_Int -> _
-- This function triggers Note [Error recovery].
-- If the current token is ERROR_TOK, phase (1) has failed and we might try
-- phase (2).
happyFail ERROR_TOK = happyFixupFailed
happyFail i         = happyTryFixup i

-- Enter Error Fixup (see Note [Error recovery]):
-- generate an error token, save the old token and carry on.
-- When a `happyShift` accepts the error token, we will pop off the error token
-- to resume parsing with the current lookahead `i`.
happyTryFixup i tk action sts stk =
  DEBUG_TRACE("entering `error` fixup.\n")
  happyDoAction ERROR_TOK tk action sts (MK_ERROR_TOKEN(i) `HappyStk` stk)
  -- NB: `happyShift` will simply pop the error token and carry on with
  --     `tk`. Hence we don't change `tk` in the call here

-- See Note [Error recovery], phase (2).
-- Enter resumption mode after reporting the error by calling `happyResume`.
happyFixupFailed tk st sts (x `HappyStk` stk) =
  let i = GET_ERROR_TOKEN(x) in
  DEBUG_TRACE("`error` fixup failed.\n")
  let resume   = happyResume i tk st sts stk
      expected = happyExpectedTokens st sts in
  happyReport i tk expected resume

-- happyResume :: Happy_Int -> Token -> Happy_Int -> _
-- See Note [happyResume]
happyResume i tk st sts stk = pop_items [] st sts stk
  where
    !(n_starts) = happy_n_starts   -- this is to test whether we have a start token
    !(eof_i) = happy_n_terms Happy_Prelude.- 1   -- this is the token number of the EOF token
    happy_list_to_list :: Happy_IntList -> [Happy_Prelude.Int]
    happy_list_to_list (HappyCons st sts)
      | LT(st, n_starts)
      = [(st)]
      | Happy_Prelude.otherwise
      = (st) : happy_list_to_list sts

    -- See (1) of Note [happyResume]
    pop_items catch_frames st sts stk
      | LT(st, n_starts)
      = DEBUG_TRACE("reached start state " Happy_Prelude.++ Happy_Prelude.show (st) Happy_Prelude.++ ", ")
        if Happy_Prelude.null catch_frames_new
          then DEBUG_TRACE("no resumption.\n")
               happyAbort
          else DEBUG_TRACE("now discard input, trying to anchor in states " Happy_Prelude.++ Happy_Prelude.show (Happy_Prelude.map (happy_list_to_list . Happy_Prelude.fst) (Happy_Prelude.reverse catch_frames_new)) Happy_Prelude.++ ".\n")
               discard_input_until_exp i tk (Happy_Prelude.reverse catch_frames_new)
      | (HappyCons st1 sts1) <- sts, _ `HappyStk` stk1 <- stk
      = pop_items catch_frames_new st1 sts1 stk1
      where
        !catch_frames_new
          | HappyShift new_state <- happyDecodeAction (happyNextAction CATCH_TOK st)
          , DEBUG_TRACE("can shift catch token in state " Happy_Prelude.++ Happy_Prelude.show (st) Happy_Prelude.++ ", into state " Happy_Prelude.++ Happy_Prelude.show (new_state) Happy_Prelude.++ "\n")
            Happy_Prelude.null (Happy_Prelude.filter (\(HappyCons _ (HappyCons h _),_) -> EQ(st,h)) catch_frames)
          = (HappyCons new_state (HappyCons st sts), MK_ERROR_TOKEN(i) `HappyStk` stk):catch_frames -- MK_ERROR_TOKEN(i) is just some dummy that should not be accessed by user code
          | Happy_Prelude.otherwise
          = DEBUG_TRACE("already shifted or can't shift catch in " Happy_Prelude.++ Happy_Prelude.show (st) Happy_Prelude.++ "\n")
            catch_frames

    -- See (2) of Note [happyResume]
    discard_input_until_exp i tk catch_frames
      | Happy_Prelude.Just (HappyCons st (HappyCons catch_st sts), catch_frame) <- some_catch_state_shifts i catch_frames
      = DEBUG_TRACE("found expected token in state " Happy_Prelude.++ Happy_Prelude.show (st) Happy_Prelude.++ " after shifting from " Happy_Prelude.++ Happy_Prelude.show (catch_st) Happy_Prelude.++ ": " Happy_Prelude.++ Happy_Prelude.show (i) Happy_Prelude.++ "\n")
        happyDoAction i tk st (HappyCons catch_st sts) catch_frame
      | EQ(i,eof_i) -- is i EOF?
      = DEBUG_TRACE("reached EOF, cannot resume. abort parse :(\n")
        happyAbort
      | Happy_Prelude.otherwise
      = DEBUG_TRACE("discard token " Happy_Prelude.++ Happy_Prelude.show (i) Happy_Prelude.++ "\n")
        happyLex (\eof_tk -> discard_input_until_exp eof_i eof_tk catch_frames) -- eof
                 (\i tk   -> discard_input_until_exp i tk catch_frames)         -- not eof

    some_catch_state_shifts _ [] = DEBUG_TRACE("no catch state could shift.\n") Happy_Prelude.Nothing
    some_catch_state_shifts i catch_frames@(((HappyCons st sts),_):_) = try_head i st sts catch_frames
      where
        try_head i st sts catch_frames = -- PRECONDITION: head catch_frames = (HappyCons st sts)
          DEBUG_TRACE("trying token " Happy_Prelude.++ Happy_Prelude.show (i) Happy_Prelude.++ " in state " Happy_Prelude.++ Happy_Prelude.show (st) Happy_Prelude.++ ": ")
          case happyDecodeAction (happyNextAction i st) of
            HappyFail     -> DEBUG_TRACE("fail.\n")   some_catch_state_shifts i (Happy_Prelude.tail catch_frames)
            HappyAccept   -> DEBUG_TRACE("accept.\n") Happy_Prelude.Just (Happy_Prelude.head catch_frames)
            HappyShift _  -> DEBUG_TRACE("shift.\n")  Happy_Prelude.Just (Happy_Prelude.head catch_frames)
            HappyReduce r -> case happySimulateReduce r st sts of
              (HappyCons st1 sts1) -> try_head i st1 sts1 catch_frames

happySimulateReduce r st sts =
  DEBUG_TRACE("simulate reduction of rule " Happy_Prelude.++ Happy_Prelude.show (r) Happy_Prelude.++ ", ")
  let (nt, len) = happyIndexRuleArr r in
  DEBUG_TRACE("nt " Happy_Prelude.++ Happy_Prelude.show (nt) Happy_Prelude.++ ", len: " Happy_Prelude.++ Happy_Prelude.show (len) Happy_Prelude.++ ", new_st ")
  let !(sts1@(HappyCons st1 _)) = happyDrop len (HappyCons st sts)
      new_st = happyIndexGotoTable nt st1 in
  DEBUG_TRACE(Happy_Prelude.show (new_st) Happy_Prelude.++ ".\n")
  (HappyCons new_st sts1)

happyTokenToString :: Happy_Prelude.Int -> Happy_Prelude.String
happyTokenToString i = happyTokenStrings Happy_Prelude.!! (i Happy_Prelude.- 2) -- 2: errorTok, catchTok

happyExpectedTokens :: Happy_Int -> Happy_IntList -> [Happy_Prelude.String]
-- Upon a parse error, we want to suggest tokens that are expected in that
-- situation. This function computes such tokens.
-- It works by examining the top of the state stack.
-- For every token number that does a shift transition, record that token number.
-- For every token number that does a reduce transition, simulate that reduction
-- on the state state stack and repeat.
-- The recorded token numbers are then formatted with 'happyTokenToString' and
-- returned.
happyExpectedTokens st sts =
  DEBUG_TRACE("constructing expected tokens.\n")
  Happy_Prelude.map happyTokenToString (search_shifts st sts [])
  where
    search_shifts st sts shifts = Happy_Prelude.foldr (add_action st sts) shifts (distinct_actions st)
    add_action st sts (i, act) shifts =
      DEBUG_TRACE("found action in state " Happy_Prelude.++ Happy_Prelude.show (st) Happy_Prelude.++ ", input " Happy_Prelude.++ Happy_Prelude.show (i) Happy_Prelude.++ ", " Happy_Prelude.++ Happy_Prelude.show (happyDecodeAction act) Happy_Prelude.++ "\n")
      case happyDecodeAction act of
        HappyFail     -> shifts
        HappyAccept   -> shifts -- This would always be %eof or error... Not helpful
        HappyShift _  -> Happy_Prelude.insert (i) shifts
        HappyReduce r -> case happySimulateReduce r st sts of
          (HappyCons st1 sts1) -> search_shifts st1 sts1 shifts
    distinct_actions st
      -- The (token number, action) pairs of all actions in the given state
      = ((-1), ((happyIndexOffAddr happyDefActions st)))
      : [ (i, act) | i <- [begin_i..happy_n_terms], act <- get_act row_off i ]
      where
        row_off = happyIndexOffAddr happyActOffsets st
        begin_i = 2 -- +2: errorTok,catchTok
    get_act off (i) -- happyIndexActionTable with cached row offset
      | let off_i = PLUS(off,i)
      , GTE(off_i,0)
      , EQ(happyIndexOffAddr happyCheck off_i,i)
      = [((happyIndexOffAddr happyTable off_i))]
      | Happy_Prelude.otherwise
      = []

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Happy_Prelude.error "Internal Happy parser panic. This is not supposed to happen! Please open a bug report at https://github.com/haskell/happy/issues.\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions

happyTcHack :: Happy_Int -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}

-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Happy_Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.


#endif