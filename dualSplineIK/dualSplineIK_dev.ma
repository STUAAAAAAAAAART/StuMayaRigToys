//Maya ASCII 2022 scene
//Name: dualSplineIK_dev.ma
//Last modified: Fri, May 23, 2025 01:55:28 AM
//Codeset: 1252
requires maya "2022";
requires -nodeType "inverseMatrix" "matrixNodes" "1.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202108111415-612a77abf4";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 19045)";
fileInfo "UUID" "92369B04-4C3F-68BB-3BFE-C39BADD0CC55";
createNode transform -s -n "persp";
	rename -uid "99FE6BF1-4CFE-C7DC-99CD-A9B7A518F8EA";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 9.4004333693512994 18.123482059565202 29.625835189363023 ;
	setAttr ".r" -type "double3" -30.938352729981542 -705.79999999998415 359.99999999995589 ;
	setAttr ".rp" -type "double3" 0 -8.8817841970012523e-16 0 ;
	setAttr ".rpt" -type "double3" -2.6605055536133331e-15 1.297235707680796e-15 -9.3184350563481208e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "CC29FC39-40BB-A5CF-03FC-00883A1B5AFC";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 33.692837551492374;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 6 0 11.00000000000002 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "F55E58AD-4096-7CC3-81B6-AAA18A9B0748";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 7.9839708972441521 1000.16486111661 -0.69769462279518912 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "FEB33270-4355-675A-BA46-17BF04A2257A";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 998.45057540232426;
	setAttr ".ow" 16.864051478238718;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".tp" -type "double3" 7.9839708972441521 1.7142857142857282 -0.69769462279518912 ;
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "C5637776-4986-D67C-070A-209CE9536712";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 7.9839708972441521 1.7142857142857282 1000.1406648689006 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "BA0F28EE-414B-AD34-0DF8-FBABEB8C674B";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.8383594916958;
	setAttr ".ow" 16.864051478238718;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" 7.9839708972441521 1.7142857142857282 -0.69769462279518912 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "8146668B-437F-EFDA-147E-12AEDBE4B11F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1571613488289 1.7142857142857282 -0.69769462279518912 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "8A063F2C-41D0-BC37-5B37-BA8CF7B47865";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 992.17319045158479;
	setAttr ".ow" 6.9936034115139165;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".tp" -type "double3" 7.9839708972441521 1.7142857142857282 -0.69769462279518912 ;
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode joint -n "spine0";
	rename -uid "A2F33A07-45DF-5777-C063-79B0FDF45C5F";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" -90 0 26.565051177077986 ;
	setAttr ".radi" 0.5;
createNode joint -n "spine1" -p "spine0";
	rename -uid "097B3A23-46E0-E8D0-E65C-48BE516826A2";
	setAttr ".t" -type "double3" 4.4721359549995805 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 12.528807709151495 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "spine2" -p "spine1";
	rename -uid "CEDBD649-4557-E2EA-1AA2-F4997D362961";
	setAttr ".t" -type "double3" 4.1231056256176588 0 -3.3306690738754696e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 28.072486935852957 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "spine3" -p "spine2";
	rename -uid "60E3CE0D-4802-1952-4C90-46BB640907C3";
	setAttr ".t" -type "double3" 4.1231056256176606 0 -8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 12.528807709151542 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "spine4" -p "spine3";
	rename -uid "B2C6236D-44F1-7528-62C6-499CB4EFDC2F";
	setAttr ".t" -type "double3" 4.4721359549995778 0 8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 -26.565051177078001 0 ;
	setAttr ".radi" 0.5;
createNode transform -n "nurbsCircle1";
	rename -uid "79C046F9-481A-B0DF-3779-3DADEF6B14A3";
createNode nurbsCurve -n "nurbsCircleShape1" -p "nurbsCircle1";
	rename -uid "DBCB0E06-414B-10CA-DFA3-AABC147383C2";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		4.7982373409884725e-17 0.7836116248912246 -0.78361162489122449
		4.1550626846842558e-33 1.1081941875543877 -6.7857323231109122e-17
		-4.7982373409884725e-17 0.78361162489122438 0.78361162489122449
		-6.7857323231109146e-17 5.7448982375248304e-17 1.1081941875543881
		-4.7982373409884725e-17 -0.78361162489122449 0.78361162489122449
		-6.7973144778085889e-33 -1.1081941875543884 1.1100856969603225e-16
		4.7982373409884725e-17 -0.78361162489122438 -0.78361162489122449
		6.7857323231109146e-17 -1.511240500779959e-16 -1.1081941875543881
		4.7982373409884725e-17 0.7836116248912246 -0.78361162489122449
		4.1550626846842558e-33 1.1081941875543877 -6.7857323231109122e-17
		-4.7982373409884725e-17 0.78361162489122438 0.78361162489122449
		;
createNode joint -n "dualSplineDriver0" -p "nurbsCircle1";
	rename -uid "FB5B7AC3-4D8C-A84B-5D9A-118984441054";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90 0 23.198590719731474 ;
	setAttr ".bps" -type "matrix" 0.9191450286011964 0.39391930188517782 0 0 0 0 -1 0
		 -0.39391930188517782 0.91914502860119629 0 0 0 0 0 1;
	setAttr ".radi" 0.89846934685341584;
createNode joint -n "dualSplineDriver1" -p "dualSplineDriver0";
	rename -uid "90FA2F2F-4348-1CF1-1AE7-8597B2C4959F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" 8.7037407058327094 -2.0987189422975942e-17 1.8225803427254028e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.1529510807391641e-14 46.39718143946294 5.7647554036958219e-16 ;
	setAttr ".bps" -type "matrix" 0.91914502860119651 -0.3939193018851776 0 0 0 0 -1 0
		 0.3939193018851776 0.9191450286011964 0 0 8.0000000000000018 3.4285714626312256 0 1;
	setAttr ".radi" 0.89846934685341584;
createNode joint -n "dualSplineDriver2" -p "dualSplineDriver1";
	rename -uid "790CB9F7-4A44-203C-14A8-F5816C77D5A3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 8.7037407058327094 2.2204460492503131e-16 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.0277978552697739e-15 -23.19859071973146 -2.5952553045169493e-15 ;
	setAttr ".bps" -type "matrix" 1 -5.5511151231257827e-17 0 0 0 0 -1 0 5.5511151231257827e-17 0.99999999999999989 0 0
		 16.000000000000004 1.7763568394002505e-15 0 1;
	setAttr ".radi" 0.89846934685341584;
createNode transform -n "g_rigLogic";
	rename -uid "905E6DAB-433D-7050-B78E-8990F26E6029";
	setAttr ".v" no;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode transform -n "g_dualSplineIK_spine" -p "g_rigLogic";
	rename -uid "6DA6AF1E-471D-7BBC-3C49-C48101602F04";
	setAttr ".v" no;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode joint -n "jSplineSolver0" -p "g_dualSplineIK_spine";
	rename -uid "41759FF4-4F97-B4DB-8B23-39BF054A3A96";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90 0 26.565051177078004 ;
	setAttr ".radi" 0.125;
createNode joint -n "jSplineSolver1" -p "jSplineSolver0";
	rename -uid "E1A60970-4BE2-493F-18E6-3886B9D28032";
	setAttr ".t" -type "double3" 4.4721359549995796 0 -6.6613381477509392e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 12.528807709151504 0 ;
	setAttr ".radi" 0.125;
createNode joint -n "jSplineSolver2" -p "jSplineSolver1";
	rename -uid "E434E12C-42CA-4595-2109-DAA1B43F9B6D";
	setAttr ".t" -type "double3" 4.1231056256176588 0 -7.7715611723760958e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 28.072486935852957 0 ;
	setAttr ".radi" 0.125;
createNode joint -n "jSplineSolver3" -p "jSplineSolver2";
	rename -uid "61B4EE3B-4473-607A-6587-F09A1D0087EB";
	setAttr ".t" -type "double3" 4.1231056256176597 0 -8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 12.528807709151527 0 ;
	setAttr ".radi" 0.125;
createNode joint -n "jSplineSolver4" -p "jSplineSolver3";
	rename -uid "75C63E39-455C-B9E4-B77A-58AC21ABE6F7";
	setAttr ".t" -type "double3" 4.4721359549995761 0 -8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -26.565051177077986 0 ;
	setAttr ".radi" 0.125;
createNode ikEffector -n "ike_dualSplineIK_spine0" -p "jSplineSolver3";
	rename -uid "2AD7F270-423D-A206-3B02-C78607A78556";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode transform -n "curve1" -p "g_dualSplineIK_spine";
	rename -uid "7FA3C73C-4C6C-8D69-C7A0-D1AA52846D44";
	setAttr ".v" no;
createNode nurbsCurve -n "curveShape1" -p "curve1";
	rename -uid "0AF4C098-4747-AB83-DB74-0DBE5EA8EC05";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 2 3 4 4 4
		7
		0 0 0
		1.3333333333333617 0.71428571428572851 0
		4.0000000000000648 2.1428571428571743 0
		7.9999999999999325 3.4285714285714111 0
		12.000000000000245 2.1428571428571708 0
		14.666666666666719 0.7142857142857274 0
		15.999999999999936 2.4424906541753345e-15 0
		;
	setAttr ".dcv" yes;
createNode transform -n "curve2" -p "g_dualSplineIK_spine";
	rename -uid "749F540C-43AC-6E68-8707-D8916AE2E4DE";
	setAttr ".v" no;
createNode nurbsCurve -n "curveShape2" -p "curve2";
	rename -uid "46302418-4ADF-2156-B1AC-759D0C46C5AF";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 4 0 no 3
		9 0 0 0 1 2 3 4 4 4
		7
		0 0 -1
		1.3333333333333617 0.71428571428572851 -1
		4.0000000000000648 2.1428571428571743 -1
		7.9999999999999325 3.4285714285714111 -1
		12.000000000000245 2.1428571428571708 -1
		14.666666666666719 0.7142857142857274 -1
		15.999999999999936 2.4424906541753345e-15 -1
		;
	setAttr ".dcv" yes;
createNode ikHandle -n "ikh_dualSplineIK_spine0" -p "g_dualSplineIK_spine";
	rename -uid "959BC17A-4311-93DE-47C4-B19505BE58B5";
	setAttr ".t" -type "double3" 15.999999999999995 2.2204460492503131e-15 0 ;
	setAttr ".r" -type "double3" -90 0 -26.56505117707799 ;
	setAttr ".roc" yes;
createNode transform -n "g_utilityCurves";
	rename -uid "D6643A92-4686-728C-56E1-4E8F3F3F593A";
	setAttr ".v" no;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode transform -n "nurbs_dualSplineIK_spine" -p "g_utilityCurves";
	rename -uid "21491F7A-44E0-39DA-C279-D9897C98BC7F";
	setAttr ".v" no;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode nurbsSurface -n "nurbs_dualSplineIK_spineShape" -p "nurbs_dualSplineIK_spine";
	rename -uid "0C4538E8-442D-B8CB-A43D-C49E00BA4D1B";
	setAttr -k off ".v";
	setAttr -s 2 ".iog";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".tw" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 3;
	setAttr ".dvv" 3;
	setAttr ".cpr" 15;
	setAttr ".cps" 4;
	setAttr ".dcv" yes;
createNode nurbsSurface -n "nurbs_dualSplineIK_spineShapeOrig" -p "nurbs_dualSplineIK_spine";
	rename -uid "7251DEEA-4E03-7484-C4C3-B18F8AF78D9F";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".dcv" yes;
	setAttr ".cc" -type "nurbsSurface" 
		3 1 0 0 no 
		9 0 0 0 1 2 3 4 4 4
		2 0 1
		
		14
		0 0 0
		0 0 -1
		1.3333333333333617 0.71428571428572851 0
		1.3333333333333617 0.71428571428572851 -1
		4.0000000000000648 2.1428571428571743 0
		4.0000000000000648 2.1428571428571743 -1
		7.9999999999999325 3.4285714285714111 0
		7.9999999999999325 3.4285714285714111 -1
		12.000000000000245 2.1428571428571708 0
		12.000000000000245 2.1428571428571708 -1
		14.666666666666719 0.7142857142857274 0
		14.666666666666719 0.7142857142857274 -1
		15.999999999999936 2.4424906541753345e-15 0
		15.999999999999936 2.4424906541753345e-15 -1
		
		;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "1F7731C8-4C72-DF88-0D4A-438B1EF4EEFB";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "0B366BCA-4131-7F78-16EC-4589B9F56177";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "FBB02CEE-43A1-989B-D32E-7DA789DDEDB1";
createNode displayLayerManager -n "layerManager";
	rename -uid "CE04ADA5-4C11-C54B-EA2A-0B8682038BCF";
createNode displayLayer -n "defaultLayer";
	rename -uid "13C15AEE-4107-18CF-07AD-8FA32B4920E8";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "AFDBC8C0-45CB-466B-0321-BFA5F4519A95";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "ECAA2EBC-4D97-1B94-8EF0-8EAAC1D7ABA0";
	setAttr ".g" yes;
createNode ikSplineSolver -n "ikSplineSolver";
	rename -uid "FCCCB348-4744-6D21-E9ED-49BE8251E8A1";
createNode nearestPointOnCurve -n "npoc_dualSplineVector_jSplineDriver0";
	rename -uid "430A15C3-48D4-C49E-73A9-B78AF44BA515";
createNode decomposeMatrix -n "dmx_worldMatrix_jSplineDriver0";
	rename -uid "06ECFA2E-4632-C49B-B596-1E8369E38CA9";
createNode decomposeMatrix -n "dmx_worldMatrix_jSplineDriver1";
	rename -uid "F04652AD-4ADD-5384-1ADC-2494475B9F96";
createNode decomposeMatrix -n "dmx_worldMatrix_jSplineDriver2";
	rename -uid "0D13B2B1-42C2-9D5A-426A-FDB914CB3E39";
createNode decomposeMatrix -n "dmx_worldMatrix_jSplineDriver3";
	rename -uid "F615954E-4DDB-5C71-3C03-539B488DAEF8";
createNode nearestPointOnCurve -n "npoc_dualSplineVector_jSplineDriver1";
	rename -uid "AD2C73A9-4FC5-FDEE-415C-499723A60097";
createNode nearestPointOnCurve -n "npoc_dualSplineVector_jSplineDriver2";
	rename -uid "E93F59BE-4C42-F893-ABF5-1F8FB8498072";
createNode nearestPointOnCurve -n "npoc_dualSplineVector_jSplineDriver3";
	rename -uid "7F628129-4FE2-DE17-E7AF-3BB4AFAB453E";
createNode aimMatrix -n "aim_splineDriver_spine0";
	rename -uid "671411F8-4B72-798D-AFBD-66A534F82E5D";
	setAttr ".smi" -type "double3" 0 0 -1 ;
	setAttr ".sm" 1;
createNode decomposeMatrix -n "dmx_jointDriver_spine0";
	rename -uid "F086BA50-4B4E-6713-3E3A-3CBA5EA06E30";
createNode multMatrix -n "mxm_splineForward_jSplineDriver0";
	rename -uid "B8043A76-443D-E839-26A2-2B9439AD9DE7";
	addAttr -ci true -sn "forwardVector" -ln "forwardVector" -at "matrix";
	setAttr -s 2 ".i";
	setAttr ".forwardVector" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 1 0 0 1;
createNode pickMatrix -n "pmx_worldPoint_jSplineDriver0";
	rename -uid "B857DBEB-4D1E-D9B9-4613-3BA6B222787E";
	setAttr ".sca" no;
	setAttr ".she" no;
	setAttr ".rot" no;
createNode pickMatrix -n "pmx_splineForward_jSplineDriver0";
	rename -uid "8CA1620C-4491-B67C-4CF0-1786CC7346D3";
	setAttr ".rot" no;
createNode inverseMatrix -n "imx_worldPointInverse_jSplineDriver0";
	rename -uid "C1EB65D2-47FA-898A-D3B3-9AA37A81B09F";
createNode composeMatrix -n "cmx_dualSplineVector_jSplineDriver0";
	rename -uid "55F80AC1-415E-3494-6A1A-54AFAEF4B674";
createNode script -n "uiConfigurationScriptNode";
	rename -uid "B6121A59-4CD8-4747-1993-64A954256E75";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top|topShape\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 780\n            -height 402\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side|sideShape\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 779\n            -height 402\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front|frontShape\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n"
		+ "            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n"
		+ "            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 780\n            -height 402\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|persp|perspShape\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n"
		+ "            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n"
		+ "            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1366\n            -height 848\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n"
		+ "            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n"
		+ "            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n"
		+ "            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n"
		+ "            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n"
		+ "                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n"
		+ "                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n"
		+ "                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n"
		+ "            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n"
		+ "                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -connectionMinSegment 0.03\n                -connectionOffset 0.03\n                -connectionRoundness 0.8\n                -connectionTension -100\n                -defaultPinnedState 0\n"
		+ "                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n"
		+ "                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -connectionMinSegment 0.03\n                -connectionOffset 0.03\n                -connectionRoundness 0.8\n                -connectionTension -100\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n"
		+ "                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n"
		+ "            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n"
		+ "            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n"
		+ "        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1366\\n    -height 848\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1366\\n    -height 848\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels yes -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition axis;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "1BC62032-480E-2D8F-B3BA-86A687523434";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode curveFromSurfaceIso -n "siso_primaryCurve_spine0";
	rename -uid "617C7538-4F1D-349F-E151-B38176EA2B95";
	setAttr ".ihi" 1;
createNode curveFromSurfaceIso -n "siso_tangentCurve_spine0";
	rename -uid "DF383D6E-4529-37EA-532B-8A960D4150EB";
	setAttr ".ihi" 1;
	setAttr ".iv" 1;
createNode multMatrix -n "mxm_splineForward_jSplineDriver1";
	rename -uid "13249F79-4536-8139-AB7F-4EB19BF4AE06";
	setAttr -s 2 ".i";
createNode composeMatrix -n "cmx_jointOrient_spine0";
	rename -uid "35A6636F-4CA9-509A-B5FA-92B5B30B6888";
createNode inverseMatrix -n "imx_jointOrientInverse_spine0";
	rename -uid "09C5E361-4DC4-8E80-D80F-2DBD023AC9C5";
createNode multMatrix -n "mxm_splineDriver_spine0";
	rename -uid "A468E4E0-4204-8D30-8A94-939020AB4FE7";
	addAttr -ci true -sn "forwardOrient" -ln "forwardOrient" -at "matrix";
	setAttr -s 4 ".i";
	setAttr ".forwardOrient" -type "matrix" 1 0 0 0 0 3.2679489669895645e-07 -0.9999999999999466 0
		 0 0.9999999999999466 3.2679489669895645e-07 0 0 0 0 1;
createNode composeMatrix -n "cmx_downstreamTranslate_jSplineSolver0";
	rename -uid "9AB84540-4616-19B3-BCD5-2BA4C89CA4C8";
createNode pickMatrix -n "pmx_worldPoint_jSplineDriver1";
	rename -uid "755BF746-435E-C4A2-4E6D-6A8A6BB4591A";
	setAttr ".sca" no;
	setAttr ".she" no;
	setAttr ".rot" no;
createNode composeMatrix -n "cmx_downstreamTranslate_jSplineSolver1";
	rename -uid "8C42A918-4993-F5B9-BCEF-C483ED41B80B";
createNode pickMatrix -n "pmx_splineForward_jSplineDriver1";
	rename -uid "B89AA470-4972-8351-5A85-2CBC149E9440";
	setAttr ".rot" no;
createNode composeMatrix -n "cmx_dualSplineVector_jSplineDriver1";
	rename -uid "3B22BC4C-49CD-3D8D-CF7A-48A846263432";
createNode inverseMatrix -n "imx_worldPointInverse_jSplineDriver2";
	rename -uid "741F134C-4312-67FA-F998-14BB4F2022A1";
createNode multMatrix -n "mxm_splineDriver_spine1";
	rename -uid "34ECDCC3-42E6-11A5-9C76-D6937F7C9FC6";
	addAttr -ci true -sn "forwardOrient" -ln "forwardOrient" -at "matrix";
	setAttr -s 4 ".i";
createNode decomposeMatrix -n "dmx_jointDriver_spine1";
	rename -uid "FD737CE8-4AB4-4D44-4673-2CAEDB19276F";
createNode composeMatrix -n "cmx_jointOrient_spine1";
	rename -uid "EDD1FBEC-48E2-B22F-0568-96A4389EA358";
createNode inverseMatrix -n "imx_jointOrientInverse_spine1";
	rename -uid "6E64D78F-461D-577E-6E2F-EDA395CBC51F";
createNode inverseMatrix -n "imx_worldPointInverse_jSplineDriver1";
	rename -uid "DA18D099-47B5-AF49-45EA-68B758376759";
createNode multMatrix -n "mxm_splineTangent_jSplineDriver1";
	rename -uid "410350CC-410F-D5D7-859D-A9871A4960F1";
	setAttr -s 3 ".i";
createNode aimMatrix -n "aim_splineDriver_spine1";
	rename -uid "8F0A17C6-4937-7BEC-2D21-519CDDA98A74";
	setAttr ".sm" 1;
createNode pickMatrix -n "pmx_parentInverseRotate_spine0";
	rename -uid "D678A5E2-4546-F5B1-F007-A997B345DAB6";
	setAttr ".sca" no;
	setAttr ".tra" no;
	setAttr ".she" no;
createNode pickMatrix -n "pmx_parentInverseRotate_spine1";
	rename -uid "03743A3D-457A-6887-478D-5AABB506FC33";
	setAttr ".sca" no;
	setAttr ".tra" no;
	setAttr ".she" no;
createNode multMatrix -n "mxm_splineTangent_jSplineDriver0";
	rename -uid "2FC95E23-4AD4-4F04-2FBC-6BA6FAF40535";
	setAttr -s 3 ".i";
createNode composeMatrix -n "cmx_downstreamTranslate_jSplineSolver2";
	rename -uid "0E47DA44-4307-D9EB-7F7F-BFBA8FB33F0B";
createNode pickMatrix -n "pmx_worldPoint_jSplineDriver2";
	rename -uid "9BBCCC22-4651-0DAE-39C9-3EA975D59710";
	setAttr ".sca" no;
	setAttr ".she" no;
	setAttr ".rot" no;
createNode multMatrix -n "mxm_splineForward_jSplineDriver2";
	rename -uid "7A1E7AD2-485B-9771-266A-F2AC7B47E62C";
	setAttr -s 2 ".i";
createNode composeMatrix -n "cmx_dualSplineVector_jSplineDriver2";
	rename -uid "41160E65-420B-32DA-CDAE-84B9D4013478";
createNode pickMatrix -n "pmx_splineForward_jSplineDriver2";
	rename -uid "1486E981-4927-B893-EE2D-9892429DFB31";
	setAttr ".rot" no;
createNode multMatrix -n "mxm_splineTangent_jSplineDriver2";
	rename -uid "715457D1-4AEE-B823-C095-79B1B1263918";
	setAttr -s 3 ".i";
createNode aimMatrix -n "aim_splineDriver_spine2";
	rename -uid "49F405F0-4E42-8B1B-B518-6DA64263F0EB";
	setAttr ".sm" 1;
createNode decomposeMatrix -n "dmx_jointDriver_spine2";
	rename -uid "BEF02EF0-41A2-C295-D8CD-6EADFF843BE3";
createNode multMatrix -n "mxm_splineDriver_spine2";
	rename -uid "E3E9F7DB-4A9F-78CC-FD1D-0CA06A2857A8";
	addAttr -ci true -sn "forwardOrient" -ln "forwardOrient" -at "matrix";
	setAttr -s 4 ".i";
createNode pickMatrix -n "pmx_parentInverseRotate_spine2";
	rename -uid "CB8993CD-42F8-7687-C935-1680C83B8A07";
	setAttr ".sca" no;
	setAttr ".tra" no;
	setAttr ".she" no;
createNode composeMatrix -n "cmx_jointOrient_spine2";
	rename -uid "02CFAB20-4C09-FF28-CE78-0BA6B58A4A96";
createNode inverseMatrix -n "imx_jointOrientInverse_spine2";
	rename -uid "9BA776A6-4B95-4413-C78F-978F72261D1D";
createNode pickMatrix -n "pmx_worldPoint_jSplineDriver3";
	rename -uid "338E5A42-4F9C-41D2-103B-F1B5CDBD29D8";
	setAttr ".sca" no;
	setAttr ".she" no;
	setAttr ".rot" no;
createNode multMatrix -n "mxm_splineForward_jSplineDriver3";
	rename -uid "ACBF0840-41D3-BD61-BBDF-309ABF49C7B3";
	setAttr -s 2 ".i";
createNode composeMatrix -n "cmx_downstreamTranslate_jSplineSolver3";
	rename -uid "6E16C971-4F21-F20C-AAFD-92B9D53D587F";
createNode inverseMatrix -n "imx_worldPointInverse_jSplineDriver3";
	rename -uid "AFEC8498-4F26-BB38-EF3F-268265A414B5";
createNode composeMatrix -n "cmx_dualSplineVector_jSplineDriver3";
	rename -uid "A6C0339C-4DDB-E0F6-F590-5091762C51A8";
createNode multMatrix -n "mxm_splineTangent_jSplineDriver3";
	rename -uid "858E95F3-491D-6EF5-C6C0-07997CAA7A83";
	setAttr -s 3 ".i";
createNode pickMatrix -n "pmx_splineForward_jSplineDriver3";
	rename -uid "7DB2D807-47A2-55AC-4CB0-D697B9F90874";
	setAttr ".rot" no;
createNode aimMatrix -n "aim_splineDriver_spine3";
	rename -uid "2AA4FE4D-4857-C096-2969-5E91EACF1C1D";
	setAttr ".sm" 1;
createNode multMatrix -n "mxm_splineDriver_spine3";
	rename -uid "6131397E-41A9-CB65-CF3C-0D8F95780A20";
	addAttr -ci true -sn "forwardOrient" -ln "forwardOrient" -at "matrix";
	setAttr -s 4 ".i";
createNode pickMatrix -n "pmx_parentInverseRotate_spine3";
	rename -uid "95045FD6-4E3D-D3D6-66F2-5BBBA7728C95";
	setAttr ".sca" no;
	setAttr ".tra" no;
	setAttr ".she" no;
createNode composeMatrix -n "cmx_jointOrient_spine3";
	rename -uid "CF6C7A62-4BDC-A893-183B-40AB6C1961FB";
createNode inverseMatrix -n "imx_jointOrientInverse_spine3";
	rename -uid "B20D406E-446B-EC84-5428-23A905A5A928";
createNode decomposeMatrix -n "dmx_jointDriver_spine3";
	rename -uid "3142077B-404C-51E8-982D-9B821B93842C";
createNode skinCluster -n "skinCluster1";
	rename -uid "83323C69-4D39-CC0F-2726-21A3233C1FE7";
	setAttr -s 14 ".wl";
	setAttr ".wl[0:13].w"
		1 1 1
		1 1 1
		2 0 1.1712927039386756e-07 1 0.99999988287072961
		2 0 0.0003929079727377216 1 0.99960709202726228
		2 0 7.8350478156852255e-05 1 0.99992164952184315
		2 0 0.0038797678621953491 1 0.99612023213780465
		1 0 1
		1 0 1
		2 0 0.99986596620928725 2 0.0001340337907127509
		2 0 0.99334701606785303 2 0.0066529839321469719
		2 0 0.99994310682719523 2 5.6893172804772796e-05
		2 0 0.91233547309809537 2 0.087664526901904627
		1 2 1
		1 2 1;
	setAttr -s 3 ".pm";
	setAttr ".pm[0]" -type "matrix" 0.9191450286011964 -0 0.3939193018851776 -0 -0.3939193018851776 0 0.91914502860119651 0
		 0 -1 0 -0 -6.0025797517864383 0 -6.302708830162846 1;
	setAttr ".pm[1]" -type "matrix" 0.91914502860119651 -0 -0.39391930188517793 -0 0.39391930188517793 0 0.91914502860119662 -0
		 0 -1 0 -0 -0 0 -0 1;
	setAttr ".pm[2]" -type "matrix" 1 -0 5.5511151231257839e-17 -0 -5.5511151231257839e-17 0 1.0000000000000002 0
		 0 -1 0 -0 -16.000000000000004 0 -2.6645352591003765e-15 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 3 ".ma";
	setAttr -s 3 ".dpf[0:2]"  4 4 4;
	setAttr -s 3 ".lw";
	setAttr -s 3 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 4;
	setAttr ".bm" 1;
	setAttr ".ucm" yes;
	setAttr -s 3 ".ifcl";
	setAttr -s 3 ".ifcl";
createNode dagPose -n "bindPose1";
	rename -uid "BF798261-45C3-A180-6DBD-91BF7B465912";
	setAttr -s 3 ".wm";
	setAttr -s 3 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 -0.69266605023654737 -0.14217504299173223 0.14217504299173223 0.69266605023654737 1
		 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.7037407058327076 0 4.4408920985006262e-16 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0.39391930188517771 0 0.9191450286011964 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.7037407058327076 0 -8.8817841970012523e-16 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 -0.20106587402988541 0 0.9795777224399288 1
		 1 1 yes;
	setAttr -s 3 ".m";
	setAttr -s 3 ".p";
	setAttr ".bp" yes;
createNode pickMatrix -n "pmx_parentInverseRotate_spine4";
	rename -uid "7F05BFF4-4907-7F1B-578E-999D5E2A5A39";
	setAttr ".sca" no;
	setAttr ".tra" no;
	setAttr ".she" no;
createNode composeMatrix -n "cmx_jointOrient_spine4";
	rename -uid "7FC34AD8-410B-D0B0-7B07-229DAC76A6EA";
createNode inverseMatrix -n "imx_jointOrientInverse_spine4";
	rename -uid "1FF62E52-4926-6D85-9D53-D4A7449A11FF";
createNode pickMatrix -n "pickMatrix14";
	rename -uid "A1865641-4AF8-36B7-A1D4-A78AD9614250";
	setAttr ".sca" no;
	setAttr ".tra" no;
	setAttr ".she" no;
createNode multMatrix -n "mxm_splineDriver_spine4";
	rename -uid "61E105AA-44FB-6B40-BE6E-A7806FB4B449";
	setAttr -s 3 ".i";
createNode decomposeMatrix -n "dmx_jointDriver_spine4";
	rename -uid "4628DEBC-4299-970D-C80A-40A64E8B9F1D";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "87818648-456C-3781-2D4C-D6898DC381C6";
	setAttr -s 3 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -200.6546925850931 -731.09450324456395 ;
	setAttr ".tgi[0].vh" -type "double2" 1390.2774564666829 720.8388255671706 ;
	setAttr -s 85 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -322.85714721679688;
	setAttr ".tgi[0].ni[0].y" -1081.4285888671875;
	setAttr ".tgi[0].ni[0].nvs" 18313;
	setAttr ".tgi[0].ni[1].x" 620;
	setAttr ".tgi[0].ni[1].y" -567.14288330078125;
	setAttr ".tgi[0].ni[1].nvs" 18313;
	setAttr ".tgi[0].ni[2].x" -108.57142639160156;
	setAttr ".tgi[0].ni[2].y" -738.5714111328125;
	setAttr ".tgi[0].ni[2].nvs" 18313;
	setAttr ".tgi[0].ni[3].x" 620;
	setAttr ".tgi[0].ni[3].y" -1595.7142333984375;
	setAttr ".tgi[0].ni[3].nvs" 18312;
	setAttr ".tgi[0].ni[4].x" -708.5714111328125;
	setAttr ".tgi[0].ni[4].y" -567.14288330078125;
	setAttr ".tgi[0].ni[4].nvs" 18361;
	setAttr ".tgi[0].ni[5].x" -708.5714111328125;
	setAttr ".tgi[0].ni[5].y" 1147.142822265625;
	setAttr ".tgi[0].ni[5].nvs" 18313;
	setAttr ".tgi[0].ni[6].x" 620;
	setAttr ".tgi[0].ni[6].y" -824.28570556640625;
	setAttr ".tgi[0].ni[6].nvs" 18312;
	setAttr ".tgi[0].ni[7].x" -322.85714721679688;
	setAttr ".tgi[0].ni[7].y" -1295.7142333984375;
	setAttr ".tgi[0].ni[7].nvs" 18313;
	setAttr ".tgi[0].ni[8].x" -322.85714721679688;
	setAttr ".tgi[0].ni[8].y" -352.85714721679688;
	setAttr ".tgi[0].ni[8].nvs" 18312;
	setAttr ".tgi[0].ni[9].x" 620;
	setAttr ".tgi[0].ni[9].y" -910;
	setAttr ".tgi[0].ni[9].nvs" 18312;
	setAttr ".tgi[0].ni[10].x" -322.85714721679688;
	setAttr ".tgi[0].ni[10].y" -738.5714111328125;
	setAttr ".tgi[0].ni[10].nvs" 18313;
	setAttr ".tgi[0].ni[11].x" -580;
	setAttr ".tgi[0].ni[11].y" -181.42857360839844;
	setAttr ".tgi[0].ni[11].nvs" 18312;
	setAttr ".tgi[0].ni[12].x" 620;
	setAttr ".tgi[0].ni[12].y" -1295.7142333984375;
	setAttr ".tgi[0].ni[12].nvs" 18313;
	setAttr ".tgi[0].ni[13].x" 105.71428680419922;
	setAttr ".tgi[0].ni[13].y" -1295.7142333984375;
	setAttr ".tgi[0].ni[13].nvs" 18313;
	setAttr ".tgi[0].ni[14].x" -580;
	setAttr ".tgi[0].ni[14].y" -1252.857177734375;
	setAttr ".tgi[0].ni[14].nvs" 18312;
	setAttr ".tgi[0].ni[15].x" -322.85714721679688;
	setAttr ".tgi[0].ni[15].y" -995.71429443359375;
	setAttr ".tgi[0].ni[15].nvs" 18312;
	setAttr ".tgi[0].ni[16].x" -580;
	setAttr ".tgi[0].ni[16].y" 375.71429443359375;
	setAttr ".tgi[0].ni[16].nvs" 18313;
	setAttr ".tgi[0].ni[17].x" 362.85714721679688;
	setAttr ".tgi[0].ni[17].y" -1295.7142333984375;
	setAttr ".tgi[0].ni[17].nvs" 18312;
	setAttr ".tgi[0].ni[18].x" -708.5714111328125;
	setAttr ".tgi[0].ni[18].y" 761.4285888671875;
	setAttr ".tgi[0].ni[18].nvs" 18313;
	setAttr ".tgi[0].ni[19].x" 620;
	setAttr ".tgi[0].ni[19].y" 1147.142822265625;
	setAttr ".tgi[0].ni[19].nvs" 18313;
	setAttr ".tgi[0].ni[20].x" 491.42855834960938;
	setAttr ".tgi[0].ni[20].y" -1724.2857666015625;
	setAttr ".tgi[0].ni[20].nvs" 18313;
	setAttr ".tgi[0].ni[21].x" -708.5714111328125;
	setAttr ".tgi[0].ni[21].y" 118.57142639160156;
	setAttr ".tgi[0].ni[21].nvs" 18313;
	setAttr ".tgi[0].ni[22].x" -1308.5714111328125;
	setAttr ".tgi[0].ni[22].y" -995.71429443359375;
	setAttr ".tgi[0].ni[22].nvs" 18312;
	setAttr ".tgi[0].ni[23].x" -108.57142639160156;
	setAttr ".tgi[0].ni[23].y" -1467.142822265625;
	setAttr ".tgi[0].ni[23].nvs" 18313;
	setAttr ".tgi[0].ni[24].x" -322.85714721679688;
	setAttr ".tgi[0].ni[24].y" -1724.2857666015625;
	setAttr ".tgi[0].ni[24].nvs" 18312;
	setAttr ".tgi[0].ni[25].x" -108.57142639160156;
	setAttr ".tgi[0].ni[25].y" -995.71429443359375;
	setAttr ".tgi[0].ni[25].nvs" 18313;
	setAttr ".tgi[0].ni[26].x" 362.85714721679688;
	setAttr ".tgi[0].ni[26].y" -567.14288330078125;
	setAttr ".tgi[0].ni[26].nvs" 18312;
	setAttr ".tgi[0].ni[27].x" -580;
	setAttr ".tgi[0].ni[27].y" -1681.4285888671875;
	setAttr ".tgi[0].ni[27].nvs" 18314;
	setAttr ".tgi[0].ni[28].x" 491.42855834960938;
	setAttr ".tgi[0].ni[28].y" -995.71429443359375;
	setAttr ".tgi[0].ni[28].nvs" 18313;
	setAttr ".tgi[0].ni[29].x" -322.85714721679688;
	setAttr ".tgi[0].ni[29].y" -1467.142822265625;
	setAttr ".tgi[0].ni[29].nvs" 18313;
	setAttr ".tgi[0].ni[30].x" 362.85714721679688;
	setAttr ".tgi[0].ni[30].y" -1424.2857666015625;
	setAttr ".tgi[0].ni[30].nvs" 18313;
	setAttr ".tgi[0].ni[31].x" -580;
	setAttr ".tgi[0].ni[31].y" -910;
	setAttr ".tgi[0].ni[31].nvs" 18312;
	setAttr ".tgi[0].ni[32].x" 620;
	setAttr ".tgi[0].ni[32].y" 75.714286804199219;
	setAttr ".tgi[0].ni[32].nvs" 18313;
	setAttr ".tgi[0].ni[33].x" -1051.4285888671875;
	setAttr ".tgi[0].ni[33].y" -952.85711669921875;
	setAttr ".tgi[0].ni[33].nvs" 18313;
	setAttr ".tgi[0].ni[34].x" -580;
	setAttr ".tgi[0].ni[34].y" -1595.7142333984375;
	setAttr ".tgi[0].ni[34].nvs" 18312;
	setAttr ".tgi[0].ni[35].x" -580;
	setAttr ".tgi[0].ni[35].y" 461.42855834960938;
	setAttr ".tgi[0].ni[35].nvs" 18312;
	setAttr ".tgi[0].ni[36].x" -708.5714111328125;
	setAttr ".tgi[0].ni[36].y" -1295.7142333984375;
	setAttr ".tgi[0].ni[36].nvs" 18313;
	setAttr ".tgi[0].ni[37].x" 620;
	setAttr ".tgi[0].ni[37].y" 761.4285888671875;
	setAttr ".tgi[0].ni[37].nvs" 18313;
	setAttr ".tgi[0].ni[38].x" 620;
	setAttr ".tgi[0].ni[38].y" -1510;
	setAttr ".tgi[0].ni[38].nvs" 18312;
	setAttr ".tgi[0].ni[39].x" -322.85714721679688;
	setAttr ".tgi[0].ni[39].y" -567.14288330078125;
	setAttr ".tgi[0].ni[39].nvs" 18313;
	setAttr ".tgi[0].ni[40].x" -580;
	setAttr ".tgi[0].ni[40].y" -267.14285278320312;
	setAttr ".tgi[0].ni[40].nvs" 18313;
	setAttr ".tgi[0].ni[41].x" -322.85714721679688;
	setAttr ".tgi[0].ni[41].y" -1810;
	setAttr ".tgi[0].ni[41].nvs" 18313;
	setAttr ".tgi[0].ni[42].x" 362.85714721679688;
	setAttr ".tgi[0].ni[42].y" -652.85711669921875;
	setAttr ".tgi[0].ni[42].nvs" 18314;
	setAttr ".tgi[0].ni[43].x" -580;
	setAttr ".tgi[0].ni[43].y" -995.71429443359375;
	setAttr ".tgi[0].ni[43].nvs" 18313;
	setAttr ".tgi[0].ni[44].x" -580;
	setAttr ".tgi[0].ni[44].y" -524.28570556640625;
	setAttr ".tgi[0].ni[44].nvs" 18312;
	setAttr ".tgi[0].ni[45].x" 105.71428680419922;
	setAttr ".tgi[0].ni[45].y" -567.14288330078125;
	setAttr ".tgi[0].ni[45].nvs" 18313;
	setAttr ".tgi[0].ni[46].x" -108.57142639160156;
	setAttr ".tgi[0].ni[46].y" -1724.2857666015625;
	setAttr ".tgi[0].ni[46].nvs" 18313;
	setAttr ".tgi[0].ni[47].x" -1157.142822265625;
	setAttr ".tgi[0].ni[47].y" 857.14288330078125;
	setAttr ".tgi[0].ni[47].nvs" 18304;
	setAttr ".tgi[0].ni[48].x" -1028.5714111328125;
	setAttr ".tgi[0].ni[48].y" 428.57144165039062;
	setAttr ".tgi[0].ni[48].nvs" 18312;
	setAttr ".tgi[0].ni[49].x" -1157.142822265625;
	setAttr ".tgi[0].ni[49].y" -171.42857360839844;
	setAttr ".tgi[0].ni[49].nvs" 18304;
	setAttr ".tgi[0].ni[50].x" -237.14285278320312;
	setAttr ".tgi[0].ni[50].y" 1147.142822265625;
	setAttr ".tgi[0].ni[50].nvs" 18312;
	setAttr ".tgi[0].ni[51].x" 362.85714721679688;
	setAttr ".tgi[0].ni[51].y" 75.714286804199219;
	setAttr ".tgi[0].ni[51].nvs" 18312;
	setAttr ".tgi[0].ni[52].x" 877.14288330078125;
	setAttr ".tgi[0].ni[52].y" 804.28570556640625;
	setAttr ".tgi[0].ni[52].nvs" 18312;
	setAttr ".tgi[0].ni[53].x" 234.28572082519531;
	setAttr ".tgi[0].ni[53].y" 1104.2857666015625;
	setAttr ".tgi[0].ni[53].nvs" 18314;
	setAttr ".tgi[0].ni[54].x" -22.857143402099609;
	setAttr ".tgi[0].ni[54].y" 1061.4285888671875;
	setAttr ".tgi[0].ni[54].nvs" 18312;
	setAttr ".tgi[0].ni[55].x" 620;
	setAttr ".tgi[0].ni[55].y" 418.57144165039062;
	setAttr ".tgi[0].ni[55].nvs" 18312;
	setAttr ".tgi[0].ni[56].x" 105.71428680419922;
	setAttr ".tgi[0].ni[56].y" 75.714286804199219;
	setAttr ".tgi[0].ni[56].nvs" 18313;
	setAttr ".tgi[0].ni[57].x" -322.85714721679688;
	setAttr ".tgi[0].ni[57].y" 75.714286804199219;
	setAttr ".tgi[0].ni[57].nvs" 18313;
	setAttr ".tgi[0].ni[58].x" -451.42855834960938;
	setAttr ".tgi[0].ni[58].y" 1147.142822265625;
	setAttr ".tgi[0].ni[58].nvs" 18312;
	setAttr ".tgi[0].ni[59].x" 491.42855834960938;
	setAttr ".tgi[0].ni[59].y" 247.14285278320312;
	setAttr ".tgi[0].ni[59].nvs" 18312;
	setAttr ".tgi[0].ni[60].x" -322.85714721679688;
	setAttr ".tgi[0].ni[60].y" 761.4285888671875;
	setAttr ".tgi[0].ni[60].nvs" 18313;
	setAttr ".tgi[0].ni[61].x" -108.57142639160156;
	setAttr ".tgi[0].ni[61].y" -267.14285278320312;
	setAttr ".tgi[0].ni[61].nvs" 18313;
	setAttr ".tgi[0].ni[62].x" 362.85714721679688;
	setAttr ".tgi[0].ni[62].y" -10;
	setAttr ".tgi[0].ni[62].nvs" 18313;
	setAttr ".tgi[0].ni[63].x" 620;
	setAttr ".tgi[0].ni[63].y" -267.14285278320312;
	setAttr ".tgi[0].ni[63].nvs" 18312;
	setAttr ".tgi[0].ni[64].x" -22.857143402099609;
	setAttr ".tgi[0].ni[64].y" 1147.142822265625;
	setAttr ".tgi[0].ni[64].nvs" 18312;
	setAttr ".tgi[0].ni[65].x" 405.71429443359375;
	setAttr ".tgi[0].ni[65].y" 1147.142822265625;
	setAttr ".tgi[0].ni[65].nvs" 18312;
	setAttr ".tgi[0].ni[66].x" -580;
	setAttr ".tgi[0].ni[66].y" 161.42857360839844;
	setAttr ".tgi[0].ni[66].nvs" 18312;
	setAttr ".tgi[0].ni[67].x" -322.85714721679688;
	setAttr ".tgi[0].ni[67].y" -95.714286804199219;
	setAttr ".tgi[0].ni[67].nvs" 18313;
	setAttr ".tgi[0].ni[68].x" -322.85714721679688;
	setAttr ".tgi[0].ni[68].y" 590;
	setAttr ".tgi[0].ni[68].nvs" 18313;
	setAttr ".tgi[0].ni[69].x" 620;
	setAttr ".tgi[0].ni[69].y" -181.42857360839844;
	setAttr ".tgi[0].ni[69].nvs" 18312;
	setAttr ".tgi[0].ni[70].x" -322.85714721679688;
	setAttr ".tgi[0].ni[70].y" 247.14285278320312;
	setAttr ".tgi[0].ni[70].nvs" 18312;
	setAttr ".tgi[0].ni[71].x" 877.14288330078125;
	setAttr ".tgi[0].ni[71].y" 975.71429443359375;
	setAttr ".tgi[0].ni[71].nvs" 18312;
	setAttr ".tgi[0].ni[72].x" -322.85714721679688;
	setAttr ".tgi[0].ni[72].y" -438.57144165039062;
	setAttr ".tgi[0].ni[72].nvs" 18312;
	setAttr ".tgi[0].ni[73].x" 491.42855834960938;
	setAttr ".tgi[0].ni[73].y" -352.85714721679688;
	setAttr ".tgi[0].ni[73].nvs" 18312;
	setAttr ".tgi[0].ni[74].x" -108.57142639160156;
	setAttr ".tgi[0].ni[74].y" 375.71429443359375;
	setAttr ".tgi[0].ni[74].nvs" 18313;
	setAttr ".tgi[0].ni[75].x" 877.14288330078125;
	setAttr ".tgi[0].ni[75].y" 890;
	setAttr ".tgi[0].ni[75].nvs" 18312;
	setAttr ".tgi[0].ni[76].x" 620;
	setAttr ".tgi[0].ni[76].y" 504.28570556640625;
	setAttr ".tgi[0].ni[76].nvs" 18312;
	setAttr ".tgi[0].ni[77].x" -108.57142639160156;
	setAttr ".tgi[0].ni[77].y" -95.714286804199219;
	setAttr ".tgi[0].ni[77].nvs" 18312;
	setAttr ".tgi[0].ni[78].x" -108.57142639160156;
	setAttr ".tgi[0].ni[78].y" 590;
	setAttr ".tgi[0].ni[78].nvs" 18304;
	setAttr ".tgi[0].ni[79].x" 362.85714721679688;
	setAttr ".tgi[0].ni[79].y" 632.85711669921875;
	setAttr ".tgi[0].ni[79].nvs" 18313;
	setAttr ".tgi[0].ni[80].x" 362.85714721679688;
	setAttr ".tgi[0].ni[80].y" 761.4285888671875;
	setAttr ".tgi[0].ni[80].nvs" 18312;
	setAttr ".tgi[0].ni[81].x" 105.71428680419922;
	setAttr ".tgi[0].ni[81].y" 761.4285888671875;
	setAttr ".tgi[0].ni[81].nvs" 18313;
	setAttr ".tgi[0].ni[82].x" -1308.5714111328125;
	setAttr ".tgi[0].ni[82].y" -738.5714111328125;
	setAttr ".tgi[0].ni[82].nvs" 18313;
	setAttr ".tgi[0].ni[83].x" -322.85714721679688;
	setAttr ".tgi[0].ni[83].y" 332.85714721679688;
	setAttr ".tgi[0].ni[83].nvs" 18312;
	setAttr ".tgi[0].ni[84].x" -580;
	setAttr ".tgi[0].ni[84].y" 804.28570556640625;
	setAttr ".tgi[0].ni[84].nvs" 18312;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -833.2948612938427 -916.69345781992263 ;
	setAttr ".tgi[1].vh" -type "double2" 1287.4737200326383 1018.7848011114623 ;
	setAttr -s 8 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" -572.85711669921875;
	setAttr ".tgi[1].ni[0].y" 480;
	setAttr ".tgi[1].ni[0].nvs" 18305;
	setAttr ".tgi[1].ni[1].x" 41.428569793701172;
	setAttr ".tgi[1].ni[1].y" 475.71429443359375;
	setAttr ".tgi[1].ni[1].nvs" 18304;
	setAttr ".tgi[1].ni[2].x" -249.60208129882812;
	setAttr ".tgi[1].ni[2].y" 302.36785888671875;
	setAttr ".tgi[1].ni[2].nvs" 18305;
	setAttr ".tgi[1].ni[3].x" 978.5714111328125;
	setAttr ".tgi[1].ni[3].y" 392.85714721679688;
	setAttr ".tgi[1].ni[3].nvs" 18304;
	setAttr ".tgi[1].ni[4].x" 243.28831481933594;
	setAttr ".tgi[1].ni[4].y" -81.258872985839844;
	setAttr ".tgi[1].ni[4].nvs" 18304;
	setAttr ".tgi[1].ni[5].x" 348.57144165039062;
	setAttr ".tgi[1].ni[5].y" 568.5714111328125;
	setAttr ".tgi[1].ni[5].nvs" 18304;
	setAttr ".tgi[1].ni[6].x" 671.4285888671875;
	setAttr ".tgi[1].ni[6].y" 392.85714721679688;
	setAttr ".tgi[1].ni[6].nvs" 18304;
	setAttr ".tgi[1].ni[7].x" 348.57144165039062;
	setAttr ".tgi[1].ni[7].y" 467.14285278320312;
	setAttr ".tgi[1].ni[7].nvs" 18304;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" -434.52565044075129 -391.66665110323225 ;
	setAttr ".tgi[2].vh" -type "double2" 451.19231644514434 416.6666501098216 ;
	setAttr -s 3 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" -242.85714721679688;
	setAttr ".tgi[2].ni[0].y" 90;
	setAttr ".tgi[2].ni[0].nvs" 18304;
	setAttr ".tgi[2].ni[1].x" 21.428571701049805;
	setAttr ".tgi[2].ni[1].y" 147.56301879882812;
	setAttr ".tgi[2].ni[1].nvs" 18305;
	setAttr ".tgi[2].ni[2].x" -242.85714721679688;
	setAttr ".tgi[2].ni[2].y" -11.428571701049805;
	setAttr ".tgi[2].ni[2].nvs" 18304;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 22 ".u";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".ren" -type "string" "arnold";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "dmx_jointDriver_spine0.or" "spine0.r";
connectAttr "spine0.s" "spine1.is";
connectAttr "dmx_jointDriver_spine1.or" "spine1.r";
connectAttr "spine1.s" "spine2.is";
connectAttr "dmx_jointDriver_spine2.or" "spine2.r";
connectAttr "spine2.s" "spine3.is";
connectAttr "dmx_jointDriver_spine3.or" "spine3.r";
connectAttr "spine3.s" "spine4.is";
connectAttr "dmx_jointDriver_spine4.or" "spine4.r";
connectAttr "dualSplineDriver0.s" "dualSplineDriver1.is";
connectAttr "dualSplineDriver1.s" "dualSplineDriver2.is";
connectAttr "jSplineSolver0.s" "jSplineSolver1.is";
connectAttr "jSplineSolver1.s" "jSplineSolver2.is";
connectAttr "jSplineSolver2.s" "jSplineSolver3.is";
connectAttr "jSplineSolver3.s" "jSplineSolver4.is";
connectAttr "jSplineSolver4.tx" "ike_dualSplineIK_spine0.tx";
connectAttr "jSplineSolver4.ty" "ike_dualSplineIK_spine0.ty";
connectAttr "jSplineSolver4.tz" "ike_dualSplineIK_spine0.tz";
connectAttr "jSplineSolver4.opm" "ike_dualSplineIK_spine0.opm";
connectAttr "jSplineSolver0.msg" "ikh_dualSplineIK_spine0.hsj";
connectAttr "ike_dualSplineIK_spine0.hp" "ikh_dualSplineIK_spine0.hee";
connectAttr "ikSplineSolver.msg" "ikh_dualSplineIK_spine0.hsv";
connectAttr "siso_primaryCurve_spine0.oc" "ikh_dualSplineIK_spine0.ic";
connectAttr "skinCluster1.og[0]" "nurbs_dualSplineIK_spineShape.cr";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "siso_tangentCurve_spine0.oc" "npoc_dualSplineVector_jSplineDriver0.ic"
		;
connectAttr "dmx_worldMatrix_jSplineDriver0.ot" "npoc_dualSplineVector_jSplineDriver0.ip"
		;
connectAttr "jSplineSolver0.wm" "dmx_worldMatrix_jSplineDriver0.imat";
connectAttr "jSplineSolver1.wm" "dmx_worldMatrix_jSplineDriver1.imat";
connectAttr "jSplineSolver2.wm" "dmx_worldMatrix_jSplineDriver2.imat";
connectAttr "jSplineSolver3.wm" "dmx_worldMatrix_jSplineDriver3.imat";
connectAttr "siso_tangentCurve_spine0.oc" "npoc_dualSplineVector_jSplineDriver1.ic"
		;
connectAttr "dmx_worldMatrix_jSplineDriver1.ot" "npoc_dualSplineVector_jSplineDriver1.ip"
		;
connectAttr "siso_tangentCurve_spine0.oc" "npoc_dualSplineVector_jSplineDriver2.ic"
		;
connectAttr "dmx_worldMatrix_jSplineDriver2.ot" "npoc_dualSplineVector_jSplineDriver2.ip"
		;
connectAttr "siso_tangentCurve_spine0.oc" "npoc_dualSplineVector_jSplineDriver3.ic"
		;
connectAttr "dmx_worldMatrix_jSplineDriver3.ot" "npoc_dualSplineVector_jSplineDriver3.ip"
		;
connectAttr "mxm_splineTangent_jSplineDriver0.o" "aim_splineDriver_spine0.smat";
connectAttr "pmx_worldPoint_jSplineDriver0.tmat" "aim_splineDriver_spine0.imat";
connectAttr "pmx_splineForward_jSplineDriver0.tmat" "aim_splineDriver_spine0.pmat"
		;
connectAttr "mxm_splineDriver_spine0.o" "dmx_jointDriver_spine0.imat";
connectAttr "cmx_downstreamTranslate_jSplineSolver0.omat" "mxm_splineForward_jSplineDriver0.i[0]"
		;
connectAttr "jSplineSolver0.wm" "mxm_splineForward_jSplineDriver0.i[1]";
connectAttr "jSplineSolver0.wm" "pmx_worldPoint_jSplineDriver0.imat";
connectAttr "mxm_splineForward_jSplineDriver0.o" "pmx_splineForward_jSplineDriver0.imat"
		;
connectAttr "pmx_worldPoint_jSplineDriver0.tmat" "imx_worldPointInverse_jSplineDriver0.imat"
		;
connectAttr "npoc_dualSplineVector_jSplineDriver0.p" "cmx_dualSplineVector_jSplineDriver0.it"
		;
connectAttr "nurbs_dualSplineIK_spineShape.ws" "siso_primaryCurve_spine0.is";
connectAttr "nurbs_dualSplineIK_spineShape.ws" "siso_tangentCurve_spine0.is";
connectAttr "cmx_downstreamTranslate_jSplineSolver1.omat" "mxm_splineForward_jSplineDriver1.i[0]"
		;
connectAttr "jSplineSolver1.wm" "mxm_splineForward_jSplineDriver1.i[1]";
connectAttr "spine0.jo" "cmx_jointOrient_spine0.ir";
connectAttr "cmx_jointOrient_spine0.omat" "imx_jointOrientInverse_spine0.imat";
connectAttr "mxm_splineDriver_spine0.forwardOrient" "mxm_splineDriver_spine0.i[0]"
		;
connectAttr "aim_splineDriver_spine0.tmat" "mxm_splineDriver_spine0.i[1]";
connectAttr "pmx_parentInverseRotate_spine0.tmat" "mxm_splineDriver_spine0.i[2]"
		;
connectAttr "imx_jointOrientInverse_spine0.omat" "mxm_splineDriver_spine0.i[3]";
connectAttr "jSplineSolver1.t" "cmx_downstreamTranslate_jSplineSolver0.it";
connectAttr "jSplineSolver1.wm" "pmx_worldPoint_jSplineDriver1.imat";
connectAttr "jSplineSolver2.t" "cmx_downstreamTranslate_jSplineSolver1.it";
connectAttr "mxm_splineForward_jSplineDriver1.o" "pmx_splineForward_jSplineDriver1.imat"
		;
connectAttr "npoc_dualSplineVector_jSplineDriver1.p" "cmx_dualSplineVector_jSplineDriver1.it"
		;
connectAttr "pmx_worldPoint_jSplineDriver2.tmat" "imx_worldPointInverse_jSplineDriver2.imat"
		;
connectAttr "mxm_splineDriver_spine0.forwardOrient" "mxm_splineDriver_spine1.forwardOrient"
		;
connectAttr "mxm_splineDriver_spine1.forwardOrient" "mxm_splineDriver_spine1.i[0]"
		;
connectAttr "aim_splineDriver_spine1.tmat" "mxm_splineDriver_spine1.i[1]";
connectAttr "pmx_parentInverseRotate_spine1.tmat" "mxm_splineDriver_spine1.i[2]"
		;
connectAttr "imx_jointOrientInverse_spine1.omat" "mxm_splineDriver_spine1.i[3]";
connectAttr "mxm_splineDriver_spine1.o" "dmx_jointDriver_spine1.imat";
connectAttr "spine1.jo" "cmx_jointOrient_spine1.ir";
connectAttr "cmx_jointOrient_spine1.omat" "imx_jointOrientInverse_spine1.imat";
connectAttr "pmx_worldPoint_jSplineDriver1.tmat" "imx_worldPointInverse_jSplineDriver1.imat"
		;
connectAttr "imx_worldPointInverse_jSplineDriver1.omat" "mxm_splineTangent_jSplineDriver1.i[0]"
		;
connectAttr "cmx_dualSplineVector_jSplineDriver1.omat" "mxm_splineTangent_jSplineDriver1.i[1]"
		;
connectAttr "pmx_worldPoint_jSplineDriver1.tmat" "mxm_splineTangent_jSplineDriver1.i[2]"
		;
connectAttr "pmx_worldPoint_jSplineDriver1.tmat" "aim_splineDriver_spine1.imat";
connectAttr "aim_splineDriver_spine0.smi" "aim_splineDriver_spine1.smi";
connectAttr "mxm_splineTangent_jSplineDriver1.o" "aim_splineDriver_spine1.smat";
connectAttr "pmx_splineForward_jSplineDriver1.tmat" "aim_splineDriver_spine1.pmat"
		;
connectAttr "spine0.pim" "pmx_parentInverseRotate_spine0.imat";
connectAttr "spine1.pim" "pmx_parentInverseRotate_spine1.imat";
connectAttr "imx_worldPointInverse_jSplineDriver0.omat" "mxm_splineTangent_jSplineDriver0.i[0]"
		;
connectAttr "cmx_dualSplineVector_jSplineDriver0.omat" "mxm_splineTangent_jSplineDriver0.i[1]"
		;
connectAttr "pmx_worldPoint_jSplineDriver0.tmat" "mxm_splineTangent_jSplineDriver0.i[2]"
		;
connectAttr "jSplineSolver3.t" "cmx_downstreamTranslate_jSplineSolver2.it";
connectAttr "jSplineSolver2.wm" "pmx_worldPoint_jSplineDriver2.imat";
connectAttr "cmx_downstreamTranslate_jSplineSolver2.omat" "mxm_splineForward_jSplineDriver2.i[0]"
		;
connectAttr "jSplineSolver2.wm" "mxm_splineForward_jSplineDriver2.i[1]";
connectAttr "npoc_dualSplineVector_jSplineDriver2.p" "cmx_dualSplineVector_jSplineDriver2.it"
		;
connectAttr "mxm_splineForward_jSplineDriver2.o" "pmx_splineForward_jSplineDriver2.imat"
		;
connectAttr "imx_worldPointInverse_jSplineDriver2.omat" "mxm_splineTangent_jSplineDriver2.i[0]"
		;
connectAttr "cmx_dualSplineVector_jSplineDriver2.omat" "mxm_splineTangent_jSplineDriver2.i[1]"
		;
connectAttr "pmx_worldPoint_jSplineDriver2.tmat" "mxm_splineTangent_jSplineDriver2.i[2]"
		;
connectAttr "aim_splineDriver_spine1.smi" "aim_splineDriver_spine2.smi";
connectAttr "mxm_splineTangent_jSplineDriver2.o" "aim_splineDriver_spine2.smat";
connectAttr "pmx_worldPoint_jSplineDriver2.tmat" "aim_splineDriver_spine2.imat";
connectAttr "pmx_splineForward_jSplineDriver2.tmat" "aim_splineDriver_spine2.pmat"
		;
connectAttr "mxm_splineDriver_spine2.o" "dmx_jointDriver_spine2.imat";
connectAttr "mxm_splineDriver_spine1.forwardOrient" "mxm_splineDriver_spine2.forwardOrient"
		;
connectAttr "mxm_splineDriver_spine2.forwardOrient" "mxm_splineDriver_spine2.i[0]"
		;
connectAttr "aim_splineDriver_spine2.tmat" "mxm_splineDriver_spine2.i[1]";
connectAttr "pmx_parentInverseRotate_spine2.tmat" "mxm_splineDriver_spine2.i[2]"
		;
connectAttr "imx_jointOrientInverse_spine2.omat" "mxm_splineDriver_spine2.i[3]";
connectAttr "spine2.pim" "pmx_parentInverseRotate_spine2.imat";
connectAttr "spine2.jo" "cmx_jointOrient_spine2.ir";
connectAttr "cmx_jointOrient_spine2.omat" "imx_jointOrientInverse_spine2.imat";
connectAttr "jSplineSolver3.wm" "pmx_worldPoint_jSplineDriver3.imat";
connectAttr "cmx_downstreamTranslate_jSplineSolver3.omat" "mxm_splineForward_jSplineDriver3.i[0]"
		;
connectAttr "jSplineSolver3.wm" "mxm_splineForward_jSplineDriver3.i[1]";
connectAttr "jSplineSolver4.t" "cmx_downstreamTranslate_jSplineSolver3.it";
connectAttr "pmx_worldPoint_jSplineDriver3.tmat" "imx_worldPointInverse_jSplineDriver3.imat"
		;
connectAttr "npoc_dualSplineVector_jSplineDriver3.p" "cmx_dualSplineVector_jSplineDriver3.it"
		;
connectAttr "imx_worldPointInverse_jSplineDriver3.omat" "mxm_splineTangent_jSplineDriver3.i[0]"
		;
connectAttr "cmx_dualSplineVector_jSplineDriver3.omat" "mxm_splineTangent_jSplineDriver3.i[1]"
		;
connectAttr "pmx_worldPoint_jSplineDriver3.tmat" "mxm_splineTangent_jSplineDriver3.i[2]"
		;
connectAttr "mxm_splineForward_jSplineDriver3.o" "pmx_splineForward_jSplineDriver3.imat"
		;
connectAttr "pmx_worldPoint_jSplineDriver3.tmat" "aim_splineDriver_spine3.imat";
connectAttr "aim_splineDriver_spine2.smi" "aim_splineDriver_spine3.smi";
connectAttr "mxm_splineTangent_jSplineDriver3.o" "aim_splineDriver_spine3.smat";
connectAttr "pmx_splineForward_jSplineDriver3.tmat" "aim_splineDriver_spine3.pmat"
		;
connectAttr "mxm_splineDriver_spine2.forwardOrient" "mxm_splineDriver_spine3.forwardOrient"
		;
connectAttr "mxm_splineDriver_spine3.forwardOrient" "mxm_splineDriver_spine3.i[0]"
		;
connectAttr "aim_splineDriver_spine3.tmat" "mxm_splineDriver_spine3.i[1]";
connectAttr "pmx_parentInverseRotate_spine3.tmat" "mxm_splineDriver_spine3.i[2]"
		;
connectAttr "imx_jointOrientInverse_spine3.omat" "mxm_splineDriver_spine3.i[3]";
connectAttr "spine3.pim" "pmx_parentInverseRotate_spine3.imat";
connectAttr "spine3.jo" "cmx_jointOrient_spine3.ir";
connectAttr "cmx_jointOrient_spine3.omat" "imx_jointOrientInverse_spine3.imat";
connectAttr "mxm_splineDriver_spine3.o" "dmx_jointDriver_spine3.imat";
connectAttr "nurbs_dualSplineIK_spineShapeOrig.ws" "skinCluster1.ip[0].ig";
connectAttr "nurbs_dualSplineIK_spineShapeOrig.l" "skinCluster1.orggeom[0]";
connectAttr "bindPose1.msg" "skinCluster1.bp";
connectAttr "dualSplineDriver1.wm" "skinCluster1.ma[0]";
connectAttr "dualSplineDriver0.wm" "skinCluster1.ma[1]";
connectAttr "dualSplineDriver2.wm" "skinCluster1.ma[2]";
connectAttr "dualSplineDriver1.liw" "skinCluster1.lw[0]";
connectAttr "dualSplineDriver0.liw" "skinCluster1.lw[1]";
connectAttr "dualSplineDriver2.liw" "skinCluster1.lw[2]";
connectAttr "dualSplineDriver1.obcc" "skinCluster1.ifcl[0]";
connectAttr "dualSplineDriver0.obcc" "skinCluster1.ifcl[1]";
connectAttr "dualSplineDriver2.obcc" "skinCluster1.ifcl[2]";
connectAttr "dualSplineDriver0.msg" "skinCluster1.ptt";
connectAttr "dualSplineDriver0.msg" "bindPose1.m[0]";
connectAttr "dualSplineDriver1.msg" "bindPose1.m[1]";
connectAttr "dualSplineDriver2.msg" "bindPose1.m[2]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "dualSplineDriver0.bps" "bindPose1.wm[0]";
connectAttr "dualSplineDriver1.bps" "bindPose1.wm[1]";
connectAttr "dualSplineDriver2.bps" "bindPose1.wm[2]";
connectAttr "spine4.pim" "pmx_parentInverseRotate_spine4.imat";
connectAttr "spine4.jo" "cmx_jointOrient_spine4.ir";
connectAttr "cmx_jointOrient_spine4.omat" "imx_jointOrientInverse_spine4.imat";
connectAttr "dualSplineDriver2.wm" "pickMatrix14.imat";
connectAttr "pickMatrix14.tmat" "mxm_splineDriver_spine4.i[0]";
connectAttr "pmx_parentInverseRotate_spine4.tmat" "mxm_splineDriver_spine4.i[1]"
		;
connectAttr "imx_jointOrientInverse_spine4.omat" "mxm_splineDriver_spine4.i[2]";
connectAttr "mxm_splineDriver_spine4.o" "dmx_jointDriver_spine4.imat";
connectAttr "cmx_dualSplineVector_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "pmx_splineForward_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "cmx_jointOrient_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "jSplineSolver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr "jSplineSolver4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "pmx_parentInverseRotate_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "pmx_worldPoint_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "imx_worldPointInverse_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "cmx_jointOrient_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn"
		;
connectAttr "mxm_splineForward_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "dmx_worldMatrix_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn";
connectAttr "aim_splineDriver_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn"
		;
connectAttr "cmx_downstreamTranslate_jSplineSolver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn"
		;
connectAttr "imx_worldPointInverse_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn"
		;
connectAttr "npoc_dualSplineVector_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn"
		;
connectAttr "dmx_jointDriver_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn"
		;
connectAttr "jSplineSolver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn";
connectAttr "spine4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn";
connectAttr "imx_jointOrientInverse_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn"
		;
connectAttr "jSplineSolver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[21].dn";
connectAttr "siso_primaryCurve_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[22].dn"
		;
connectAttr "pmx_splineForward_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[23].dn"
		;
connectAttr "imx_worldPointInverse_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[24].dn"
		;
connectAttr "mxm_splineTangent_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[25].dn"
		;
connectAttr "dmx_jointDriver_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[26].dn"
		;
connectAttr "npoc_dualSplineVector_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[27].dn"
		;
connectAttr "imx_jointOrientInverse_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[28].dn"
		;
connectAttr "mxm_splineForward_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[29].dn"
		;
connectAttr "mxm_splineDriver_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[30].dn"
		;
connectAttr "dmx_worldMatrix_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[31].dn"
		;
connectAttr "spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[32].dn";
connectAttr "siso_tangentCurve_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[33].dn"
		;
connectAttr "dmx_worldMatrix_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[34].dn"
		;
connectAttr "dmx_worldMatrix_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[35].dn"
		;
connectAttr "jSplineSolver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[36].dn";
connectAttr "spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[37].dn";
connectAttr "pmx_parentInverseRotate_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[38].dn"
		;
connectAttr "pmx_worldPoint_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[39].dn"
		;
connectAttr "npoc_dualSplineVector_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[40].dn"
		;
connectAttr "cmx_dualSplineVector_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[41].dn"
		;
connectAttr "mxm_splineDriver_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[42].dn"
		;
connectAttr "npoc_dualSplineVector_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[43].dn"
		;
connectAttr "cmx_downstreamTranslate_jSplineSolver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[44].dn"
		;
connectAttr "aim_splineDriver_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[45].dn"
		;
connectAttr "mxm_splineTangent_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[46].dn"
		;
connectAttr "g_dualSplineIK_spine.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[47].dn"
		;
connectAttr "g_utilityCurves.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[48].dn"
		;
connectAttr "g_rigLogic.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[49].dn";
connectAttr "dualSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[50].dn"
		;
connectAttr "dmx_jointDriver_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[51].dn"
		;
connectAttr "imx_jointOrientInverse_spine4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[52].dn"
		;
connectAttr "mxm_splineDriver_spine4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[53].dn"
		;
connectAttr "pickMatrix14.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[54].dn";
connectAttr "cmx_jointOrient_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[55].dn"
		;
connectAttr "aim_splineDriver_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[56].dn"
		;
connectAttr "pmx_worldPoint_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[57].dn"
		;
connectAttr "dualSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[58].dn"
		;
connectAttr "imx_jointOrientInverse_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[59].dn"
		;
connectAttr "pmx_worldPoint_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[60].dn"
		;
connectAttr "mxm_splineTangent_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[61].dn"
		;
connectAttr "mxm_splineDriver_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[62].dn"
		;
connectAttr "cmx_jointOrient_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[63].dn"
		;
connectAttr "dualSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[64].dn"
		;
connectAttr "dmx_jointDriver_spine4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[65].dn"
		;
connectAttr "cmx_downstreamTranslate_jSplineSolver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[66].dn"
		;
connectAttr "mxm_splineForward_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[67].dn"
		;
connectAttr "mxm_splineForward_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[68].dn"
		;
connectAttr "pmx_parentInverseRotate_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[69].dn"
		;
connectAttr "cmx_dualSplineVector_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[70].dn"
		;
connectAttr "pmx_parentInverseRotate_spine4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[71].dn"
		;
connectAttr "cmx_dualSplineVector_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[72].dn"
		;
connectAttr "imx_jointOrientInverse_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[73].dn"
		;
connectAttr "mxm_splineTangent_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[74].dn"
		;
connectAttr "cmx_jointOrient_spine4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[75].dn"
		;
connectAttr "pmx_parentInverseRotate_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[76].dn"
		;
connectAttr "pmx_splineForward_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[77].dn"
		;
connectAttr "pmx_splineForward_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[78].dn"
		;
connectAttr "mxm_splineDriver_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[79].dn"
		;
connectAttr "dmx_jointDriver_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[80].dn"
		;
connectAttr "aim_splineDriver_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[81].dn"
		;
connectAttr "nurbs_dualSplineIK_spineShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[82].dn"
		;
connectAttr "imx_worldPointInverse_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[83].dn"
		;
connectAttr "cmx_downstreamTranslate_jSplineSolver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[84].dn"
		;
connectAttr "dualSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn"
		;
connectAttr "dualSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn"
		;
connectAttr "dualSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "nurbs_dualSplineIK_spineShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn"
		;
connectAttr "nurbs_dualSplineIK_spine.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "bindPose1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn";
connectAttr "skinCluster1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn";
connectAttr "nurbs_dualSplineIK_spineShapeOrig.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn"
		;
connectAttr "ike_dualSplineIK_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn"
		;
connectAttr "ikh_dualSplineIK_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn"
		;
connectAttr "siso_primaryCurve_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn"
		;
connectAttr "mxm_splineForward_jSplineDriver0.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "imx_worldPointInverse_jSplineDriver0.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineForward_jSplineDriver1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "imx_jointOrientInverse_spine0.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "mxm_splineDriver_spine0.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "imx_worldPointInverse_jSplineDriver2.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineDriver_spine1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "imx_jointOrientInverse_spine1.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "imx_worldPointInverse_jSplineDriver1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineTangent_jSplineDriver1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineTangent_jSplineDriver0.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineForward_jSplineDriver2.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineTangent_jSplineDriver2.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineDriver_spine2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "imx_jointOrientInverse_spine2.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "mxm_splineForward_jSplineDriver3.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "imx_worldPointInverse_jSplineDriver3.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineTangent_jSplineDriver3.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineDriver_spine3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "imx_jointOrientInverse_spine3.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "imx_jointOrientInverse_spine4.msg" ":defaultRenderUtilityList1.u" -na
		;
connectAttr "mxm_splineDriver_spine4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "nurbs_dualSplineIK_spineShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "ikSplineSolver.msg" ":ikSystem.sol" -na;
// End of dualSplineIK_dev.ma
