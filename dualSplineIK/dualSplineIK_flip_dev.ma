//Maya ASCII 2022 scene
//Name: dualSplineIK_dev.ma
//Last modified: Thu, Jun 05, 2025 11:31:26 PM
//Codeset: 1252
requires maya "2022";
requires -nodeType "inverseMatrix" "matrixNodes" "1.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202108111415-612a77abf4";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 19045)";
fileInfo "UUID" "E23702E8-4A5B-C4F5-9990-E79A17127451";
createNode transform -s -n "persp";
	rename -uid "99FE6BF1-4CFE-C7DC-99CD-A9B7A518F8EA";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -7.0743363608670489 12.854242812649588 24.428430365120587 ;
	setAttr ".r" -type "double3" -24.33835272987249 -23.39999999996526 0 ;
	setAttr ".rp" -type "double3" -5.3290705182007514e-15 1.5543122344752192e-15 -7.1054273576010019e-15 ;
	setAttr ".rpt" -type "double3" 8.8804231981194e-17 -4.8100447529598963e-15 -4.2411685332798207e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "CC29FC39-40BB-A5CF-03FC-00883A1B5AFC";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 30.434670521681234;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 7.1513227064147955 1.1860650192800226 0.0014779637598788392 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "F55E58AD-4096-7CC3-81B6-AAA18A9B0748";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 2.3762644590919582 1000.16486111661 -0.47256772199345787 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "FEB33270-4355-675A-BA46-17BF04A2257A";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 998.45057540232426;
	setAttr ".ow" 34.664051478238726;
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
createNode joint -n "splineDriver_spine0";
	rename -uid "A2F33A07-45DF-5777-C063-79B0FDF45C5F";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 26.565051177077986 ;
	setAttr ".radi" 0.5;
createNode joint -n "splineDriver_spine1" -p "splineDriver_spine0";
	rename -uid "097B3A23-46E0-E8D0-E65C-48BE516826A2";
	setAttr ".t" -type "double3" 4.4721359549995805 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 -12.529000000000002 ;
	setAttr ".radi" 0.5;
createNode joint -n "splineDriver_spine2" -p "splineDriver_spine1";
	rename -uid "CEDBD649-4557-E2EA-1AA2-F4997D362961";
	setAttr ".t" -type "double3" 4.1231056256176588 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 -28.072 ;
	setAttr ".radi" 0.5;
createNode joint -n "splineDriver_spine3" -p "splineDriver_spine2";
	rename -uid "60E3CE0D-4802-1952-4C90-46BB640907C3";
	setAttr ".t" -type "double3" 4.1231056256176606 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 -12.529000000000002 ;
	setAttr ".radi" 0.5;
createNode joint -n "splineDriver_spine4" -p "splineDriver_spine3";
	rename -uid "B2C6236D-44F1-7528-62C6-499CB4EFDC2F";
	setAttr ".t" -type "double3" 4.4721359549995778 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 26.565 ;
	setAttr ".radi" 0.5;
createNode transform -n "g_controls";
	rename -uid "F7A02CF6-4E05-8B7F-1577-2D8B917C0B51";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode transform -n "g_dualSplineIK" -p "g_controls";
	rename -uid "315780C2-4826-8BA0-F5E4-9D9FC6B7C3DE";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode transform -n "c_fkikBlend_spine0" -p "g_dualSplineIK";
	rename -uid "4CAD588E-4A1C-0D01-1CEB-3AADC1F06CDB";
	addAttr -ci true -sn "ikFwdRevBlend" -ln "ikFwdRevBlend" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "fkikBlend" -ln "fkikBlend" -min 0 -max 1 -at "double";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr -k on ".ikFwdRevBlend";
	setAttr -k on ".fkikBlend";
createNode nurbsCurve -n "c_fkikBlend_spineShape0" -p "c_fkikBlend_spine0";
	rename -uid "BB9550F6-4B19-7626-AFAC-E6BE009155D9";
	setAttr -k off ".v";
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[0:10]" -type "double3" 0 3 0 0 2.9999999999999996 
		0 0 3 0 0 3 0 0 3 0 0 3 0 0 3 0 0 3 0 0 0 0 0 0 0 0 0 0;
createNode transform -n "c_gimbal_spline" -p "g_dualSplineIK";
	rename -uid "79C046F9-481A-B0DF-3779-3DADEF6B14A3";
createNode nurbsCurve -n "c_gimbal_splineShape" -p "c_gimbal_spline";
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
createNode joint -n "dualSplineDriver0" -p "c_gimbal_spline";
	rename -uid "FB5B7AC3-4D8C-A84B-5D9A-118984441054";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 23.198590719731474 ;
	setAttr ".bps" -type "matrix" 0.9191450286011964 0.39391930188517776 0 0 -0.39391930188517776 0.9191450286011964 0 0
		 0 0 1 0 0 0 0 1;
	setAttr ".radi" 0.89846934685341584;
createNode joint -n "dualSplineDriver1" -p "c_gimbal_spline";
	rename -uid "90FA2F2F-4348-1CF1-1AE7-8597B2C4959F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.2570753777354389 1.5827134404387877 3.342841797595351e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 8 3.4285714626312256 -2.0987188120514996e-16 1;
	setAttr ".radi" 0.89846934685341584;
createNode joint -n "dualSplineDriver2" -p "c_gimbal_spline";
	rename -uid "790CB9F7-4A44-203C-14A8-F5816C77D5A3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 8.8736909040861143 0 8.0422967251202117e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 16 2.4424906541753444e-15 8.0422967251202117e-16 1;
	setAttr ".radi" 0.89846934685341584;
createNode transform -n "g_rigLogic";
	rename -uid "905E6DAB-433D-7050-B78E-8990F26E6029";
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
	setAttr ".r" -type "double3" -2.7850415743400146e-15 8.0855181761199386 -3.9405322206840165e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90 0 26.565051177078004 ;
	setAttr ".radi" 0.125;
createNode joint -n "jSplineSolver1" -p "jSplineSolver0";
	rename -uid "E1A60970-4BE2-493F-18E6-3886B9D28032";
	setAttr ".t" -type "double3" 4.4721359549995796 0 -6.6613381477509392e-16 ;
	setAttr ".r" -type "double3" 8.1135569356923649e-15 20.984536148391289 4.3809829153905088e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 12.528807709151504 0 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 0.125;
createNode joint -n "jSplineSolver2" -p "jSplineSolver1";
	rename -uid "E434E12C-42CA-4595-2109-DAA1B43F9B6D";
	setAttr ".t" -type "double3" 4.1231056256176588 0 -7.7715611723760958e-16 ;
	setAttr ".r" -type "double3" -2.2065286121803666e-16 -14.921077330133667 1.6849917585026957e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 28.072486935852957 0 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 0.125;
createNode joint -n "jSplineSolver3" -p "jSplineSolver2";
	rename -uid "61B4EE3B-4473-607A-6587-F09A1D0087EB";
	setAttr ".t" -type "double3" 4.1231056256176597 0 -8.8817841970012523e-16 ;
	setAttr ".r" -type "double3" -2.9595563994738426e-17 -12.52321449712216 2.69730226488314e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 12.528807709151527 0 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
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
createNode joint -n "jRevSplineSolver4" -p "g_dualSplineIK_spine";
	rename -uid "684E376B-433B-6955-23D2-DFB7839ACBC8";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 8.8736909040860503 -9.8607613152626476e-30 0 ;
	setAttr ".r" -type "double3" 1.9770593281079702e-14 3.3341629726542109e-14 8.2032540123360338 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".radi" 0.25;
createNode joint -n "jRevSplineSolver3" -p "jRevSplineSolver4";
	rename -uid "7AB47575-4CA5-272D-7B93-DE8900A064AF";
	setAttr ".t" -type "double3" -4 2 0 ;
	setAttr ".r" -type "double3" 1.5630181638569228e-15 -4.1143394525131139e-14 20.706425504703677 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 -26.565 ;
	setAttr ".radi" 0.25;
createNode joint -n "jRevSplineSolver2" -p "jRevSplineSolver3";
	rename -uid "F86A8E91-4A81-A8B2-F81E-8DA3206B7D21";
	setAttr ".t" -type "double3" -4.024922 -0.894427 0 ;
	setAttr ".r" -type "double3" 9.6411162799353791e-16 -1.3559542667723694e-15 -14.682254903383397 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 12.529000000000002 ;
	setAttr ".radi" 0.25;
createNode joint -n "jRevSplineSolver1" -p "jRevSplineSolver2";
	rename -uid "BE7E5BBD-484B-9DBD-DFFF-47B122ACF416";
	setAttr ".t" -type "double3" -3.638034 -1.940285 0 ;
	setAttr ".r" -type "double3" 8.5508072917869369e-17 -2.5084488807847171e-16 -12.588831822253708 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 28.072 ;
	setAttr ".radi" 0.25;
createNode joint -n "jRevSplineSolver0" -p "jRevSplineSolver1";
	rename -uid "F1FD72A6-4E1B-C06F-7070-16A53D1A408C";
	setAttr ".t" -type "double3" -4.365641 -0.970143 0 ;
	setAttr ".r" -type "double3" -0.019586 -0.019586 -0.019586 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 12.529000000000002 ;
	setAttr ".radi" 0.25;
createNode ikEffector -n "effector1" -p "jRevSplineSolver1";
	rename -uid "774D2D26-4515-0D0A-EA4A-23B829AD0CB2";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode joint -n "jRevSplineChain0" -p "g_dualSplineIK_spine";
	rename -uid "F58D20AC-41D1-B46E-D3FA-478344429495";
	setAttr ".t" -type "double3" 0 1.7763568394002505e-15 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 26.565051177077994 ;
	setAttr ".radi" 0.125;
createNode joint -n "jRevSplineChain1" -p "jRevSplineChain0";
	rename -uid "9191864D-4F57-FEF6-32E1-86B05F34810B";
	setAttr ".t" -type "double3" 4.4721359549995805 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 -12.529000000000002 ;
	setAttr ".radi" 0.125;
createNode joint -n "jRevSplineChain2" -p "jRevSplineChain1";
	rename -uid "9B46071A-4615-DE77-2C81-849DFE21F03B";
	setAttr ".t" -type "double3" 4.1231056256176588 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 -28.072 ;
	setAttr ".radi" 0.125;
createNode joint -n "jRevSplineChain3" -p "jRevSplineChain2";
	rename -uid "B3519705-47A7-4945-7E6F-8BAC1A3C3C2A";
	setAttr ".t" -type "double3" 4.1231056256176606 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 -12.529000000000002 ;
	setAttr ".radi" 0.125;
createNode joint -n "jRevSplineChain4" -p "jRevSplineChain3";
	rename -uid "1756FF88-483B-6042-14A6-918BC364B79B";
	setAttr ".t" -type "double3" 4.4721359549995778 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".dla" yes;
	setAttr ".jo" -type "double3" 0 0 26.565 ;
	setAttr ".radi" 0.125;
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
	setAttr ".v" no;
	setAttr ".t" -type "double3" 15.799380053047766 -3.7120924073349757 0 ;
	setAttr ".r" -type "double3" -90 0 -28.190813674333381 ;
	setAttr ".roc" yes;
createNode ikHandle -n "ikh_dualSplineRevIK_spine0" -p "g_dualSplineIK_spine";
	rename -uid "C77FEBA4-4C81-84C7-B38B-D29FDC81A2B1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -6.9284266427237355 -3.7155202937682836 0 ;
	setAttr ".r" -type "double3" 0 0 15.674592791402613 ;
	setAttr ".roc" yes;
createNode transform -n "g_utilityCurves";
	rename -uid "D6643A92-4686-728C-56E1-4E8F3F3F593A";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode transform -n "curve_dualSplineIK_reverse" -p "g_utilityCurves";
	rename -uid "62558475-4B46-B33B-7442-A687DB581B3A";
	setAttr ".v" no;
createNode nurbsCurve -n "curve_primaryCurveRev_spine0" -p "curve_dualSplineIK_reverse";
	rename -uid "8079E95E-42D6-A958-B0A6-409995B5A151";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "nurbs_dualSplineIK_spine" -p "g_utilityCurves";
	rename -uid "21491F7A-44E0-39DA-C279-D9897C98BC7F";
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
createNode transform -n "locator1";
	rename -uid "E1C140A7-47A7-9D9E-4EC4-FB84A4597ECE";
	setAttr ".t" -type "double3" 8 3.4285714626312256 0 ;
createNode locator -n "locatorShape1" -p "locator1";
	rename -uid "4ADB8D48-4696-E67F-B480-A7BB114323DA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "locator2";
	rename -uid "E6875652-46DE-1A0E-8712-389F692F3804";
	setAttr ".t" -type "double3" 16 2.4424906541753444e-15 0 ;
createNode locator -n "locatorShape2" -p "locator2";
	rename -uid "70F03584-4AF9-C3AA-F1D8-D38974BBC1FE";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "locator3";
	rename -uid "F93EAA82-4D75-A17C-CAA8-5C8DC9956EE6";
	setAttr ".wfcc" -type "float3" 1 1 1 ;
	setAttr ".uoc" 2;
	setAttr ".s" -type "double3" 0.99999999999999967 1.0000000000000002 0.99999999999999967 ;
	setAttr ".opm" -type "matrix" 0.93712512156308159 0.34899356231222872 0 0 0 0 -1 0
		 -0.34899356231222872 0.9371251215630817 0 0 0 0 0 1;
	setAttr ".dla" yes;
createNode locator -n "locatorShape3" -p "locator3";
	rename -uid "864864FD-4089-4878-1454-658BC92CC798";
	setAttr -k off ".v";
	setAttr ".wfcc" -type "float3" 1 1 1 ;
	setAttr ".uoc" 2;
	setAttr ".los" -type "double3" 1.5 1.5 1.5 ;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "D3F496DB-4956-9D56-14D9-97B1CE82262A";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "895CA4CB-4C8B-5D26-F410-5596E3061EF2";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "6D29C657-4FA9-27E6-22B6-26813B5018BC";
createNode displayLayerManager -n "layerManager";
	rename -uid "1C10D02C-4DF8-88C8-1010-C98FBB033621";
createNode displayLayer -n "defaultLayer";
	rename -uid "13C15AEE-4107-18CF-07AD-8FA32B4920E8";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "A8B60087-46F2-5B05-4C64-A088B09BB8DF";
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
createNode aimMatrix -n "aim_splineDriverFwd_spine0";
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
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top|topShape\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 540\n            -height 255\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side|sideShape\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 539\n            -height 255\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front|frontShape\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n"
		+ "            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n"
		+ "            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 540\n            -height 255\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|persp|perspShape\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n"
		+ "            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n"
		+ "            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1086\n            -height 554\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
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
		+ "            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"|persp|perspShape\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n"
		+ "                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n"
		+ "                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n"
		+ "                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n"
		+ "\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1086\\n    -height 554\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1086\\n    -height 554\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
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
createNode aimMatrix -n "aim_splineDriverFwd_spine1";
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
createNode aimMatrix -n "aim_splineDriverFwd_spine2";
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
createNode aimMatrix -n "aim_splineDriverFwd_spine3";
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
createNode reverseCurve -n "cRev_primaryCurve_spine0";
	rename -uid "3D9092A2-4CED-AC8F-C7C0-A8AA94F084F4";
createNode makeNurbCircle -n "makeNurbCircle1";
	rename -uid "C8FE8FE5-4400-9A3B-ABD0-4F8B854DAB96";
	setAttr ".nr" -type "double3" 1 0 0 ;
	setAttr ".tol" 0;
createNode blendMatrix -n "blendMatrix1";
	rename -uid "4F5D9F7F-4937-2A4A-841B-33BB6E9B78A2";
createNode blendMatrix -n "blendMatrix2";
	rename -uid "6B7CE55E-4F53-C23D-EC39-E49A1BE26F8B";
createNode blendMatrix -n "blendMatrix3";
	rename -uid "9B4A6824-4DF5-3AE4-81F0-A992D21570E4";
createNode composeMatrix -n "cmx_rot_jRevSplineSolver3";
	rename -uid "82A508E3-4D04-FDA5-52BB-79AAE1ED8FB9";
createNode inverseMatrix -n "imx_rot_jRevSplineSolver3";
	rename -uid "41FCA8E4-4FE1-B66D-1C29-C783E682B63F";
createNode decomposeMatrix -n "dmx_rotDriver_jRevSplineChain3";
	rename -uid "0EADCB6C-4155-2E49-2329-80BCC40CF00A";
createNode composeMatrix -n "cmx_rot_jRevSplineSolver2";
	rename -uid "CDB296FB-4F9E-609C-05F0-669D10837620";
createNode inverseMatrix -n "imx_rot_jRevSplineSolver2";
	rename -uid "ABC60802-472E-36CF-0DB1-2C81BCEC239F";
createNode decomposeMatrix -n "dmx_rotDriver_jRevSplineChain2";
	rename -uid "1AED2490-4367-89A8-19F9-9A87E24EBF28";
createNode decomposeMatrix -n "dmx_rotDriver_jRevSplineChain1";
	rename -uid "27E6E210-49BA-27BB-7045-DF86A36C3575";
createNode inverseMatrix -n "imx_rot_jRevSplineSolver1";
	rename -uid "16DDDB62-4343-54A5-5000-70BA9351CE10";
createNode composeMatrix -n "cmx_rot_jRevSplineSolver1";
	rename -uid "FD2A0B52-4E64-6034-5E1C-349CF01390BA";
createNode decomposeMatrix -n "dmx_rotDriver_jRevSplineChain0";
	rename -uid "7BD3FDC4-467A-C15C-DE8A-01A893F502F5";
createNode inverseMatrix -n "imx_rot_jRevSplineSolver0";
	rename -uid "C2318827-4071-394B-5F95-6D82CD805D5E";
createNode composeMatrix -n "cmx_rot_jRevSplineSolver0";
	rename -uid "5193BFDE-40F1-529E-179C-A3B698E36977";
createNode multMatrix -n "mxm_opmReverseChain_jRevSplineChain0";
	rename -uid "849C3104-4A16-16EF-0C8D-D38F63453E06";
	setAttr -s 3 ".i";
createNode composeMatrix -n "cmx_transOrient_jRevSplineSolver0";
	rename -uid "8AADFA03-4587-1059-2194-89BE00159801";
createNode inverseMatrix -n "imx_jointOrient_jRevSplineChain0";
	rename -uid "CA0A6E70-4D8B-CD82-141E-00BBEE890828";
createNode composeMatrix -n "cmx_jointOrient_jRevSplineChain0";
	rename -uid "4ABA0DAE-4754-8D06-831E-30B61909FE86";
createNode blendMatrix -n "blendMatrix4";
	rename -uid "DE4C4C3B-4033-6EF6-2ADF-7E8A781D9260";
createNode nearestPointOnCurve -n "npoc_fwdSplineVector_jSplineDriver0";
	rename -uid "71F0A113-43BF-AFAF-D9E1-A3823FDC61A8";
createNode decomposeMatrix -n "dmx_worldMatrix_jRevSplineChain0";
	rename -uid "308CA51B-4605-993B-6C95-C397E4051D37";
createNode composeMatrix -n "cmx_dualSplineVector_jRevSplineChain0";
	rename -uid "E48BB77F-45D5-C96D-48E2-4DB3FEDCB70E";
createNode composeMatrix -n "cmx_dualSplineVector_jRevSplineChain1";
	rename -uid "303D269B-4293-AE4B-E433-259A6D244587";
createNode nearestPointOnCurve -n "npoc_fwdSplineVector_jSplineDriver1";
	rename -uid "CA471D51-44CB-6C39-7287-75BED4FAEFF5";
createNode decomposeMatrix -n "decomposeMatrix6";
	rename -uid "58CE256F-4371-A154-3B8F-4EA708490D5A";
createNode composeMatrix -n "cmx_dualSplineVector_jRevSplineChain2";
	rename -uid "D5B63F38-4E5B-DFAB-994C-60A180A0C973";
createNode nearestPointOnCurve -n "npoc_fwdSplineVector_jSplineDriver2";
	rename -uid "D236303B-432E-52AC-F262-21BC98E75DB8";
createNode decomposeMatrix -n "decomposeMatrix7";
	rename -uid "622F4E74-40DF-C763-3F96-288C320EE749";
createNode composeMatrix -n "cmx_dualSplineVector_jRevSplineChain3";
	rename -uid "AC57BFA3-49C1-635C-F457-5198CAE73B16";
createNode nearestPointOnCurve -n "npoc_fwdSplineVector_jSplineDriver3";
	rename -uid "3F174E5F-46E3-6407-0C59-1E8ED37761F0";
createNode decomposeMatrix -n "decomposeMatrix8";
	rename -uid "A484C982-4BCD-0BB2-1136-DEB734DCA470";
createNode multMatrix -n "mxm_dualSplineRevOffsetTrans_spline0";
	rename -uid "975439B5-46B8-8FB4-D543-26B9F261E89D";
	setAttr -s 2 ".i";
createNode decomposeMatrix -n "dmx_dualSplineRevOffsetTrans_spline0";
	rename -uid "BD7F5C62-4603-8860-50B5-4895480AD363";
createNode multMatrix -n "mxm_splineForward_jRevSplineChain0";
	rename -uid "F29ED493-49F4-A9F9-4AC1-988151FFBDD7";
	setAttr -s 2 ".i";
createNode inverseMatrix -n "inverseMatrix7";
	rename -uid "B6C4D9BF-4AC4-A6D1-0DCB-11BE24A7CB1E";
createNode pickMatrix -n "pmx_translate_jSplineSolver0";
	rename -uid "16B98678-4A32-9D42-B9AD-349CD1FEBF50";
	setAttr ".sca" no;
	setAttr ".she" no;
	setAttr ".rot" no;
createNode blendMatrix -n "bmx_dualSplineRevOffsetTrans_spline0";
	rename -uid "CD054096-4BC0-DEB9-657B-73A9F326AFEB";
createNode reverseCurve -n "cRev_tangentCurve_spine0";
	rename -uid "71D59314-4D4C-84D3-C969-1CB909079DAE";
createNode skinCluster -n "skinCluster1";
	rename -uid "D1D8EC11-499F-7A43-5121-F0A328C63BC4";
	setAttr -s 14 ".wl";
	setAttr ".wl[0:13].w"
		1 0 1
		3 0 0.99981515339468807 1 0.00016970912929565373 2 1.5137476016210504e-05
		3 0 0.99794159027845941 1 0.0019460457981948869 2 0.00011236392334559196
		3 0 0.99591028991051389 1 0.0038602661088903696 2 0.00022944398059577289
		3 0 0.42019173721015601 1 0.57173874137581304 2 0.0080695214140309585
		3 0 0.42359351994447458 1 0.56758152110681881 2 0.008824958948706647
		1 1 1
		3 0 0.00016968290216138107 1 0.9996606341956773 2 0.00016968290216137172
		3 0 0.0080695214140306341 1 0.57173874137568581 2 0.42019173721028358
		3 0 0.0088249589487062498 1 0.56758152110669757 2 0.4235935199445961
		3 0 0.00011236392334556772 1 0.0019460457981944292 2 0.99794159027845997
		3 0 0.00022944398059573733 1 0.0038602661088896987 2 0.99591028991051456
		1 2 1
		3 0 1.5137476016210797e-05 1 0.00016970912929565893 2 0.99981515339468818;
	setAttr -s 3 ".pm";
	setAttr ".pm[0]" -type "matrix" 0.9191450286011964 -0.39391930188517776 0 0 0.39391930188517776 0.9191450286011964 0 0
		 0 0 1 0 0 0 0 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -8 -3.4285714626312256 2.0987188120514996e-16 1;
	setAttr ".pm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -16 -2.4424906541753444e-15 -8.0422967251202117e-16 1;
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
	rename -uid "90DD4BCB-4B90-4F9F-BF69-3197681AFE2D";
	setAttr -s 4 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 4 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0.20106587402988552 0.9795777224399288 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 8 3.4285714626312256 -2.0987188120514996e-16 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 16 2.4424906541753444e-15
		 8.0422967251202117e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 4 ".m";
	setAttr -s 4 ".p";
	setAttr -s 4 ".g[0:3]" yes no no no;
	setAttr ".bp" yes;
createNode aimMatrix -n "aim_splineDriverRev_spine0";
	rename -uid "A9026051-49F6-145A-FC43-29BB937AC46D";
	setAttr ".sm" 1;
createNode aimMatrix -n "aim_splineDriverRev_spine1";
	rename -uid "1759CDD8-475E-BF20-4415-84B746F2D5EE";
	setAttr ".sm" 1;
createNode aimMatrix -n "aim_splineDriverRev_spine2";
	rename -uid "99D5BAA4-49EE-D7D8-E9A2-E78EF75F25F6";
	setAttr ".sm" 1;
createNode aimMatrix -n "aim_splineDriverRev_spine3";
	rename -uid "00710B76-4834-EE84-EF0D-F4A1248FFFD7";
	setAttr ".sm" 1;
createNode composeMatrix -n "cmx_downstreamTranslate_jRevSplineChain0";
	rename -uid "0535D2DC-4D10-0BB3-E30C-7FAC698A446A";
createNode composeMatrix -n "cmx_downstreamTranslate_jRevSplineChain1";
	rename -uid "70EF3C13-4DFB-E7DA-2A46-8EBEAF161DDA";
createNode composeMatrix -n "cmx_downstreamTranslate_jRevSplineChain2";
	rename -uid "8D61B5F2-4A68-88BC-9CA3-75874560DF87";
createNode composeMatrix -n "cmx_downstreamTranslate_jRevSplineChain3";
	rename -uid "930230AC-4530-FDBC-BF62-B99570A3351D";
createNode pickMatrix -n "pmx_worldPoint_jRevSplineChain0";
	rename -uid "B25981A0-4545-CB5D-2D98-9F8C21CAE578";
	setAttr ".sca" no;
	setAttr ".she" no;
	setAttr ".rot" no;
createNode pickMatrix -n "pmx_worldPoint_jRevSplineChain1";
	rename -uid "7DAFACBC-459A-A226-1388-7BA1CE318860";
	setAttr ".sca" no;
	setAttr ".she" no;
	setAttr ".rot" no;
createNode pickMatrix -n "pmx_worldPoint_jRevSplineChain2";
	rename -uid "D75B452C-4E32-1964-301D-019A8BD94F8B";
	setAttr ".sca" no;
	setAttr ".she" no;
	setAttr ".rot" no;
createNode pickMatrix -n "pmx_worldPoint_jRevSplineChain3";
	rename -uid "5E517143-4164-4663-C4F8-87BBCA603693";
	setAttr ".sca" no;
	setAttr ".she" no;
	setAttr ".rot" no;
createNode multMatrix -n "mxm_splineForward_jRevSplineChain1";
	rename -uid "2625E91B-4A6C-FCBC-32F5-949797D5798A";
	setAttr -s 2 ".i";
createNode multMatrix -n "mxm_splineForward_jRevSplineChain2";
	rename -uid "358E356F-48EB-6633-B7D2-00986225005A";
	setAttr -s 2 ".i";
createNode multMatrix -n "mxm_splineForward_jRevSplineChain3";
	rename -uid "D6E1C9D4-4E37-5C1E-544B-D484A039BE08";
	setAttr -s 2 ".i";
createNode inverseMatrix -n "inverseMatrix8";
	rename -uid "58E59475-4A02-A647-C38E-9FA8A09B6C5C";
createNode inverseMatrix -n "inverseMatrix9";
	rename -uid "14EB5522-4809-1F88-A318-8FA263DA839F";
createNode inverseMatrix -n "inverseMatrix10";
	rename -uid "6BCA5641-4997-DC89-3B54-0D97CF594109";
createNode multMatrix -n "mxm_splineTangent_jRevSplineChain0";
	rename -uid "3643780C-44F0-CE82-B525-9E94D4ECB993";
	setAttr -s 3 ".i";
createNode pickMatrix -n "pmx_splineForward_jRevSplineChain0";
	rename -uid "2762B391-4DEC-B73D-393A-69B3D6B87D9C";
	setAttr ".rot" no;
createNode multMatrix -n "mxm_splineTangent_jRevSplineChain1";
	rename -uid "26BF6489-4E2F-D673-28E7-8FBA95A3D077";
	setAttr -s 3 ".i";
createNode pickMatrix -n "pmx_splineForward_jRevSplineChain1";
	rename -uid "41576F63-4CCC-186E-D58C-CCB55D0954A0";
	setAttr ".rot" no;
createNode multMatrix -n "mxm_splineTangent_jRevSplineChain2";
	rename -uid "AA68BADF-4576-5FEA-AD46-4FB12CB0C7F7";
	setAttr -s 3 ".i";
createNode pickMatrix -n "pmx_splineForward_jRevSplineChain2";
	rename -uid "F5A979FF-4407-B17B-8C3D-929D1093BCCD";
	setAttr ".rot" no;
createNode pickMatrix -n "pmx_splineForward_jRevSplineChain3";
	rename -uid "3EB5A32F-4E3A-FFF4-3211-E59BE6B146A0";
	setAttr ".rot" no;
createNode multMatrix -n "mxm_splineTangent_jRevSplineChain3";
	rename -uid "88F1CBDF-45AA-1161-14AA-4D8F938E5E1E";
	setAttr -s 3 ".i";
createNode composeMatrix -n "cmx_scale_jRevSplineChain0";
	rename -uid "00D706A4-4076-4413-AFEB-2DAC2CB6DE0B";
createNode pickMatrix -n "pmx_opmReverseChainNoScale_jRevSplineChain0";
	rename -uid "D9F69ADA-4451-089E-75DF-BD8AE754361E";
	setAttr ".sca" no;
createNode composeMatrix -n "cmx_scale_jRevSplineChain1";
	rename -uid "1EE13CA2-4559-4503-D028-47A87C28FF02";
createNode composeMatrix -n "cmx_scale_jRevSplineChain2";
	rename -uid "CE772602-44F1-6570-E6CB-FABF3BB37094";
createNode composeMatrix -n "cmx_scale_jRevSplineChain3";
	rename -uid "5735A42C-4B14-6C88-0D94-61A3CEDE88D6";
createNode multMatrix -n "mxm_splineRevDriver_jRevSplineChain0";
	rename -uid "5C67489F-4DFA-FF3C-3D05-2BA2BA7C33AF";
	setAttr -s 2 ".i";
createNode multMatrix -n "mxm_splineRevDriver_jRevSplineChain1";
	rename -uid "E8FD662E-4EAB-A6A1-2710-66BB67E21832";
	setAttr -s 2 ".i";
createNode multMatrix -n "mxm_splineRevDriver_jRevSplineChain2";
	rename -uid "0EE70B64-4BE6-8D22-23DD-2BBFE1C97D2B";
	setAttr -s 2 ".i";
createNode multMatrix -n "mxm_splineRevDriver_jRevSplineChain3";
	rename -uid "5D070A04-4A89-39E3-05EE-FC85DF86171A";
	setAttr -s 2 ".i";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "87F19464-47E2-B66A-6ED1-5FA04C25B626";
	setAttr -s 3 ".tgi";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -72.705735338459561 -2823.6134139064134 ;
	setAttr ".tgi[0].vh" -type "double2" 3592.7703094847961 276.38974245925999 ;
	setAttr -s 154 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -345.71429443359375;
	setAttr ".tgi[0].ni[0].y" -1974.2857666015625;
	setAttr ".tgi[0].ni[0].nvs" 18313;
	setAttr ".tgi[0].ni[1].x" 1540;
	setAttr ".tgi[0].ni[1].y" -217.14285278320312;
	setAttr ".tgi[0].ni[1].nvs" 18312;
	setAttr ".tgi[0].ni[2].x" 597.14288330078125;
	setAttr ".tgi[0].ni[2].y" -2188.571533203125;
	setAttr ".tgi[0].ni[2].nvs" 18312;
	setAttr ".tgi[0].ni[3].x" 2611.428466796875;
	setAttr ".tgi[0].ni[3].y" -2702.857177734375;
	setAttr ".tgi[0].ni[3].nvs" 18312;
	setAttr ".tgi[0].ni[4].x" 597.14288330078125;
	setAttr ".tgi[0].ni[4].y" -1674.2857666015625;
	setAttr ".tgi[0].ni[4].nvs" 18305;
	setAttr ".tgi[0].ni[5].x" 2611.428466796875;
	setAttr ".tgi[0].ni[5].y" -474.28570556640625;
	setAttr ".tgi[0].ni[5].nvs" 18312;
	setAttr ".tgi[0].ni[6].x" 2611.428466796875;
	setAttr ".tgi[0].ni[6].y" -1331.4285888671875;
	setAttr ".tgi[0].ni[6].nvs" 18313;
	setAttr ".tgi[0].ni[7].x" 2740;
	setAttr ".tgi[0].ni[7].y" -388.57144165039062;
	setAttr ".tgi[0].ni[7].nvs" 18312;
	setAttr ".tgi[0].ni[8].x" -345.71429443359375;
	setAttr ".tgi[0].ni[8].y" -1417.142822265625;
	setAttr ".tgi[0].ni[8].nvs" 18312;
	setAttr ".tgi[0].ni[9].x" -345.71429443359375;
	setAttr ".tgi[0].ni[9].y" -1460;
	setAttr ".tgi[0].ni[9].nvs" 18312;
	setAttr ".tgi[0].ni[10].x" 597.14288330078125;
	setAttr ".tgi[0].ni[10].y" -2102.857177734375;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" 2611.428466796875;
	setAttr ".tgi[0].ni[11].y" -174.28572082519531;
	setAttr ".tgi[0].ni[11].nvs" 18314;
	setAttr ".tgi[0].ni[12].x" 1797.142822265625;
	setAttr ".tgi[0].ni[12].y" -2231.428466796875;
	setAttr ".tgi[0].ni[12].nvs" 18313;
	setAttr ".tgi[0].ni[13].x" 2268.571533203125;
	setAttr ".tgi[0].ni[13].y" -1545.7142333984375;
	setAttr ".tgi[0].ni[13].nvs" 18313;
	setAttr ".tgi[0].ni[14].x" 2397.142822265625;
	setAttr ".tgi[0].ni[14].y" -45.714286804199219;
	setAttr ".tgi[0].ni[14].nvs" 18312;
	setAttr ".tgi[0].ni[15].x" 854.28570556640625;
	setAttr ".tgi[0].ni[15].y" -1760;
	setAttr ".tgi[0].ni[15].nvs" 18304;
	setAttr ".tgi[0].ni[16].x" 340;
	setAttr ".tgi[0].ni[16].y" -2145.71435546875;
	setAttr ".tgi[0].ni[16].nvs" 18313;
	setAttr ".tgi[0].ni[17].x" 1111.4285888671875;
	setAttr ".tgi[0].ni[17].y" -2102.857177734375;
	setAttr ".tgi[0].ni[17].nvs" 18305;
	setAttr ".tgi[0].ni[18].x" 854.28570556640625;
	setAttr ".tgi[0].ni[18].y" -2488.571533203125;
	setAttr ".tgi[0].ni[18].nvs" 18304;
	setAttr ".tgi[0].ni[19].x" 1111.4285888671875;
	setAttr ".tgi[0].ni[19].y" -645.71429443359375;
	setAttr ".tgi[0].ni[19].nvs" 18305;
	setAttr ".tgi[0].ni[20].x" -345.71429443359375;
	setAttr ".tgi[0].ni[20].y" -1545.7142333984375;
	setAttr ".tgi[0].ni[20].nvs" 18312;
	setAttr ".tgi[0].ni[21].x" 1797.142822265625;
	setAttr ".tgi[0].ni[21].y" -2145.71435546875;
	setAttr ".tgi[0].ni[21].nvs" 18312;
	setAttr ".tgi[0].ni[22].x" 1111.4285888671875;
	setAttr ".tgi[0].ni[22].y" -860;
	setAttr ".tgi[0].ni[22].nvs" 18305;
	setAttr ".tgi[0].ni[23].x" -345.71429443359375;
	setAttr ".tgi[0].ni[23].y" -1631.4285888671875;
	setAttr ".tgi[0].ni[23].nvs" 18312;
	setAttr ".tgi[0].ni[24].x" 597.14288330078125;
	setAttr ".tgi[0].ni[24].y" -1117.142822265625;
	setAttr ".tgi[0].ni[24].nvs" 18305;
	setAttr ".tgi[0].ni[25].x" 597.14288330078125;
	setAttr ".tgi[0].ni[25].y" -945.71429443359375;
	setAttr ".tgi[0].ni[25].nvs" 18305;
	setAttr ".tgi[0].ni[26].x" 2268.571533203125;
	setAttr ".tgi[0].ni[26].y" -2060;
	setAttr ".tgi[0].ni[26].nvs" 18313;
	setAttr ".tgi[0].ni[27].x" 854.28570556640625;
	setAttr ".tgi[0].ni[27].y" -645.71429443359375;
	setAttr ".tgi[0].ni[27].nvs" 18305;
	setAttr ".tgi[0].ni[28].x" 465.71429443359375;
	setAttr ".tgi[0].ni[28].y" -3112.857177734375;
	setAttr ".tgi[0].ni[28].nvs" 18304;
	setAttr ".tgi[0].ni[29].x" 1240;
	setAttr ".tgi[0].ni[29].y" 511.42855834960938;
	setAttr ".tgi[0].ni[29].nvs" 18312;
	setAttr ".tgi[0].ni[30].x" 1540;
	setAttr ".tgi[0].ni[30].y" -2060;
	setAttr ".tgi[0].ni[30].nvs" 18312;
	setAttr ".tgi[0].ni[31].x" 854.28570556640625;
	setAttr ".tgi[0].ni[31].y" -2102.857177734375;
	setAttr ".tgi[0].ni[31].nvs" 18305;
	setAttr ".tgi[0].ni[32].x" 1797.142822265625;
	setAttr ".tgi[0].ni[32].y" -260;
	setAttr ".tgi[0].ni[32].nvs" 18313;
	setAttr ".tgi[0].ni[33].x" 1540;
	setAttr ".tgi[0].ni[33].y" -2145.71435546875;
	setAttr ".tgi[0].ni[33].nvs" 18313;
	setAttr ".tgi[0].ni[34].x" 254.28572082519531;
	setAttr ".tgi[0].ni[34].y" -1031.4285888671875;
	setAttr ".tgi[0].ni[34].nvs" 18313;
	setAttr ".tgi[0].ni[35].x" 2611.428466796875;
	setAttr ".tgi[0].ni[35].y" -1974.2857666015625;
	setAttr ".tgi[0].ni[35].nvs" 18312;
	setAttr ".tgi[0].ni[36].x" 597.14288330078125;
	setAttr ".tgi[0].ni[36].y" -2831.428466796875;
	setAttr ".tgi[0].ni[36].nvs" 18312;
	setAttr ".tgi[0].ni[37].x" 1454.2857666015625;
	setAttr ".tgi[0].ni[37].y" -302.85714721679688;
	setAttr ".tgi[0].ni[37].nvs" 18313;
	setAttr ".tgi[0].ni[38].x" 1797.142822265625;
	setAttr ".tgi[0].ni[38].y" -1245.7142333984375;
	setAttr ".tgi[0].ni[38].nvs" 18313;
	setAttr ".tgi[0].ni[39].x" -345.71429443359375;
	setAttr ".tgi[0].ni[39].y" -1717.142822265625;
	setAttr ".tgi[0].ni[39].nvs" 18313;
	setAttr ".tgi[0].ni[40].x" 2011.4285888671875;
	setAttr ".tgi[0].ni[40].y" -645.71429443359375;
	setAttr ".tgi[0].ni[40].nvs" 18313;
	setAttr ".tgi[0].ni[41].x" 2868.571533203125;
	setAttr ".tgi[0].ni[41].y" -474.28570556640625;
	setAttr ".tgi[0].ni[41].nvs" 18313;
	setAttr ".tgi[0].ni[42].x" 2011.4285888671875;
	setAttr ".tgi[0].ni[42].y" -3431.428466796875;
	setAttr ".tgi[0].ni[42].nvs" 18313;
	setAttr ".tgi[0].ni[43].x" 2611.428466796875;
	setAttr ".tgi[0].ni[43].y" -88.571426391601562;
	setAttr ".tgi[0].ni[43].nvs" 18312;
	setAttr ".tgi[0].ni[44].x" 2611.428466796875;
	setAttr ".tgi[0].ni[44].y" -560;
	setAttr ".tgi[0].ni[44].nvs" 18313;
	setAttr ".tgi[0].ni[45].x" 1154.2857666015625;
	setAttr ".tgi[0].ni[45].y" -2831.428466796875;
	setAttr ".tgi[0].ni[45].nvs" 18305;
	setAttr ".tgi[0].ni[46].x" 2011.4285888671875;
	setAttr ".tgi[0].ni[46].y" -2145.71435546875;
	setAttr ".tgi[0].ni[46].nvs" 18313;
	setAttr ".tgi[0].ni[47].x" 2268.571533203125;
	setAttr ".tgi[0].ni[47].y" -2274.28564453125;
	setAttr ".tgi[0].ni[47].nvs" 18313;
	setAttr ".tgi[0].ni[48].x" 597.14288330078125;
	setAttr ".tgi[0].ni[48].y" -2574.28564453125;
	setAttr ".tgi[0].ni[48].nvs" 18313;
	setAttr ".tgi[0].ni[49].x" 597.14288330078125;
	setAttr ".tgi[0].ni[49].y" -645.71429443359375;
	setAttr ".tgi[0].ni[49].nvs" 18304;
	setAttr ".tgi[0].ni[50].x" 1540;
	setAttr ".tgi[0].ni[50].y" -2831.428466796875;
	setAttr ".tgi[0].ni[50].nvs" 18314;
	setAttr ".tgi[0].ni[51].x" 1540;
	setAttr ".tgi[0].ni[51].y" -1717.142822265625;
	setAttr ".tgi[0].ni[51].nvs" 18312;
	setAttr ".tgi[0].ni[52].x" 1797.142822265625;
	setAttr ".tgi[0].ni[52].y" -2617.142822265625;
	setAttr ".tgi[0].ni[52].nvs" 18313;
	setAttr ".tgi[0].ni[53].x" 254.28572082519531;
	setAttr ".tgi[0].ni[53].y" -302.85714721679688;
	setAttr ".tgi[0].ni[53].nvs" 18313;
	setAttr ".tgi[0].ni[54].x" 2011.4285888671875;
	setAttr ".tgi[0].ni[54].y" -1417.142822265625;
	setAttr ".tgi[0].ni[54].nvs" 18313;
	setAttr ".tgi[0].ni[55].x" 2868.571533203125;
	setAttr ".tgi[0].ni[55].y" -2617.142822265625;
	setAttr ".tgi[0].ni[55].nvs" 18313;
	setAttr ".tgi[0].ni[56].x" 1444.18798828125;
	setAttr ".tgi[0].ni[56].y" 8.8071184158325195;
	setAttr ".tgi[0].ni[56].nvs" 18313;
	setAttr ".tgi[0].ni[57].x" 340;
	setAttr ".tgi[0].ni[57].y" -602.85711669921875;
	setAttr ".tgi[0].ni[57].nvs" 18312;
	setAttr ".tgi[0].ni[58].x" 2268.571533203125;
	setAttr ".tgi[0].ni[58].y" -817.14288330078125;
	setAttr ".tgi[0].ni[58].nvs" 18313;
	setAttr ".tgi[0].ni[59].x" 254.28572082519531;
	setAttr ".tgi[0].ni[59].y" -1760;
	setAttr ".tgi[0].ni[59].nvs" 18313;
	setAttr ".tgi[0].ni[60].x" 340;
	setAttr ".tgi[0].ni[60].y" -217.14285278320312;
	setAttr ".tgi[0].ni[60].nvs" 18304;
	setAttr ".tgi[0].ni[61].x" 2868.571533203125;
	setAttr ".tgi[0].ni[61].y" -1974.2857666015625;
	setAttr ".tgi[0].ni[61].nvs" 18313;
	setAttr ".tgi[0].ni[62].x" 597.14288330078125;
	setAttr ".tgi[0].ni[62].y" -1374.2857666015625;
	setAttr ".tgi[0].ni[62].nvs" 18304;
	setAttr ".tgi[0].ni[63].x" 1540;
	setAttr ".tgi[0].ni[63].y" -1417.142822265625;
	setAttr ".tgi[0].ni[63].nvs" 18313;
	setAttr ".tgi[0].ni[64].x" 340;
	setAttr ".tgi[0].ni[64].y" -2060;
	setAttr ".tgi[0].ni[64].nvs" 18312;
	setAttr ".tgi[0].ni[65].x" 1540;
	setAttr ".tgi[0].ni[65].y" -688.5714111328125;
	setAttr ".tgi[0].ni[65].nvs" 18313;
	setAttr ".tgi[0].ni[66].x" 1797.142822265625;
	setAttr ".tgi[0].ni[66].y" -2960;
	setAttr ".tgi[0].ni[66].nvs" 18313;
	setAttr ".tgi[0].ni[67].x" 1797.142822265625;
	setAttr ".tgi[0].ni[67].y" -688.5714111328125;
	setAttr ".tgi[0].ni[67].nvs" 18312;
	setAttr ".tgi[0].ni[68].x" 340;
	setAttr ".tgi[0].ni[68].y" -1331.4285888671875;
	setAttr ".tgi[0].ni[68].nvs" 18312;
	setAttr ".tgi[0].ni[69].x" 2611.428466796875;
	setAttr ".tgi[0].ni[69].y" -2060;
	setAttr ".tgi[0].ni[69].nvs" 18314;
	setAttr ".tgi[0].ni[70].x" 854.28570556640625;
	setAttr ".tgi[0].ni[70].y" -1117.142822265625;
	setAttr ".tgi[0].ni[70].nvs" 18304;
	setAttr ".tgi[0].ni[71].x" 2268.571533203125;
	setAttr ".tgi[0].ni[71].y" -3002.857177734375;
	setAttr ".tgi[0].ni[71].nvs" 18313;
	setAttr ".tgi[0].ni[72].x" -174.28572082519531;
	setAttr ".tgi[0].ni[72].y" -2531.428466796875;
	setAttr ".tgi[0].ni[72].nvs" 18313;
	setAttr ".tgi[0].ni[73].x" 2911.428466796875;
	setAttr ".tgi[0].ni[73].y" -217.14285278320312;
	setAttr ".tgi[0].ni[73].nvs" 18312;
	setAttr ".tgi[0].ni[74].x" 854.28570556640625;
	setAttr ".tgi[0].ni[74].y" -2617.142822265625;
	setAttr ".tgi[0].ni[74].nvs" 18304;
	setAttr ".tgi[0].ni[75].x" 1797.142822265625;
	setAttr ".tgi[0].ni[75].y" -1074.2857666015625;
	setAttr ".tgi[0].ni[75].nvs" 18313;
	setAttr ".tgi[0].ni[76].x" 1454.2857666015625;
	setAttr ".tgi[0].ni[76].y" -2531.428466796875;
	setAttr ".tgi[0].ni[76].nvs" 18313;
	setAttr ".tgi[0].ni[77].x" -345.71429443359375;
	setAttr ".tgi[0].ni[77].y" -2402.857177734375;
	setAttr ".tgi[0].ni[77].nvs" 18312;
	setAttr ".tgi[0].ni[78].x" 1111.4285888671875;
	setAttr ".tgi[0].ni[78].y" -1374.2857666015625;
	setAttr ".tgi[0].ni[78].nvs" 18305;
	setAttr ".tgi[0].ni[79].x" 1454.2857666015625;
	setAttr ".tgi[0].ni[79].y" 511.42855834960938;
	setAttr ".tgi[0].ni[79].nvs" 18312;
	setAttr ".tgi[0].ni[80].x" 2868.571533203125;
	setAttr ".tgi[0].ni[80].y" -2960;
	setAttr ".tgi[0].ni[80].nvs" 18312;
	setAttr ".tgi[0].ni[81].x" 2868.571533203125;
	setAttr ".tgi[0].ni[81].y" -2317.142822265625;
	setAttr ".tgi[0].ni[81].nvs" 18312;
	setAttr ".tgi[0].ni[82].x" 1340.7445068359375;
	setAttr ".tgi[0].ni[82].y" 416.74908447265625;
	setAttr ".tgi[0].ni[82].nvs" 18313;
	setAttr ".tgi[0].ni[83].x" 597.14288330078125;
	setAttr ".tgi[0].ni[83].y" -1845.7142333984375;
	setAttr ".tgi[0].ni[83].nvs" 18305;
	setAttr ".tgi[0].ni[84].x" 854.28570556640625;
	setAttr ".tgi[0].ni[84].y" -302.85714721679688;
	setAttr ".tgi[0].ni[84].nvs" 18304;
	setAttr ".tgi[0].ni[85].x" 2311.428466796875;
	setAttr ".tgi[0].ni[85].y" -3431.428466796875;
	setAttr ".tgi[0].ni[85].nvs" 18312;
	setAttr ".tgi[0].ni[86].x" 1797.142822265625;
	setAttr ".tgi[0].ni[86].y" -431.42855834960938;
	setAttr ".tgi[0].ni[86].nvs" 18313;
	setAttr ".tgi[0].ni[87].x" 2868.571533203125;
	setAttr ".tgi[0].ni[87].y" 40;
	setAttr ".tgi[0].ni[87].nvs" 18313;
	setAttr ".tgi[0].ni[88].x" 1154.2857666015625;
	setAttr ".tgi[0].ni[88].y" -3088.571533203125;
	setAttr ".tgi[0].ni[88].nvs" 18305;
	setAttr ".tgi[0].ni[89].x" 2868.571533203125;
	setAttr ".tgi[0].ni[89].y" -1245.7142333984375;
	setAttr ".tgi[0].ni[89].nvs" 18313;
	setAttr ".tgi[0].ni[90].x" 1540;
	setAttr ".tgi[0].ni[90].y" -2445.71435546875;
	setAttr ".tgi[0].ni[90].nvs" 18304;
	setAttr ".tgi[0].ni[91].x" 2011.4285888671875;
	setAttr ".tgi[0].ni[91].y" -1931.4285888671875;
	setAttr ".tgi[0].ni[91].nvs" 18313;
	setAttr ".tgi[0].ni[92].x" 854.28570556640625;
	setAttr ".tgi[0].ni[92].y" -1374.2857666015625;
	setAttr ".tgi[0].ni[92].nvs" 18305;
	setAttr ".tgi[0].ni[93].x" 340;
	setAttr ".tgi[0].ni[93].y" -688.5714111328125;
	setAttr ".tgi[0].ni[93].nvs" 18313;
	setAttr ".tgi[0].ni[94].x" 2911.428466796875;
	setAttr ".tgi[0].ni[94].y" -302.85714721679688;
	setAttr ".tgi[0].ni[94].nvs" 18312;
	setAttr ".tgi[0].ni[95].x" 2611.428466796875;
	setAttr ".tgi[0].ni[95].y" -1245.7142333984375;
	setAttr ".tgi[0].ni[95].nvs" 18312;
	setAttr ".tgi[0].ni[96].x" 2740;
	setAttr ".tgi[0].ni[96].y" -1674.2857666015625;
	setAttr ".tgi[0].ni[96].nvs" 18312;
	setAttr ".tgi[0].ni[97].x" 2311.428466796875;
	setAttr ".tgi[0].ni[97].y" -3260;
	setAttr ".tgi[0].ni[97].nvs" 18313;
	setAttr ".tgi[0].ni[98].x" -45.714286804199219;
	setAttr ".tgi[0].ni[98].y" -1931.4285888671875;
	setAttr ".tgi[0].ni[98].nvs" 18313;
	setAttr ".tgi[0].ni[99].x" 1797.142822265625;
	setAttr ".tgi[0].ni[99].y" -1760;
	setAttr ".tgi[0].ni[99].nvs" 18313;
	setAttr ".tgi[0].ni[100].x" 2268.571533203125;
	setAttr ".tgi[0].ni[100].y" -2788.571533203125;
	setAttr ".tgi[0].ni[100].nvs" 18313;
	setAttr ".tgi[0].ni[101].x" 2868.571533203125;
	setAttr ".tgi[0].ni[101].y" -817.14288330078125;
	setAttr ".tgi[0].ni[101].nvs" 18312;
	setAttr ".tgi[0].ni[102].x" 2011.4285888671875;
	setAttr ".tgi[0].ni[102].y" -431.42855834960938;
	setAttr ".tgi[0].ni[102].nvs" 18312;
	setAttr ".tgi[0].ni[103].x" -345.71429443359375;
	setAttr ".tgi[0].ni[103].y" -2188.571533203125;
	setAttr ".tgi[0].ni[103].nvs" 18314;
	setAttr ".tgi[0].ni[104].x" 854.28570556640625;
	setAttr ".tgi[0].ni[104].y" -2831.428466796875;
	setAttr ".tgi[0].ni[104].nvs" 18305;
	setAttr ".tgi[0].ni[105].x" 340;
	setAttr ".tgi[0].ni[105].y" -945.71429443359375;
	setAttr ".tgi[0].ni[105].nvs" 18304;
	setAttr ".tgi[0].ni[106].x" 597.14288330078125;
	setAttr ".tgi[0].ni[106].y" -1460;
	setAttr ".tgi[0].ni[106].nvs" 18312;
	setAttr ".tgi[0].ni[107].x" 2868.571533203125;
	setAttr ".tgi[0].ni[107].y" -2231.428466796875;
	setAttr ".tgi[0].ni[107].nvs" 18312;
	setAttr ".tgi[0].ni[108].x" 854.28570556640625;
	setAttr ".tgi[0].ni[108].y" -1031.4285888671875;
	setAttr ".tgi[0].ni[108].nvs" 18304;
	setAttr ".tgi[0].ni[109].x" 2011.4285888671875;
	setAttr ".tgi[0].ni[109].y" -2831.428466796875;
	setAttr ".tgi[0].ni[109].nvs" 18313;
	setAttr ".tgi[0].ni[110].x" 2011.4285888671875;
	setAttr ".tgi[0].ni[110].y" -1245.7142333984375;
	setAttr ".tgi[0].ni[110].nvs" 18312;
	setAttr ".tgi[0].ni[111].x" 254.28572082519531;
	setAttr ".tgi[0].ni[111].y" -45.714286804199219;
	setAttr ".tgi[0].ni[111].nvs" 18313;
	setAttr ".tgi[0].ni[112].x" 1111.4285888671875;
	setAttr ".tgi[0].ni[112].y" -2360;
	setAttr ".tgi[0].ni[112].nvs" 18305;
	setAttr ".tgi[0].ni[113].x" 1497.142822265625;
	setAttr ".tgi[0].ni[113].y" -1802.857177734375;
	setAttr ".tgi[0].ni[113].nvs" 18361;
	setAttr ".tgi[0].ni[114].x" 597.14288330078125;
	setAttr ".tgi[0].ni[114].y" -731.4285888671875;
	setAttr ".tgi[0].ni[114].nvs" 18312;
	setAttr ".tgi[0].ni[115].x" 340;
	setAttr ".tgi[0].ni[115].y" -1417.142822265625;
	setAttr ".tgi[0].ni[115].nvs" 18313;
	setAttr ".tgi[0].ni[116].x" 2268.571533203125;
	setAttr ".tgi[0].ni[116].y" -431.42855834960938;
	setAttr ".tgi[0].ni[116].nvs" 18313;
	setAttr ".tgi[0].ni[117].x" 597.14288330078125;
	setAttr ".tgi[0].ni[117].y" -217.14285278320312;
	setAttr ".tgi[0].ni[117].nvs" 18305;
	setAttr ".tgi[0].ni[118].x" 2868.571533203125;
	setAttr ".tgi[0].ni[118].y" -1588.5714111328125;
	setAttr ".tgi[0].ni[118].nvs" 18312;
	setAttr ".tgi[0].ni[119].x" 854.28570556640625;
	setAttr ".tgi[0].ni[119].y" -388.57144165039062;
	setAttr ".tgi[0].ni[119].nvs" 18304;
	setAttr ".tgi[0].ni[120].x" 340;
	setAttr ".tgi[0].ni[120].y" -2788.571533203125;
	setAttr ".tgi[0].ni[120].nvs" 18312;
	setAttr ".tgi[0].ni[121].x" 1540;
	setAttr ".tgi[0].ni[121].y" -1331.4285888671875;
	setAttr ".tgi[0].ni[121].nvs" 18312;
	setAttr ".tgi[0].ni[122].x" 1797.142822265625;
	setAttr ".tgi[0].ni[122].y" -2831.428466796875;
	setAttr ".tgi[0].ni[122].nvs" 18312;
	setAttr ".tgi[0].ni[123].x" 1797.142822265625;
	setAttr ".tgi[0].ni[123].y" -1460;
	setAttr ".tgi[0].ni[123].nvs" 18312;
	setAttr ".tgi[0].ni[124].x" 597.14288330078125;
	setAttr ".tgi[0].ni[124].y" -2917.142822265625;
	setAttr ".tgi[0].ni[124].nvs" 18312;
	setAttr ".tgi[0].ni[125].x" 2740;
	setAttr ".tgi[0].ni[125].y" -2402.857177734375;
	setAttr ".tgi[0].ni[125].nvs" 18313;
	setAttr ".tgi[0].ni[126].x" 2268.571533203125;
	setAttr ".tgi[0].ni[126].y" -1331.4285888671875;
	setAttr ".tgi[0].ni[126].nvs" 18313;
	setAttr ".tgi[0].ni[127].x" 1540;
	setAttr ".tgi[0].ni[127].y" -2745.71435546875;
	setAttr ".tgi[0].ni[127].nvs" 18312;
	setAttr ".tgi[0].ni[128].x" 1797.142822265625;
	setAttr ".tgi[0].ni[128].y" -817.14288330078125;
	setAttr ".tgi[0].ni[128].nvs" 18312;
	setAttr ".tgi[0].ni[129].x" 2397.142822265625;
	setAttr ".tgi[0].ni[129].y" 168.57142639160156;
	setAttr ".tgi[0].ni[129].nvs" 18313;
	setAttr ".tgi[0].ni[130].x" 340;
	setAttr ".tgi[0].ni[130].y" -1674.2857666015625;
	setAttr ".tgi[0].ni[130].nvs" 18304;
	setAttr ".tgi[0].ni[131].x" 1540;
	setAttr ".tgi[0].ni[131].y" -602.85711669921875;
	setAttr ".tgi[0].ni[131].nvs" 18312;
	setAttr ".tgi[0].ni[132].x" 1797.142822265625;
	setAttr ".tgi[0].ni[132].y" -2445.71435546875;
	setAttr ".tgi[0].ni[132].nvs" 18313;
	setAttr ".tgi[0].ni[133].x" 40;
	setAttr ".tgi[0].ni[133].y" -2642.857177734375;
	setAttr ".tgi[0].ni[133].nvs" 18304;
	setAttr ".tgi[0].ni[134].x" 2740;
	setAttr ".tgi[0].ni[134].y" -3045.71435546875;
	setAttr ".tgi[0].ni[134].nvs" 18313;
	setAttr ".tgi[0].ni[135].x" 2868.571533203125;
	setAttr ".tgi[0].ni[135].y" -2874.28564453125;
	setAttr ".tgi[0].ni[135].nvs" 18312;
	setAttr ".tgi[0].ni[136].x" 1797.142822265625;
	setAttr ".tgi[0].ni[136].y" -1931.4285888671875;
	setAttr ".tgi[0].ni[136].nvs" 18313;
	setAttr ".tgi[0].ni[137].x" 597.14288330078125;
	setAttr ".tgi[0].ni[137].y" -2402.857177734375;
	setAttr ".tgi[0].ni[137].nvs" 18305;
	setAttr ".tgi[0].ni[138].x" 854.28570556640625;
	setAttr ".tgi[0].ni[138].y" -1845.7142333984375;
	setAttr ".tgi[0].ni[138].nvs" 18304;
	setAttr ".tgi[0].ni[139].x" -88.571426391601562;
	setAttr ".tgi[0].ni[139].y" -1717.142822265625;
	setAttr ".tgi[0].ni[139].nvs" 18313;
	setAttr ".tgi[0].ni[140].x" 597.14288330078125;
	setAttr ".tgi[0].ni[140].y" -388.57144165039062;
	setAttr ".tgi[0].ni[140].nvs" 18305;
	setAttr ".tgi[0].ni[141].x" 2611.428466796875;
	setAttr ".tgi[0].ni[141].y" -2788.571533203125;
	setAttr ".tgi[0].ni[141].nvs" 18313;
	setAttr ".tgi[0].ni[142].x" 1540;
	setAttr ".tgi[0].ni[142].y" -988.5714111328125;
	setAttr ".tgi[0].ni[142].nvs" 18312;
	setAttr ".tgi[0].ni[143].x" 340;
	setAttr ".tgi[0].ni[143].y" -2402.857177734375;
	setAttr ".tgi[0].ni[143].nvs" 18304;
	setAttr ".tgi[0].ni[144].x" 2740;
	setAttr ".tgi[0].ni[144].y" -902.85711669921875;
	setAttr ".tgi[0].ni[144].nvs" 18312;
	setAttr ".tgi[0].ni[145].x" 1111.4285888671875;
	setAttr ".tgi[0].ni[145].y" -1631.4285888671875;
	setAttr ".tgi[0].ni[145].nvs" 18305;
	setAttr ".tgi[0].ni[146].x" 2868.571533203125;
	setAttr ".tgi[0].ni[146].y" -731.4285888671875;
	setAttr ".tgi[0].ni[146].nvs" 18312;
	setAttr ".tgi[0].ni[147].x" 340;
	setAttr ".tgi[0].ni[147].y" -2874.28564453125;
	setAttr ".tgi[0].ni[147].nvs" 18313;
	setAttr ".tgi[0].ni[148].x" 254.28572082519531;
	setAttr ".tgi[0].ni[148].y" -2488.571533203125;
	setAttr ".tgi[0].ni[148].nvs" 18313;
	setAttr ".tgi[0].ni[149].x" 1797.142822265625;
	setAttr ".tgi[0].ni[149].y" -1545.7142333984375;
	setAttr ".tgi[0].ni[149].nvs" 18312;
	setAttr ".tgi[0].ni[150].x" 1454.2857666015625;
	setAttr ".tgi[0].ni[150].y" -1074.2857666015625;
	setAttr ".tgi[0].ni[150].nvs" 18313;
	setAttr ".tgi[0].ni[151].x" 2868.571533203125;
	setAttr ".tgi[0].ni[151].y" -1502.857177734375;
	setAttr ".tgi[0].ni[151].nvs" 18312;
	setAttr ".tgi[0].ni[152].x" 2011.4285888671875;
	setAttr ".tgi[0].ni[152].y" -2617.142822265625;
	setAttr ".tgi[0].ni[152].nvs" 18313;
	setAttr ".tgi[0].ni[153].x" 2011.4285888671875;
	setAttr ".tgi[0].ni[153].y" -3260;
	setAttr ".tgi[0].ni[153].nvs" 18313;
	setAttr ".tgi[1].tn" -type "string" "Untitled_2";
	setAttr ".tgi[1].vl" -type "double2" -579.79342528482846 -696.33549498490902 ;
	setAttr ".tgi[1].vh" -type "double2" 975.92086042945743 619.37879072937676 ;
	setAttr -s 30 ".tgi[1].ni";
	setAttr ".tgi[1].ni[0].x" -147.14285278320312;
	setAttr ".tgi[1].ni[0].y" -305.71429443359375;
	setAttr ".tgi[1].ni[0].nvs" 18312;
	setAttr ".tgi[1].ni[1].x" 110;
	setAttr ".tgi[1].ni[1].y" 637.14288330078125;
	setAttr ".tgi[1].ni[1].nvs" 18313;
	setAttr ".tgi[1].ni[2].x" -404.28570556640625;
	setAttr ".tgi[1].ni[2].y" -820;
	setAttr ".tgi[1].ni[2].nvs" 18304;
	setAttr ".tgi[1].ni[3].x" -147.14285278320312;
	setAttr ".tgi[1].ni[3].y" -134.28572082519531;
	setAttr ".tgi[1].ni[3].nvs" 18312;
	setAttr ".tgi[1].ni[4].x" 110;
	setAttr ".tgi[1].ni[4].y" -562.85711669921875;
	setAttr ".tgi[1].ni[4].nvs" 18312;
	setAttr ".tgi[1].ni[5].x" -147.14285278320312;
	setAttr ".tgi[1].ni[5].y" 122.85713958740234;
	setAttr ".tgi[1].ni[5].nvs" 18312;
	setAttr ".tgi[1].ni[6].x" -147.14285278320312;
	setAttr ".tgi[1].ni[6].y" 208.57142639160156;
	setAttr ".tgi[1].ni[6].nvs" 18312;
	setAttr ".tgi[1].ni[7].x" -404.28570556640625;
	setAttr ".tgi[1].ni[7].y" 808.5714111328125;
	setAttr ".tgi[1].ni[7].nvs" 18313;
	setAttr ".tgi[1].ni[8].x" 110;
	setAttr ".tgi[1].ni[8].y" 808.5714111328125;
	setAttr ".tgi[1].ni[8].nvs" 18313;
	setAttr ".tgi[1].ni[9].x" 110;
	setAttr ".tgi[1].ni[9].y" -134.28572082519531;
	setAttr ".tgi[1].ni[9].nvs" 18313;
	setAttr ".tgi[1].ni[10].x" -147.14285278320312;
	setAttr ".tgi[1].ni[10].y" 637.14288330078125;
	setAttr ".tgi[1].ni[10].nvs" 18312;
	setAttr ".tgi[1].ni[11].x" -147.14285278320312;
	setAttr ".tgi[1].ni[11].y" 465.71429443359375;
	setAttr ".tgi[1].ni[11].nvs" 18312;
	setAttr ".tgi[1].ni[12].x" -404.28570556640625;
	setAttr ".tgi[1].ni[12].y" 637.14288330078125;
	setAttr ".tgi[1].ni[12].nvs" 18313;
	setAttr ".tgi[1].ni[13].x" -147.14285278320312;
	setAttr ".tgi[1].ni[13].y" 551.4285888671875;
	setAttr ".tgi[1].ni[13].nvs" 18312;
	setAttr ".tgi[1].ni[14].x" 110;
	setAttr ".tgi[1].ni[14].y" 380;
	setAttr ".tgi[1].ni[14].nvs" 18313;
	setAttr ".tgi[1].ni[15].x" -147.14285278320312;
	setAttr ".tgi[1].ni[15].y" 294.28570556640625;
	setAttr ".tgi[1].ni[15].nvs" 18312;
	setAttr ".tgi[1].ni[16].x" -404.28570556640625;
	setAttr ".tgi[1].ni[16].y" 380;
	setAttr ".tgi[1].ni[16].nvs" 18313;
	setAttr ".tgi[1].ni[17].x" 110;
	setAttr ".tgi[1].ni[17].y" 122.85713958740234;
	setAttr ".tgi[1].ni[17].nvs" 18313;
	setAttr ".tgi[1].ni[18].x" -147.14285278320312;
	setAttr ".tgi[1].ni[18].y" -648.5714111328125;
	setAttr ".tgi[1].ni[18].nvs" 18304;
	setAttr ".tgi[1].ni[19].x" -147.14285278320312;
	setAttr ".tgi[1].ni[19].y" 37.142856597900391;
	setAttr ".tgi[1].ni[19].nvs" 18312;
	setAttr ".tgi[1].ni[20].x" 110;
	setAttr ".tgi[1].ni[20].y" -820;
	setAttr ".tgi[1].ni[20].nvs" 18304;
	setAttr ".tgi[1].ni[21].x" -147.14285278320312;
	setAttr ".tgi[1].ni[21].y" -48.571430206298828;
	setAttr ".tgi[1].ni[21].nvs" 18312;
	setAttr ".tgi[1].ni[22].x" -147.14285278320312;
	setAttr ".tgi[1].ni[22].y" -391.42855834960938;
	setAttr ".tgi[1].ni[22].nvs" 18313;
	setAttr ".tgi[1].ni[23].x" -147.14285278320312;
	setAttr ".tgi[1].ni[23].y" -820;
	setAttr ".tgi[1].ni[23].nvs" 18304;
	setAttr ".tgi[1].ni[24].x" -147.14285278320312;
	setAttr ".tgi[1].ni[24].y" -220;
	setAttr ".tgi[1].ni[24].nvs" 18312;
	setAttr ".tgi[1].ni[25].x" -147.14285278320312;
	setAttr ".tgi[1].ni[25].y" 380;
	setAttr ".tgi[1].ni[25].nvs" 18312;
	setAttr ".tgi[1].ni[26].x" 110;
	setAttr ".tgi[1].ni[26].y" -391.42855834960938;
	setAttr ".tgi[1].ni[26].nvs" 18313;
	setAttr ".tgi[1].ni[27].x" -404.28570556640625;
	setAttr ".tgi[1].ni[27].y" -434.28570556640625;
	setAttr ".tgi[1].ni[27].nvs" 18313;
	setAttr ".tgi[1].ni[28].x" -404.28570556640625;
	setAttr ".tgi[1].ni[28].y" 122.85713958740234;
	setAttr ".tgi[1].ni[28].nvs" 18313;
	setAttr ".tgi[1].ni[29].x" -404.28570556640625;
	setAttr ".tgi[1].ni[29].y" -134.28572082519531;
	setAttr ".tgi[1].ni[29].nvs" 18313;
	setAttr ".tgi[2].tn" -type "string" "Untitled_3";
	setAttr ".tgi[2].vl" -type "double2" -792.07961797493999 -680.95235389376546 ;
	setAttr ".tgi[2].vh" -type "double2" 640.88914779223342 530.9523598542296 ;
	setAttr -s 7 ".tgi[2].ni";
	setAttr ".tgi[2].ni[0].x" 60.734256744384766;
	setAttr ".tgi[2].ni[0].y" 104.64894866943359;
	setAttr ".tgi[2].ni[0].nvs" 18313;
	setAttr ".tgi[2].ni[1].x" -284.89889526367188;
	setAttr ".tgi[2].ni[1].y" -131.54574584960938;
	setAttr ".tgi[2].ni[1].nvs" 18312;
	setAttr ".tgi[2].ni[2].x" -279.50399780273438;
	setAttr ".tgi[2].ni[2].y" -310.93939208984375;
	setAttr ".tgi[2].ni[2].nvs" 18312;
	setAttr ".tgi[2].ni[3].x" -284.16561889648438;
	setAttr ".tgi[2].ni[3].y" -217.96896362304688;
	setAttr ".tgi[2].ni[3].nvs" 18312;
	setAttr ".tgi[2].ni[4].x" -287.36065673828125;
	setAttr ".tgi[2].ni[4].y" 23.574838638305664;
	setAttr ".tgi[2].ni[4].nvs" 18312;
	setAttr ".tgi[2].ni[5].x" 60.734256744384766;
	setAttr ".tgi[2].ni[5].y" -198.20819091796875;
	setAttr ".tgi[2].ni[5].nvs" 18313;
	setAttr ".tgi[2].ni[6].x" 391.42855834960938;
	setAttr ".tgi[2].ni[6].y" -202.85714721679688;
	setAttr ".tgi[2].ni[6].nvs" 18304;
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
	setAttr -s 45 ".u";
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
connectAttr "dmx_jointDriver_spine0.or" "splineDriver_spine0.r";
connectAttr "dmx_jointDriver_spine0.os" "splineDriver_spine0.s";
connectAttr "dmx_dualSplineRevOffsetTrans_spline0.ot" "splineDriver_spine0.t";
connectAttr "splineDriver_spine0.s" "splineDriver_spine1.is";
connectAttr "dmx_jointDriver_spine1.or" "splineDriver_spine1.r";
connectAttr "dmx_jointDriver_spine1.os" "splineDriver_spine1.s";
connectAttr "splineDriver_spine1.s" "splineDriver_spine2.is";
connectAttr "dmx_jointDriver_spine2.or" "splineDriver_spine2.r";
connectAttr "dmx_jointDriver_spine2.os" "splineDriver_spine2.s";
connectAttr "splineDriver_spine2.s" "splineDriver_spine3.is";
connectAttr "dmx_jointDriver_spine3.or" "splineDriver_spine3.r";
connectAttr "dmx_jointDriver_spine3.os" "splineDriver_spine3.s";
connectAttr "splineDriver_spine3.s" "splineDriver_spine4.is";
connectAttr "dmx_jointDriver_spine4.or" "splineDriver_spine4.r";
connectAttr "dmx_jointDriver_spine4.os" "splineDriver_spine4.s";
connectAttr "makeNurbCircle1.oc" "c_fkikBlend_spineShape0.cr";
connectAttr "jSplineSolver0.s" "jSplineSolver1.is";
connectAttr "jSplineSolver1.s" "jSplineSolver2.is";
connectAttr "jSplineSolver2.s" "jSplineSolver3.is";
connectAttr "jSplineSolver3.s" "jSplineSolver4.is";
connectAttr "jSplineSolver4.tx" "ike_dualSplineIK_spine0.tx";
connectAttr "jSplineSolver4.ty" "ike_dualSplineIK_spine0.ty";
connectAttr "jSplineSolver4.tz" "ike_dualSplineIK_spine0.tz";
connectAttr "jSplineSolver4.opm" "ike_dualSplineIK_spine0.opm";
connectAttr "jRevSplineSolver4.s" "jRevSplineSolver3.is";
connectAttr "jRevSplineSolver3.s" "jRevSplineSolver2.is";
connectAttr "jRevSplineSolver2.s" "jRevSplineSolver1.is";
connectAttr "jRevSplineSolver1.s" "jRevSplineSolver0.is";
connectAttr "jRevSplineSolver0.tx" "effector1.tx";
connectAttr "jRevSplineSolver0.ty" "effector1.ty";
connectAttr "jRevSplineSolver0.tz" "effector1.tz";
connectAttr "jRevSplineSolver0.opm" "effector1.opm";
connectAttr "dmx_rotDriver_jRevSplineChain0.or" "jRevSplineChain0.r";
connectAttr "pmx_opmReverseChainNoScale_jRevSplineChain0.tmat" "jRevSplineChain0.opm"
		;
connectAttr "jRevSplineSolver1.s" "jRevSplineChain0.s";
connectAttr "jRevSplineChain0.s" "jRevSplineChain1.is";
connectAttr "dmx_rotDriver_jRevSplineChain1.or" "jRevSplineChain1.r";
connectAttr "jRevSplineSolver2.s" "jRevSplineChain1.s";
connectAttr "jRevSplineChain1.s" "jRevSplineChain2.is";
connectAttr "dmx_rotDriver_jRevSplineChain2.or" "jRevSplineChain2.r";
connectAttr "jRevSplineSolver3.s" "jRevSplineChain2.s";
connectAttr "jRevSplineChain2.s" "jRevSplineChain3.is";
connectAttr "dmx_rotDriver_jRevSplineChain3.or" "jRevSplineChain3.r";
connectAttr "jRevSplineSolver4.s" "jRevSplineChain3.s";
connectAttr "jRevSplineChain3.s" "jRevSplineChain4.is";
connectAttr "jSplineSolver0.msg" "ikh_dualSplineIK_spine0.hsj";
connectAttr "ike_dualSplineIK_spine0.hp" "ikh_dualSplineIK_spine0.hee";
connectAttr "ikSplineSolver.msg" "ikh_dualSplineIK_spine0.hsv";
connectAttr "siso_primaryCurve_spine0.oc" "ikh_dualSplineIK_spine0.ic";
connectAttr "jRevSplineSolver4.msg" "ikh_dualSplineRevIK_spine0.hsj";
connectAttr "effector1.hp" "ikh_dualSplineRevIK_spine0.hee";
connectAttr "ikSplineSolver.msg" "ikh_dualSplineRevIK_spine0.hsv";
connectAttr "curve_primaryCurveRev_spine0.ws" "ikh_dualSplineRevIK_spine0.ic";
connectAttr "cRev_primaryCurve_spine0.oc" "curve_primaryCurveRev_spine0.cr";
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
connectAttr "mxm_splineTangent_jSplineDriver0.o" "aim_splineDriverFwd_spine0.smat"
		;
connectAttr "pmx_worldPoint_jSplineDriver0.tmat" "aim_splineDriverFwd_spine0.imat"
		;
connectAttr "pmx_splineForward_jSplineDriver0.tmat" "aim_splineDriverFwd_spine0.pmat"
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
connectAttr "splineDriver_spine0.jo" "cmx_jointOrient_spine0.ir";
connectAttr "cmx_jointOrient_spine0.omat" "imx_jointOrientInverse_spine0.imat";
connectAttr "mxm_splineDriver_spine0.forwardOrient" "mxm_splineDriver_spine0.i[0]"
		;
connectAttr "blendMatrix1.omat" "mxm_splineDriver_spine0.i[1]";
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
connectAttr "blendMatrix2.omat" "mxm_splineDriver_spine1.i[1]";
connectAttr "pmx_parentInverseRotate_spine1.tmat" "mxm_splineDriver_spine1.i[2]"
		;
connectAttr "imx_jointOrientInverse_spine1.omat" "mxm_splineDriver_spine1.i[3]";
connectAttr "mxm_splineDriver_spine1.o" "dmx_jointDriver_spine1.imat";
connectAttr "splineDriver_spine1.jo" "cmx_jointOrient_spine1.ir";
connectAttr "cmx_jointOrient_spine1.omat" "imx_jointOrientInverse_spine1.imat";
connectAttr "pmx_worldPoint_jSplineDriver1.tmat" "imx_worldPointInverse_jSplineDriver1.imat"
		;
connectAttr "imx_worldPointInverse_jSplineDriver1.omat" "mxm_splineTangent_jSplineDriver1.i[0]"
		;
connectAttr "cmx_dualSplineVector_jSplineDriver1.omat" "mxm_splineTangent_jSplineDriver1.i[1]"
		;
connectAttr "pmx_worldPoint_jSplineDriver1.tmat" "mxm_splineTangent_jSplineDriver1.i[2]"
		;
connectAttr "pmx_worldPoint_jSplineDriver1.tmat" "aim_splineDriverFwd_spine1.imat"
		;
connectAttr "aim_splineDriverFwd_spine0.smi" "aim_splineDriverFwd_spine1.smi";
connectAttr "mxm_splineTangent_jSplineDriver1.o" "aim_splineDriverFwd_spine1.smat"
		;
connectAttr "pmx_splineForward_jSplineDriver1.tmat" "aim_splineDriverFwd_spine1.pmat"
		;
connectAttr "splineDriver_spine0.pim" "pmx_parentInverseRotate_spine0.imat";
connectAttr "splineDriver_spine1.pim" "pmx_parentInverseRotate_spine1.imat";
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
connectAttr "aim_splineDriverFwd_spine1.smi" "aim_splineDriverFwd_spine2.smi";
connectAttr "mxm_splineTangent_jSplineDriver2.o" "aim_splineDriverFwd_spine2.smat"
		;
connectAttr "pmx_worldPoint_jSplineDriver2.tmat" "aim_splineDriverFwd_spine2.imat"
		;
connectAttr "pmx_splineForward_jSplineDriver2.tmat" "aim_splineDriverFwd_spine2.pmat"
		;
connectAttr "mxm_splineDriver_spine2.o" "dmx_jointDriver_spine2.imat";
connectAttr "mxm_splineDriver_spine1.forwardOrient" "mxm_splineDriver_spine2.forwardOrient"
		;
connectAttr "mxm_splineDriver_spine2.forwardOrient" "mxm_splineDriver_spine2.i[0]"
		;
connectAttr "blendMatrix3.omat" "mxm_splineDriver_spine2.i[1]";
connectAttr "pmx_parentInverseRotate_spine2.tmat" "mxm_splineDriver_spine2.i[2]"
		;
connectAttr "imx_jointOrientInverse_spine2.omat" "mxm_splineDriver_spine2.i[3]";
connectAttr "splineDriver_spine2.pim" "pmx_parentInverseRotate_spine2.imat";
connectAttr "splineDriver_spine2.jo" "cmx_jointOrient_spine2.ir";
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
connectAttr "pmx_worldPoint_jSplineDriver3.tmat" "aim_splineDriverFwd_spine3.imat"
		;
connectAttr "aim_splineDriverFwd_spine2.smi" "aim_splineDriverFwd_spine3.smi";
connectAttr "mxm_splineTangent_jSplineDriver3.o" "aim_splineDriverFwd_spine3.smat"
		;
connectAttr "pmx_splineForward_jSplineDriver3.tmat" "aim_splineDriverFwd_spine3.pmat"
		;
connectAttr "mxm_splineDriver_spine2.forwardOrient" "mxm_splineDriver_spine3.forwardOrient"
		;
connectAttr "mxm_splineDriver_spine3.forwardOrient" "mxm_splineDriver_spine3.i[0]"
		;
connectAttr "blendMatrix4.omat" "mxm_splineDriver_spine3.i[1]";
connectAttr "pmx_parentInverseRotate_spine3.tmat" "mxm_splineDriver_spine3.i[2]"
		;
connectAttr "imx_jointOrientInverse_spine3.omat" "mxm_splineDriver_spine3.i[3]";
connectAttr "splineDriver_spine3.pim" "pmx_parentInverseRotate_spine3.imat";
connectAttr "splineDriver_spine3.jo" "cmx_jointOrient_spine3.ir";
connectAttr "cmx_jointOrient_spine3.omat" "imx_jointOrientInverse_spine3.imat";
connectAttr "mxm_splineDriver_spine3.o" "dmx_jointDriver_spine3.imat";
connectAttr "splineDriver_spine4.pim" "pmx_parentInverseRotate_spine4.imat";
connectAttr "splineDriver_spine4.jo" "cmx_jointOrient_spine4.ir";
connectAttr "cmx_jointOrient_spine4.omat" "imx_jointOrientInverse_spine4.imat";
connectAttr "dualSplineDriver2.wm" "pickMatrix14.imat";
connectAttr "pickMatrix14.tmat" "mxm_splineDriver_spine4.i[0]";
connectAttr "pmx_parentInverseRotate_spine4.tmat" "mxm_splineDriver_spine4.i[1]"
		;
connectAttr "imx_jointOrientInverse_spine4.omat" "mxm_splineDriver_spine4.i[2]";
connectAttr "mxm_splineDriver_spine4.o" "dmx_jointDriver_spine4.imat";
connectAttr "siso_primaryCurve_spine0.oc" "cRev_primaryCurve_spine0.ic";
connectAttr "aim_splineDriverFwd_spine0.tmat" "blendMatrix1.imat";
connectAttr "mxm_splineRevDriver_jRevSplineChain0.o" "blendMatrix1.tgt[0].tmat";
connectAttr "c_fkikBlend_spine0.ikFwdRevBlend" "blendMatrix1.tgt[0].wgt";
connectAttr "aim_splineDriverFwd_spine1.tmat" "blendMatrix2.imat";
connectAttr "mxm_splineRevDriver_jRevSplineChain1.o" "blendMatrix2.tgt[0].tmat";
connectAttr "c_fkikBlend_spine0.ikFwdRevBlend" "blendMatrix2.tgt[0].wgt";
connectAttr "aim_splineDriverFwd_spine2.tmat" "blendMatrix3.imat";
connectAttr "mxm_splineRevDriver_jRevSplineChain2.o" "blendMatrix3.tgt[0].tmat";
connectAttr "c_fkikBlend_spine0.ikFwdRevBlend" "blendMatrix3.tgt[0].wgt";
connectAttr "jRevSplineSolver3.r" "cmx_rot_jRevSplineSolver3.ir";
connectAttr "cmx_rot_jRevSplineSolver3.omat" "imx_rot_jRevSplineSolver3.imat";
connectAttr "imx_rot_jRevSplineSolver3.omat" "dmx_rotDriver_jRevSplineChain3.imat"
		;
connectAttr "jRevSplineSolver2.r" "cmx_rot_jRevSplineSolver2.ir";
connectAttr "cmx_rot_jRevSplineSolver2.omat" "imx_rot_jRevSplineSolver2.imat";
connectAttr "imx_rot_jRevSplineSolver2.omat" "dmx_rotDriver_jRevSplineChain2.imat"
		;
connectAttr "imx_rot_jRevSplineSolver1.omat" "dmx_rotDriver_jRevSplineChain1.imat"
		;
connectAttr "cmx_rot_jRevSplineSolver1.omat" "imx_rot_jRevSplineSolver1.imat";
connectAttr "jRevSplineSolver1.r" "cmx_rot_jRevSplineSolver1.ir";
connectAttr "imx_rot_jRevSplineSolver0.omat" "dmx_rotDriver_jRevSplineChain0.imat"
		;
connectAttr "cmx_rot_jRevSplineSolver0.omat" "imx_rot_jRevSplineSolver0.imat";
connectAttr "jRevSplineSolver0.r" "cmx_rot_jRevSplineSolver0.ir";
connectAttr "imx_jointOrient_jRevSplineChain0.omat" "mxm_opmReverseChain_jRevSplineChain0.i[0]"
		;
connectAttr "cmx_transOrient_jRevSplineSolver0.omat" "mxm_opmReverseChain_jRevSplineChain0.i[1]"
		;
connectAttr "jRevSplineSolver0.pm" "mxm_opmReverseChain_jRevSplineChain0.i[2]";
connectAttr "jRevSplineSolver0.t" "cmx_transOrient_jRevSplineSolver0.it";
connectAttr "jRevSplineSolver0.jo" "cmx_transOrient_jRevSplineSolver0.ir";
connectAttr "cmx_jointOrient_jRevSplineChain0.omat" "imx_jointOrient_jRevSplineChain0.imat"
		;
connectAttr "jRevSplineChain0.jo" "cmx_jointOrient_jRevSplineChain0.ir";
connectAttr "aim_splineDriverFwd_spine3.tmat" "blendMatrix4.imat";
connectAttr "mxm_splineRevDriver_jRevSplineChain3.o" "blendMatrix4.tgt[0].tmat";
connectAttr "c_fkikBlend_spine0.ikFwdRevBlend" "blendMatrix4.tgt[0].wgt";
connectAttr "cRev_tangentCurve_spine0.oc" "npoc_fwdSplineVector_jSplineDriver0.ic"
		;
connectAttr "dmx_worldMatrix_jRevSplineChain0.ot" "npoc_fwdSplineVector_jSplineDriver0.ip"
		;
connectAttr "jRevSplineChain0.wm" "dmx_worldMatrix_jRevSplineChain0.imat";
connectAttr "npoc_fwdSplineVector_jSplineDriver0.p" "cmx_dualSplineVector_jRevSplineChain0.it"
		;
connectAttr "npoc_fwdSplineVector_jSplineDriver1.p" "cmx_dualSplineVector_jRevSplineChain1.it"
		;
connectAttr "cRev_tangentCurve_spine0.oc" "npoc_fwdSplineVector_jSplineDriver1.ic"
		;
connectAttr "decomposeMatrix6.ot" "npoc_fwdSplineVector_jSplineDriver1.ip";
connectAttr "jRevSplineChain1.wm" "decomposeMatrix6.imat";
connectAttr "npoc_fwdSplineVector_jSplineDriver2.p" "cmx_dualSplineVector_jRevSplineChain2.it"
		;
connectAttr "cRev_tangentCurve_spine0.oc" "npoc_fwdSplineVector_jSplineDriver2.ic"
		;
connectAttr "decomposeMatrix7.ot" "npoc_fwdSplineVector_jSplineDriver2.ip";
connectAttr "jRevSplineChain2.wm" "decomposeMatrix7.imat";
connectAttr "npoc_fwdSplineVector_jSplineDriver3.p" "cmx_dualSplineVector_jRevSplineChain3.it"
		;
connectAttr "cRev_tangentCurve_spine0.oc" "npoc_fwdSplineVector_jSplineDriver3.ic"
		;
connectAttr "decomposeMatrix8.ot" "npoc_fwdSplineVector_jSplineDriver3.ip";
connectAttr "jRevSplineChain3.wm" "decomposeMatrix8.imat";
connectAttr "jRevSplineChain0.wm" "mxm_dualSplineRevOffsetTrans_spline0.i[0]";
connectAttr "pmx_translate_jSplineSolver0.tmat" "mxm_dualSplineRevOffsetTrans_spline0.i[1]"
		;
connectAttr "bmx_dualSplineRevOffsetTrans_spline0.omat" "dmx_dualSplineRevOffsetTrans_spline0.imat"
		;
connectAttr "cmx_downstreamTranslate_jRevSplineChain0.omat" "mxm_splineForward_jRevSplineChain0.i[0]"
		;
connectAttr "jRevSplineChain0.wm" "mxm_splineForward_jRevSplineChain0.i[1]";
connectAttr "pmx_worldPoint_jRevSplineChain0.tmat" "inverseMatrix7.imat";
connectAttr "jSplineSolver0.wim" "pmx_translate_jSplineSolver0.imat";
connectAttr "mxm_dualSplineRevOffsetTrans_spline0.o" "bmx_dualSplineRevOffsetTrans_spline0.tgt[0].tmat"
		;
connectAttr "c_fkikBlend_spine0.ikFwdRevBlend" "bmx_dualSplineRevOffsetTrans_spline0.tgt[0].wgt"
		;
connectAttr "siso_tangentCurve_spine0.oc" "cRev_tangentCurve_spine0.ic";
connectAttr "nurbs_dualSplineIK_spineShapeOrig.ws" "skinCluster1.ip[0].ig";
connectAttr "nurbs_dualSplineIK_spineShapeOrig.l" "skinCluster1.orggeom[0]";
connectAttr "bindPose1.msg" "skinCluster1.bp";
connectAttr "dualSplineDriver0.wm" "skinCluster1.ma[0]";
connectAttr "dualSplineDriver1.wm" "skinCluster1.ma[1]";
connectAttr "dualSplineDriver2.wm" "skinCluster1.ma[2]";
connectAttr "dualSplineDriver0.liw" "skinCluster1.lw[0]";
connectAttr "dualSplineDriver1.liw" "skinCluster1.lw[1]";
connectAttr "dualSplineDriver2.liw" "skinCluster1.lw[2]";
connectAttr "dualSplineDriver0.obcc" "skinCluster1.ifcl[0]";
connectAttr "dualSplineDriver1.obcc" "skinCluster1.ifcl[1]";
connectAttr "dualSplineDriver2.obcc" "skinCluster1.ifcl[2]";
connectAttr "c_gimbal_spline.msg" "bindPose1.m[0]";
connectAttr "dualSplineDriver0.msg" "bindPose1.m[1]";
connectAttr "dualSplineDriver1.msg" "bindPose1.m[2]";
connectAttr "dualSplineDriver2.msg" "bindPose1.m[3]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[0]" "bindPose1.p[2]";
connectAttr "bindPose1.m[0]" "bindPose1.p[3]";
connectAttr "dualSplineDriver0.bps" "bindPose1.wm[1]";
connectAttr "dualSplineDriver1.bps" "bindPose1.wm[2]";
connectAttr "dualSplineDriver2.bps" "bindPose1.wm[3]";
connectAttr "pmx_worldPoint_jRevSplineChain0.tmat" "aim_splineDriverRev_spine0.imat"
		;
connectAttr "pmx_splineForward_jRevSplineChain0.tmat" "aim_splineDriverRev_spine0.pmat"
		;
connectAttr "mxm_splineTangent_jRevSplineChain0.o" "aim_splineDriverRev_spine0.smat"
		;
connectAttr "aim_splineDriverFwd_spine0.smi" "aim_splineDriverRev_spine0.smi";
connectAttr "pmx_worldPoint_jRevSplineChain1.tmat" "aim_splineDriverRev_spine1.imat"
		;
connectAttr "pmx_splineForward_jRevSplineChain1.tmat" "aim_splineDriverRev_spine1.pmat"
		;
connectAttr "mxm_splineTangent_jRevSplineChain1.o" "aim_splineDriverRev_spine1.smat"
		;
connectAttr "aim_splineDriverRev_spine0.smi" "aim_splineDriverRev_spine1.smi";
connectAttr "pmx_worldPoint_jRevSplineChain2.tmat" "aim_splineDriverRev_spine2.imat"
		;
connectAttr "pmx_splineForward_jRevSplineChain2.tmat" "aim_splineDriverRev_spine2.pmat"
		;
connectAttr "mxm_splineTangent_jRevSplineChain2.o" "aim_splineDriverRev_spine2.smat"
		;
connectAttr "aim_splineDriverRev_spine1.smi" "aim_splineDriverRev_spine2.smi";
connectAttr "pmx_worldPoint_jRevSplineChain3.tmat" "aim_splineDriverRev_spine3.imat"
		;
connectAttr "pmx_splineForward_jRevSplineChain3.tmat" "aim_splineDriverRev_spine3.pmat"
		;
connectAttr "mxm_splineTangent_jRevSplineChain3.o" "aim_splineDriverRev_spine3.smat"
		;
connectAttr "aim_splineDriverRev_spine2.smi" "aim_splineDriverRev_spine3.smi";
connectAttr "jRevSplineChain1.t" "cmx_downstreamTranslate_jRevSplineChain0.it";
connectAttr "jRevSplineChain2.t" "cmx_downstreamTranslate_jRevSplineChain1.it";
connectAttr "jRevSplineChain3.t" "cmx_downstreamTranslate_jRevSplineChain2.it";
connectAttr "jRevSplineChain4.t" "cmx_downstreamTranslate_jRevSplineChain3.it";
connectAttr "jRevSplineChain0.wm" "pmx_worldPoint_jRevSplineChain0.imat";
connectAttr "jRevSplineChain1.wm" "pmx_worldPoint_jRevSplineChain1.imat";
connectAttr "jRevSplineChain2.wm" "pmx_worldPoint_jRevSplineChain2.imat";
connectAttr "jRevSplineChain3.wm" "pmx_worldPoint_jRevSplineChain3.imat";
connectAttr "cmx_downstreamTranslate_jRevSplineChain1.omat" "mxm_splineForward_jRevSplineChain1.i[0]"
		;
connectAttr "jRevSplineChain1.wm" "mxm_splineForward_jRevSplineChain1.i[1]";
connectAttr "cmx_downstreamTranslate_jRevSplineChain2.omat" "mxm_splineForward_jRevSplineChain2.i[0]"
		;
connectAttr "jRevSplineChain2.wm" "mxm_splineForward_jRevSplineChain2.i[1]";
connectAttr "cmx_downstreamTranslate_jRevSplineChain3.omat" "mxm_splineForward_jRevSplineChain3.i[0]"
		;
connectAttr "jRevSplineChain3.wm" "mxm_splineForward_jRevSplineChain3.i[1]";
connectAttr "pmx_worldPoint_jRevSplineChain1.tmat" "inverseMatrix8.imat";
connectAttr "pmx_worldPoint_jRevSplineChain2.tmat" "inverseMatrix9.imat";
connectAttr "pmx_worldPoint_jRevSplineChain3.tmat" "inverseMatrix10.imat";
connectAttr "inverseMatrix7.omat" "mxm_splineTangent_jRevSplineChain0.i[0]";
connectAttr "cmx_dualSplineVector_jRevSplineChain0.omat" "mxm_splineTangent_jRevSplineChain0.i[1]"
		;
connectAttr "pmx_worldPoint_jRevSplineChain0.tmat" "mxm_splineTangent_jRevSplineChain0.i[2]"
		;
connectAttr "mxm_splineForward_jRevSplineChain0.o" "pmx_splineForward_jRevSplineChain0.imat"
		;
connectAttr "inverseMatrix8.omat" "mxm_splineTangent_jRevSplineChain1.i[0]";
connectAttr "cmx_dualSplineVector_jRevSplineChain1.omat" "mxm_splineTangent_jRevSplineChain1.i[1]"
		;
connectAttr "pmx_worldPoint_jRevSplineChain1.tmat" "mxm_splineTangent_jRevSplineChain1.i[2]"
		;
connectAttr "mxm_splineForward_jRevSplineChain1.o" "pmx_splineForward_jRevSplineChain1.imat"
		;
connectAttr "inverseMatrix9.omat" "mxm_splineTangent_jRevSplineChain2.i[0]";
connectAttr "cmx_dualSplineVector_jRevSplineChain2.omat" "mxm_splineTangent_jRevSplineChain2.i[1]"
		;
connectAttr "pmx_worldPoint_jRevSplineChain2.tmat" "mxm_splineTangent_jRevSplineChain2.i[2]"
		;
connectAttr "mxm_splineForward_jRevSplineChain2.o" "pmx_splineForward_jRevSplineChain2.imat"
		;
connectAttr "mxm_splineForward_jRevSplineChain3.o" "pmx_splineForward_jRevSplineChain3.imat"
		;
connectAttr "inverseMatrix10.omat" "mxm_splineTangent_jRevSplineChain3.i[0]";
connectAttr "cmx_dualSplineVector_jRevSplineChain3.omat" "mxm_splineTangent_jRevSplineChain3.i[1]"
		;
connectAttr "pmx_worldPoint_jRevSplineChain3.tmat" "mxm_splineTangent_jRevSplineChain3.i[2]"
		;
connectAttr "jRevSplineChain0.s" "cmx_scale_jRevSplineChain0.is";
connectAttr "mxm_opmReverseChain_jRevSplineChain0.o" "pmx_opmReverseChainNoScale_jRevSplineChain0.imat"
		;
connectAttr "jRevSplineChain1.s" "cmx_scale_jRevSplineChain1.is";
connectAttr "jRevSplineChain2.s" "cmx_scale_jRevSplineChain2.is";
connectAttr "jRevSplineChain3.s" "cmx_scale_jRevSplineChain3.is";
connectAttr "aim_splineDriverRev_spine0.tmat" "mxm_splineRevDriver_jRevSplineChain0.i[0]"
		;
connectAttr "cmx_scale_jRevSplineChain0.omat" "mxm_splineRevDriver_jRevSplineChain0.i[1]"
		;
connectAttr "aim_splineDriverRev_spine1.tmat" "mxm_splineRevDriver_jRevSplineChain1.i[0]"
		;
connectAttr "cmx_scale_jRevSplineChain1.omat" "mxm_splineRevDriver_jRevSplineChain1.i[1]"
		;
connectAttr "aim_splineDriverRev_spine2.tmat" "mxm_splineRevDriver_jRevSplineChain2.i[0]"
		;
connectAttr "cmx_scale_jRevSplineChain2.omat" "mxm_splineRevDriver_jRevSplineChain2.i[1]"
		;
connectAttr "aim_splineDriverRev_spine3.tmat" "mxm_splineRevDriver_jRevSplineChain3.i[0]"
		;
connectAttr "cmx_scale_jRevSplineChain3.omat" "mxm_splineRevDriver_jRevSplineChain3.i[1]"
		;
connectAttr "siso_primaryCurve_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "cmx_downstreamTranslate_jSplineSolver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "cmx_dualSplineVector_jRevSplineChain1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "dmx_jointDriver_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "pmx_worldPoint_jRevSplineChain1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "dmx_jointDriver_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr "mxm_splineDriver_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "imx_jointOrientInverse_spine4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "g_dualSplineIK_spine.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "g_utilityCurves.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn";
connectAttr "inverseMatrix8.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn";
connectAttr "mxm_splineDriver_spine4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "cmx_dualSplineVector_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "blendMatrix3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn";
connectAttr "pickMatrix14.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn";
connectAttr "cmx_scale_jRevSplineChain1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn"
		;
connectAttr "npoc_fwdSplineVector_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn"
		;
connectAttr "aim_splineDriverRev_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn"
		;
connectAttr "cmx_scale_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn"
		;
connectAttr "aim_splineDriverRev_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn"
		;
connectAttr "g_rigLogic.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn";
connectAttr "imx_worldPointInverse_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[21].dn"
		;
connectAttr "mxm_splineRevDriver_jRevSplineChain3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[22].dn"
		;
connectAttr "curve_dualSplineIK_reverse.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[23].dn"
		;
connectAttr "mxm_splineForward_jRevSplineChain2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[24].dn"
		;
connectAttr "pmx_worldPoint_jRevSplineChain2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[25].dn"
		;
connectAttr "aim_splineDriverFwd_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[26].dn"
		;
connectAttr "mxm_splineTangent_jRevSplineChain3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[27].dn"
		;
connectAttr "g_dualSplineIK.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[28].dn";
connectAttr "dualSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[29].dn"
		;
connectAttr "dmx_worldMatrix_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[30].dn"
		;
connectAttr "mxm_splineTangent_jRevSplineChain1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[31].dn"
		;
connectAttr "pmx_worldPoint_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[32].dn"
		;
connectAttr "npoc_dualSplineVector_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[33].dn"
		;
connectAttr "jRevSplineChain2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[34].dn"
		;
connectAttr "dmx_jointDriver_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[35].dn"
		;
connectAttr "inverseMatrix7.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[36].dn";
connectAttr "jSplineSolver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[37].dn";
connectAttr "mxm_splineForward_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[38].dn"
		;
connectAttr "nurbs_dualSplineIK_spineShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[39].dn"
		;
connectAttr "mxm_splineTangent_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[40].dn"
		;
connectAttr "splineDriver_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[41].dn"
		;
connectAttr "mxm_dualSplineRevOffsetTrans_spline0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[42].dn"
		;
connectAttr "dmx_jointDriver_spine4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[43].dn"
		;
connectAttr "mxm_splineDriver_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[44].dn"
		;
connectAttr "aim_splineDriverRev_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[45].dn"
		;
connectAttr "mxm_splineTangent_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[46].dn"
		;
connectAttr "blendMatrix2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[47].dn";
connectAttr "mxm_splineForward_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[48].dn"
		;
connectAttr "inverseMatrix10.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[49].dn"
		;
connectAttr "npoc_dualSplineVector_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[50].dn"
		;
connectAttr "cmx_downstreamTranslate_jSplineSolver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[51].dn"
		;
connectAttr "mxm_splineForward_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[52].dn"
		;
connectAttr "jRevSplineChain3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[53].dn"
		;
connectAttr "mxm_splineTangent_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[54].dn"
		;
connectAttr "splineDriver_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[55].dn"
		;
connectAttr "jSplineSolver4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[56].dn";
connectAttr "decomposeMatrix8.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[57].dn"
		;
connectAttr "blendMatrix4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[58].dn";
connectAttr "jRevSplineChain1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[59].dn"
		;
connectAttr "cmx_downstreamTranslate_jRevSplineChain3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[60].dn"
		;
connectAttr "splineDriver_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[61].dn"
		;
connectAttr "inverseMatrix9.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[62].dn";
connectAttr "npoc_dualSplineVector_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[63].dn"
		;
connectAttr "decomposeMatrix6.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[64].dn"
		;
connectAttr "npoc_dualSplineVector_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[65].dn"
		;
connectAttr "cmx_dualSplineVector_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[66].dn"
		;
connectAttr "imx_worldPointInverse_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[67].dn"
		;
connectAttr "decomposeMatrix7.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[68].dn"
		;
connectAttr "mxm_splineDriver_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[69].dn"
		;
connectAttr "pmx_splineForward_jRevSplineChain2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[70].dn"
		;
connectAttr "blendMatrix1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[71].dn";
connectAttr "c_fkikBlend_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[72].dn"
		;
connectAttr "pmx_parentInverseRotate_spine4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[73].dn"
		;
connectAttr "pmx_splineForward_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[74].dn"
		;
connectAttr "pmx_worldPoint_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[75].dn"
		;
connectAttr "jSplineSolver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[76].dn";
connectAttr "curve_primaryCurveRev_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[77].dn"
		;
connectAttr "aim_splineDriverRev_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[78].dn"
		;
connectAttr "dualSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[79].dn"
		;
connectAttr "cmx_jointOrient_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[80].dn"
		;
connectAttr "cmx_jointOrient_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[81].dn"
		;
connectAttr "locator3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[82].dn";
connectAttr "mxm_splineForward_jRevSplineChain1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[83].dn"
		;
connectAttr "cmx_scale_jRevSplineChain3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[84].dn"
		;
connectAttr "dmx_dualSplineRevOffsetTrans_spline0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[85].dn"
		;
connectAttr "mxm_splineForward_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[86].dn"
		;
connectAttr "splineDriver_spine4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[87].dn"
		;
connectAttr "mxm_splineRevDriver_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[88].dn"
		;
connectAttr "splineDriver_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[89].dn"
		;
connectAttr "cmx_downstreamTranslate_jSplineSolver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[90].dn"
		;
connectAttr "pmx_splineForward_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[91].dn"
		;
connectAttr "mxm_splineTangent_jRevSplineChain2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[92].dn"
		;
connectAttr "npoc_fwdSplineVector_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[93].dn"
		;
connectAttr "cmx_jointOrient_spine4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[94].dn"
		;
connectAttr "dmx_jointDriver_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[95].dn"
		;
connectAttr "imx_jointOrientInverse_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[96].dn"
		;
connectAttr "bmx_dualSplineRevOffsetTrans_spline0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[97].dn"
		;
connectAttr "cRev_tangentCurve_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[98].dn"
		;
connectAttr "pmx_worldPoint_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[99].dn"
		;
connectAttr "aim_splineDriverFwd_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[100].dn"
		;
connectAttr "cmx_jointOrient_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[101].dn"
		;
connectAttr "pmx_splineForward_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[102].dn"
		;
connectAttr "cRev_primaryCurve_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[103].dn"
		;
connectAttr "mxm_splineTangent_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[104].dn"
		;
connectAttr "cmx_downstreamTranslate_jRevSplineChain2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[105].dn"
		;
connectAttr "cmx_dualSplineVector_jRevSplineChain2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[106].dn"
		;
connectAttr "pmx_parentInverseRotate_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[107].dn"
		;
connectAttr "cmx_scale_jRevSplineChain2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[108].dn"
		;
connectAttr "mxm_splineTangent_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[109].dn"
		;
connectAttr "pmx_splineForward_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[110].dn"
		;
connectAttr "jRevSplineChain4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[111].dn"
		;
connectAttr "mxm_splineRevDriver_jRevSplineChain1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[112].dn"
		;
connectAttr "jSplineSolver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[113].dn"
		;
connectAttr "cmx_dualSplineVector_jRevSplineChain3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[114].dn"
		;
connectAttr "npoc_fwdSplineVector_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[115].dn"
		;
connectAttr "aim_splineDriverFwd_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[116].dn"
		;
connectAttr "pmx_worldPoint_jRevSplineChain3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[117].dn"
		;
connectAttr "cmx_jointOrient_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[118].dn"
		;
connectAttr "pmx_splineForward_jRevSplineChain3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[119].dn"
		;
connectAttr "dmx_worldMatrix_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[120].dn"
		;
connectAttr "dmx_worldMatrix_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[121].dn"
		;
connectAttr "imx_worldPointInverse_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[122].dn"
		;
connectAttr "imx_worldPointInverse_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[123].dn"
		;
connectAttr "cmx_dualSplineVector_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[124].dn"
		;
connectAttr "imx_jointOrientInverse_spine1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[125].dn"
		;
connectAttr "aim_splineDriverFwd_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[126].dn"
		;
connectAttr "dmx_worldMatrix_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[127].dn"
		;
connectAttr "cmx_dualSplineVector_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[128].dn"
		;
connectAttr "dualSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[129].dn"
		;
connectAttr "cmx_downstreamTranslate_jRevSplineChain1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[130].dn"
		;
connectAttr "dmx_worldMatrix_jSplineDriver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[131].dn"
		;
connectAttr "pmx_worldPoint_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[132].dn"
		;
connectAttr "g_controls.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[133].dn";
connectAttr "imx_jointOrientInverse_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[134].dn"
		;
connectAttr "pmx_parentInverseRotate_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[135].dn"
		;
connectAttr "mxm_splineForward_jSplineDriver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[136].dn"
		;
connectAttr "pmx_worldPoint_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[137].dn"
		;
connectAttr "pmx_splineForward_jRevSplineChain1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[138].dn"
		;
connectAttr "siso_tangentCurve_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[139].dn"
		;
connectAttr "mxm_splineForward_jRevSplineChain3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[140].dn"
		;
connectAttr "mxm_splineDriver_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[141].dn"
		;
connectAttr "cmx_downstreamTranslate_jSplineSolver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[142].dn"
		;
connectAttr "cmx_downstreamTranslate_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[143].dn"
		;
connectAttr "imx_jointOrientInverse_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[144].dn"
		;
connectAttr "mxm_splineRevDriver_jRevSplineChain2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[145].dn"
		;
connectAttr "pmx_parentInverseRotate_spine3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[146].dn"
		;
connectAttr "npoc_fwdSplineVector_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[147].dn"
		;
connectAttr "jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[148].dn"
		;
connectAttr "cmx_dualSplineVector_jSplineDriver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[149].dn"
		;
connectAttr "jSplineSolver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[150].dn"
		;
connectAttr "pmx_parentInverseRotate_spine2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[151].dn"
		;
connectAttr "pmx_splineForward_jSplineDriver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[152].dn"
		;
connectAttr "pmx_translate_jSplineSolver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[153].dn"
		;
connectAttr "dmx_rotDriver_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[0].dn"
		;
connectAttr "jRevSplineChain3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[1].dn"
		;
connectAttr "siso_primaryCurve_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[2].dn"
		;
connectAttr "cmx_rot_jRevSplineSolver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[3].dn"
		;
connectAttr "imx_jointOrient_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[4].dn"
		;
connectAttr "cmx_rot_jRevSplineSolver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[5].dn"
		;
connectAttr "dmx_rotDriver_jRevSplineChain2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[6].dn"
		;
connectAttr "jRevSplineSolver4.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[7].dn"
		;
connectAttr "jRevSplineChain4.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[8].dn"
		;
connectAttr "jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[9].dn"
		;
connectAttr "cmx_rot_jRevSplineSolver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[10].dn"
		;
connectAttr "dmx_rotDriver_jRevSplineChain3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[11].dn"
		;
connectAttr "jRevSplineSolver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[12].dn"
		;
connectAttr "imx_rot_jRevSplineSolver3.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[13].dn"
		;
connectAttr "jRevSplineChain2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[14].dn"
		;
connectAttr "imx_rot_jRevSplineSolver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[15].dn"
		;
connectAttr "jRevSplineSolver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[16].dn"
		;
connectAttr "jRevSplineChain1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[17].dn"
		;
connectAttr "pmx_opmReverseChainNoScale_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[18].dn"
		;
connectAttr "imx_rot_jRevSplineSolver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[19].dn"
		;
connectAttr "curve_primaryCurveRev_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[20].dn"
		;
connectAttr "dmx_rotDriver_jRevSplineChain1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[21].dn"
		;
connectAttr "mxm_opmReverseChain_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[22].dn"
		;
connectAttr "cRev_primaryCurve_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[23].dn"
		;
connectAttr "imx_rot_jRevSplineSolver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[24].dn"
		;
connectAttr "cmx_rot_jRevSplineSolver2.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[25].dn"
		;
connectAttr "cmx_jointOrient_jRevSplineChain0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[26].dn"
		;
connectAttr "cmx_transOrient_jRevSplineSolver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[27].dn"
		;
connectAttr "jRevSplineSolver1.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[28].dn"
		;
connectAttr "jRevSplineSolver0.msg" "MayaNodeEditorSavedTabsInfo.tgi[1].ni[29].dn"
		;
connectAttr "ikh_dualSplineIK_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[0].dn"
		;
connectAttr "siso_primaryCurve_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[1].dn"
		;
connectAttr "curve_primaryCurveRev_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[2].dn"
		;
connectAttr "cRev_primaryCurve_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[3].dn"
		;
connectAttr "ike_dualSplineIK_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[4].dn"
		;
connectAttr "ikh_dualSplineRevIK_spine0.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[5].dn"
		;
connectAttr "effector1.msg" "MayaNodeEditorSavedTabsInfo.tgi[2].ni[6].dn";
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
connectAttr "imx_rot_jRevSplineSolver3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "imx_rot_jRevSplineSolver2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "imx_rot_jRevSplineSolver1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "imx_rot_jRevSplineSolver0.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mxm_opmReverseChain_jRevSplineChain0.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "imx_jointOrient_jRevSplineChain0.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_dualSplineRevOffsetTrans_spline0.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineForward_jRevSplineChain0.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "inverseMatrix7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mxm_splineForward_jRevSplineChain1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineForward_jRevSplineChain2.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineForward_jRevSplineChain3.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "inverseMatrix8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "inverseMatrix9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "inverseMatrix10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mxm_splineTangent_jRevSplineChain0.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineTangent_jRevSplineChain1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineTangent_jRevSplineChain2.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineTangent_jRevSplineChain3.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineRevDriver_jRevSplineChain0.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineRevDriver_jRevSplineChain1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineRevDriver_jRevSplineChain2.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "mxm_splineRevDriver_jRevSplineChain3.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "nurbs_dualSplineIK_spineShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "ikSplineSolver.msg" ":ikSystem.sol" -na;
// End of dualSplineIK_dev.ma
