{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = {
      ghci = false;
      stage1 = false;
      stage2 = false;
      stage3 = false;
      terminfo = true;
      integer-simple = false;
      integer-gmp = false;
      dynamic-system-linker = true;
      };
    package = {
      specVersion = "1.10";
      identifier = { name = "ghc"; version = "8.10.7"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "glasgow-haskell-users@haskell.org";
      author = "The GHC Team";
      homepage = "http://www.haskell.org/ghc/";
      url = "";
      synopsis = "The GHC API";
      description = "GHC's functionality can be useful for more things than just\ncompiling Haskell programs. Important use cases are programs\nthat analyse (and perhaps transform) Haskell code. Others\ninclude loading Haskell code dynamically in a GHCi-like manner.\nFor this reason, a lot of GHC's functionality is made available\nthrough this package.";
      buildType = "Simple";
      isLocal = true;
      detailLevel = "FullDetails";
      licenseFiles = [ "LICENSE" ];
      dataDir = ".";
      dataFiles = [];
      extraSrcFiles = [];
      extraTmpFiles = [];
      extraDocFiles = [];
      };
    components = {
      "library" = {
        depends = ((([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."hpc" or (errorHandler.buildDepError "hpc"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."ghc-boot" or (errorHandler.buildDepError "ghc-boot"))
          (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
          (hsPkgs."ghc-heap" or (errorHandler.buildDepError "ghc-heap"))
          (hsPkgs."ghci" or (errorHandler.buildDepError "ghci"))
          ] ++ (if system.isWindows
          then [ (hsPkgs."Win32" or (errorHandler.buildDepError "Win32")) ]
          else [
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ] ++ (pkgs.lib).optional (flags.terminfo) (hsPkgs."terminfo" or (errorHandler.buildDepError "terminfo")))) ++ (pkgs.lib).optional (flags.integer-gmp && flags.integer-simple) (hsPkgs."invalid-cabal-flag-settings" or (errorHandler.buildDepError "invalid-cabal-flag-settings"))) ++ (pkgs.lib).optional (flags.integer-gmp) (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"))) ++ (pkgs.lib).optional (flags.integer-simple) (hsPkgs."integer-simple" or (errorHandler.buildDepError "integer-simple"));
        buildable = true;
        modules = [
          "HieTypes"
          "HieDebug"
          "HieBin"
          "HieUtils"
          "HieAst"
          "Ar"
          "FileCleanup"
          "DriverBkp"
          "BkpSyn"
          "NameShape"
          "RnModIface"
          "Avail"
          "AsmUtils"
          "BasicTypes"
          "ConLike"
          "DataCon"
          "PatSyn"
          "Demand"
          "Debug"
          "Exception"
          "FieldLabel"
          "GhcMonad"
          "Hooks"
          "Id"
          "IdInfo"
          "Predicate"
          "Lexeme"
          "Literal"
          "Llvm"
          "Llvm/AbsSyn"
          "Llvm/MetaData"
          "Llvm/PpLlvm"
          "Llvm/Types"
          "LlvmCodeGen"
          "LlvmCodeGen/Base"
          "LlvmCodeGen/CodeGen"
          "LlvmCodeGen/Data"
          "LlvmCodeGen/Ppr"
          "LlvmCodeGen/Regs"
          "LlvmMangler"
          "MkId"
          "Module"
          "Name"
          "NameEnv"
          "NameSet"
          "OccName"
          "RdrName"
          "NameCache"
          "SrcLoc"
          "UniqSupply"
          "Unique"
          "Var"
          "VarEnv"
          "VarSet"
          "UnVarGraph"
          "BlockId"
          "CLabel"
          "Cmm"
          "CmmBuildInfoTables"
          "CmmPipeline"
          "CmmCallConv"
          "CmmCommonBlockElim"
          "CmmImplementSwitchPlans"
          "CmmContFlowOpt"
          "CmmExpr"
          "CmmInfo"
          "CmmLex"
          "CmmLint"
          "CmmLive"
          "CmmMachOp"
          "CmmMonad"
          "CmmSwitch"
          "CmmNode"
          "CmmOpt"
          "CmmParse"
          "CmmProcPoint"
          "CmmSink"
          "CmmType"
          "CmmUtils"
          "CmmLayoutStack"
          "CliOption"
          "EnumSet"
          "GhcNameVersion"
          "FileSettings"
          "MkGraph"
          "PprBase"
          "PprC"
          "PprCmm"
          "PprCmmDecl"
          "PprCmmExpr"
          "Bitmap"
          "GHC/Platform/Regs"
          "GHC/Platform/ARM"
          "GHC/Platform/AArch64"
          "GHC/Platform/NoRegs"
          "GHC/Platform/PPC"
          "GHC/Platform/S390X"
          "GHC/Platform/SPARC"
          "GHC/Platform/X86"
          "GHC/Platform/X86_64"
          "GHC/StgToCmm/CgUtils"
          "GHC/StgToCmm"
          "GHC/StgToCmm/Bind"
          "GHC/StgToCmm/Closure"
          "GHC/StgToCmm/DataCon"
          "GHC/StgToCmm/Env"
          "GHC/StgToCmm/Expr"
          "GHC/StgToCmm/Foreign"
          "GHC/StgToCmm/Heap"
          "GHC/StgToCmm/Hpc"
          "GHC/StgToCmm/ArgRep"
          "GHC/StgToCmm/Layout"
          "GHC/StgToCmm/Monad"
          "GHC/StgToCmm/Prim"
          "GHC/StgToCmm/Prof"
          "GHC/StgToCmm/Ticky"
          "GHC/StgToCmm/Utils"
          "GHC/StgToCmm/ExtCode"
          "SMRep"
          "CoreArity"
          "CoreFVs"
          "CoreLint"
          "CorePrep"
          "CoreSubst"
          "CoreOpt"
          "CoreSyn"
          "TrieMap"
          "CoreTidy"
          "CoreUnfold"
          "CoreUtils"
          "CoreMap"
          "CoreSeq"
          "CoreStats"
          "MkCore"
          "PprCore"
          "GHC/HsToCore/PmCheck/Oracle"
          "GHC/HsToCore/PmCheck/Ppr"
          "GHC/HsToCore/PmCheck/Types"
          "GHC/HsToCore/PmCheck"
          "Coverage"
          "Desugar"
          "DsArrows"
          "DsBinds"
          "DsCCall"
          "DsExpr"
          "DsForeign"
          "DsGRHSs"
          "DsListComp"
          "DsMonad"
          "DsUsage"
          "DsUtils"
          "ExtractDocs"
          "Match"
          "MatchCon"
          "MatchLit"
          "GHC/Hs"
          "GHC/Hs/Binds"
          "GHC/Hs/Decls"
          "GHC/Hs/Doc"
          "GHC/Hs/Expr"
          "GHC/Hs/ImpExp"
          "GHC/Hs/Lit"
          "GHC/Hs/PlaceHolder"
          "GHC/Hs/Extension"
          "GHC/Hs/Instances"
          "GHC/Hs/Pat"
          "GHC/Hs/Types"
          "GHC/Hs/Utils"
          "GHC/Hs/Dump"
          "BinIface"
          "BinFingerprint"
          "BuildTyCl"
          "IfaceEnv"
          "IfaceSyn"
          "IfaceType"
          "ToIface"
          "LoadIface"
          "MkIface"
          "TcIface"
          "FlagChecker"
          "Annotations"
          "CmdLineParser"
          "CodeOutput"
          "Config"
          "Constants"
          "DriverMkDepend"
          "DriverPhases"
          "PipelineMonad"
          "DriverPipeline"
          "DynFlags"
          "ErrUtils"
          "Finder"
          "GHC"
          "GhcMake"
          "GhcPlugins"
          "GhcPrelude"
          "DynamicLoading"
          "HeaderInfo"
          "HscMain"
          "HscStats"
          "HscTypes"
          "InteractiveEval"
          "InteractiveEvalTypes"
          "PackageConfig"
          "Packages"
          "PlatformConstants"
          "Plugins"
          "TcPluginM"
          "PprTyThing"
          "Settings"
          "StaticPtrTable"
          "SysTools"
          "SysTools/BaseDir"
          "SysTools/Terminal"
          "SysTools/ExtraObj"
          "SysTools/Info"
          "SysTools/Process"
          "SysTools/Tasks"
          "SysTools/Settings"
          "Elf"
          "TidyPgm"
          "Ctype"
          "HaddockUtils"
          "Lexer"
          "OptCoercion"
          "Parser"
          "RdrHsSyn"
          "ApiAnnotation"
          "ForeignCall"
          "KnownUniques"
          "PrelInfo"
          "PrelNames"
          "PrelRules"
          "PrimOp"
          "ToolSettings"
          "TysPrim"
          "TysWiredIn"
          "CostCentre"
          "CostCentreState"
          "ProfInit"
          "RnBinds"
          "RnEnv"
          "RnExpr"
          "RnHsDoc"
          "RnNames"
          "RnPat"
          "RnSource"
          "RnSplice"
          "RnTypes"
          "RnFixity"
          "RnUtils"
          "RnUnbound"
          "CoreMonad"
          "CSE"
          "FloatIn"
          "FloatOut"
          "LiberateCase"
          "OccurAnal"
          "SAT"
          "SetLevels"
          "SimplCore"
          "SimplEnv"
          "SimplMonad"
          "SimplUtils"
          "Simplify"
          "SimplStg"
          "StgStats"
          "StgCse"
          "StgLiftLams"
          "StgLiftLams/Analysis"
          "StgLiftLams/LiftM"
          "StgLiftLams/Transformation"
          "StgSubst"
          "UnariseStg"
          "RepType"
          "Rules"
          "SpecConstr"
          "Specialise"
          "CoreToStg"
          "StgLint"
          "StgSyn"
          "StgFVs"
          "CallArity"
          "DmdAnal"
          "Exitify"
          "WorkWrap"
          "WwLib"
          "FamInst"
          "ClsInst"
          "Inst"
          "TcAnnotations"
          "TcArrows"
          "TcBinds"
          "TcSigs"
          "TcClassDcl"
          "TcDefaults"
          "TcDeriv"
          "TcDerivInfer"
          "TcDerivUtils"
          "TcEnv"
          "TcExpr"
          "TcForeign"
          "TcGenDeriv"
          "TcGenFunctor"
          "TcGenGenerics"
          "TcHsSyn"
          "TcHsType"
          "TcInstDcls"
          "TcMType"
          "TcValidity"
          "TcMatches"
          "TcPat"
          "TcPatSyn"
          "TcRnDriver"
          "TcBackpack"
          "TcRnExports"
          "TcRnMonad"
          "TcRnTypes"
          "Constraint"
          "TcOrigin"
          "TcRules"
          "TcSimplify"
          "TcHoleErrors"
          "TcHoleFitTypes"
          "TcErrors"
          "TcTyClsDecls"
          "TcTyDecls"
          "TcTypeable"
          "TcType"
          "TcEvidence"
          "TcEvTerm"
          "TcUnify"
          "TcInteract"
          "TcCanonical"
          "TcFlatten"
          "TcSMonad"
          "TcTypeNats"
          "TcSplice"
          "Class"
          "Coercion"
          "DsMeta"
          "THNames"
          "FamInstEnv"
          "FunDeps"
          "InstEnv"
          "TyCon"
          "CoAxiom"
          "Type"
          "TyCoRep"
          "TyCoFVs"
          "TyCoSubst"
          "TyCoPpr"
          "TyCoTidy"
          "Unify"
          "Bag"
          "Binary"
          "BooleanFormula"
          "BufWrite"
          "Digraph"
          "Encoding"
          "FastFunctions"
          "FastMutInt"
          "FastString"
          "FastStringEnv"
          "Fingerprint"
          "FiniteMap"
          "FV"
          "GraphBase"
          "GraphColor"
          "GraphOps"
          "GraphPpr"
          "IOEnv"
          "Json"
          "ListSetOps"
          "Maybes"
          "MonadUtils"
          "OrdList"
          "Outputable"
          "Pair"
          "Panic"
          "PlainPanic"
          "PprColour"
          "Pretty"
          "State"
          "Stream"
          "StringBuffer"
          "UniqDFM"
          "UniqDSet"
          "UniqFM"
          "UniqMap"
          "UniqSet"
          "Util"
          "Hoopl/Block"
          "Hoopl/Collections"
          "Hoopl/Dataflow"
          "Hoopl/Graph"
          "Hoopl/Label"
          "AsmCodeGen"
          "TargetReg"
          "NCGMonad"
          "Instruction"
          "BlockLayout"
          "CFG"
          "Dominators"
          "Format"
          "Reg"
          "RegClass"
          "PIC"
          "CPrim"
          "X86/Regs"
          "X86/RegInfo"
          "X86/Instr"
          "X86/Cond"
          "X86/Ppr"
          "X86/CodeGen"
          "PPC/Regs"
          "PPC/RegInfo"
          "PPC/Instr"
          "PPC/Cond"
          "PPC/Ppr"
          "PPC/CodeGen"
          "SPARC/Base"
          "SPARC/Regs"
          "SPARC/Imm"
          "SPARC/AddrMode"
          "SPARC/Cond"
          "SPARC/Instr"
          "SPARC/Stack"
          "SPARC/ShortcutJump"
          "SPARC/Ppr"
          "SPARC/CodeGen"
          "SPARC/CodeGen/Amode"
          "SPARC/CodeGen/Base"
          "SPARC/CodeGen/CondCode"
          "SPARC/CodeGen/Gen32"
          "SPARC/CodeGen/Gen64"
          "SPARC/CodeGen/Sanity"
          "SPARC/CodeGen/Expand"
          "RegAlloc/Liveness"
          "RegAlloc/Graph/Main"
          "RegAlloc/Graph/Stats"
          "RegAlloc/Graph/ArchBase"
          "RegAlloc/Graph/ArchX86"
          "RegAlloc/Graph/Coalesce"
          "RegAlloc/Graph/Spill"
          "RegAlloc/Graph/SpillClean"
          "RegAlloc/Graph/SpillCost"
          "RegAlloc/Graph/TrivColorable"
          "RegAlloc/Linear/Main"
          "RegAlloc/Linear/JoinToTargets"
          "RegAlloc/Linear/State"
          "RegAlloc/Linear/Stats"
          "RegAlloc/Linear/FreeRegs"
          "RegAlloc/Linear/StackMap"
          "RegAlloc/Linear/Base"
          "RegAlloc/Linear/X86/FreeRegs"
          "RegAlloc/Linear/X86_64/FreeRegs"
          "RegAlloc/Linear/PPC/FreeRegs"
          "RegAlloc/Linear/SPARC/FreeRegs"
          "Dwarf"
          "Dwarf/Types"
          "Dwarf/Constants"
          "GHC/ThToHs"
          "ByteCodeTypes"
          "ByteCodeAsm"
          "ByteCodeGen"
          "ByteCodeInstr"
          "ByteCodeItbls"
          "ByteCodeLink"
          "Debugger"
          "LinkerTypes"
          "Linker"
          "RtClosureInspect"
          "GHCi"
          ];
        cSources = [
          "parser/cutils.c"
          "ghci/keepCAFsForGHCi.c"
          "cbits/genSym.c"
          ];
        hsSourceDirs = [
          "."
          "backpack"
          "basicTypes"
          "cmm"
          "coreSyn"
          "deSugar"
          "ghci"
          "iface"
          "llvmGen"
          "main"
          "nativeGen"
          "parser"
          "prelude"
          "profiling"
          "rename"
          "simplCore"
          "simplStg"
          "specialise"
          "stgSyn"
          "stranal"
          "typecheck"
          "types"
          "utils"
          "hieFile"
          ];
        includeDirs = ([
          "."
          "parser"
          "utils"
          ] ++ (pkgs.lib).optional (flags.ghci) "../rts/dist/build") ++ (if flags.stage1
          then [ "stage1" ]
          else if flags.stage2
            then [ "stage2" ]
            else (pkgs.lib).optional (flags.stage3) "stage2");
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ../compiler; }