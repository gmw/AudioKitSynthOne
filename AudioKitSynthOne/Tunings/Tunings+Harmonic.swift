//
//  Tunings+Harmonic.swift
//  AudioKitSynthOne
//
//  Created by AudioKit Contributors on 5/20/18.
//  Copyright © 2018 AudioKit. All rights reserved.
//

import Foundation

extension Tunings {

    // pitch is log2(frequency)
    public class func approximateHarmonicFromPitch(_ pitch: Double) -> Int {
        let harmonics = [
            "0.000": 1, "0.001": 1_025, "0.002": 2_051, "0.003": 513, "0.004": 1_027,
            "0.005": 2_055, "0.006": 257, "0.007": 1_029, "0.008": 515, "0.009": 2_061,
            "0.010": 1_031, "0.011": 129, "0.012": 2_065, "0.013": 1_033, "0.014": 517,
            "0.015": 1_035, "0.016": 2_071, "0.017": 259, "0.018": 1_037, "0.019": 2_075,
            "0.020": 519, "0.021": 1_039, "0.022": 65, "0.023": 2_081, "0.024": 1_041,
            "0.025": 521, "0.026": 2_085, "0.027": 1_043, "0.028": 261, "0.029": 1_045,
            "0.030": 2_091, "0.031": 523, "0.032": 1_047, "0.033": 131, "0.034": 2_097,
            "0.035": 1_049, "0.036": 525, "0.037": 2_101, "0.038": 1_051, "0.039": 263,
            "0.040": 1_053, "0.041": 2_107, "0.042": 527, "0.043": 1_055, "0.044": 33,
            "0.045": 2_113, "0.046": 1_057, "0.047": 529, "0.048": 1_059, "0.049": 2_119,
            "0.050": 265, "0.051": 1_061, "0.052": 2_123, "0.053": 531, "0.054": 1_063,
            "0.055": 133, "0.056": 2_129, "0.057": 1_065, "0.058": 533, "0.059": 1_067,
            "0.060": 2_135, "0.061": 267, "0.062": 1_069, "0.063": 535, "0.064": 2_141,
            "0.065": 1_071, "0.066": 67, "0.067": 1_073, "0.068": 2_147, "0.069": 537,
            "0.070": 1_075, "0.071": 269, "0.072": 2_153, "0.073": 1_077, "0.074": 539,
            "0.075": 1_079, "0.076": 2_159, "0.077": 135, "0.078": 1_081, "0.079": 541,
            "0.080": 2_165, "0.081": 1_083, "0.082": 271, "0.083": 1_085, "0.084": 2_171,
            "0.085": 543, "0.086": 1_087, "0.087": 17, "0.088": 2_177, "0.089": 1_089,
            "0.090": 545, "0.091": 1_091, "0.092": 2_183, "0.093": 273, "0.094": 1_093,
            "0.095": 547, "0.096": 2_189, "0.097": 1_095, "0.098": 137, "0.099": 1_097,
            "0.100": 2_195, "0.101": 549, "0.102": 1_099, "0.103": 275, "0.104": 2_201,
            "0.105": 1_101, "0.106": 551, "0.107": 1_103, "0.108": 2_207, "0.109": 69,
            "0.110": 1_105, "0.111": 553, "0.112": 1_107, "0.113": 2_215, "0.114": 277,
            "0.115": 1_109, "0.116": 555, "0.117": 2_221, "0.118": 1_111, "0.119": 139,
            "0.120": 1_113, "0.121": 2_227, "0.122": 557, "0.123": 1_115, "0.124": 279,
            "0.125": 1_117, "0.126": 2_235, "0.127": 559, "0.128": 1_119, "0.129": 35,
            "0.130": 2_241, "0.131": 1_121, "0.132": 561, "0.133": 1_123, "0.134": 281,
            "0.135": 2_249, "0.136": 1_125, "0.137": 563, "0.138": 1_127, "0.139": 2_255,
            "0.140": 141, "0.141": 1_129, "0.142": 565, "0.143": 1_131, "0.144": 2_263,
            "0.145": 283, "0.146": 1_133, "0.147": 567, "0.148": 1_135, "0.149": 2_271,
            "0.150": 71, "0.151": 1_137, "0.152": 569, "0.153": 2_277, "0.154": 1_139,
            "0.155": 285, "0.156": 1_141, "0.157": 571, "0.158": 2_285, "0.159": 1_143,
            "0.160": 143, "0.161": 1_145, "0.162": 573, "0.163": 2_293, "0.164": 1_147,
            "0.165": 287, "0.166": 1_149, "0.167": 575, "0.168": 2_301, "0.169": 1_151,
            "0.170": 9, "0.171": 1_153, "0.172": 577, "0.173": 2_309, "0.174": 1_155,
            "0.175": 289, "0.176": 1_157, "0.177": 579, "0.178": 2_317, "0.179": 1_159,
            "0.180": 145, "0.181": 1_161, "0.182": 581, "0.183": 2_325, "0.184": 1_163,
            "0.185": 291, "0.186": 1_165, "0.187": 583, "0.188": 2_333, "0.189": 1_167,
            "0.190": 73, "0.191": 1_169, "0.192": 585, "0.193": 2_341, "0.194": 1_171,
            "0.195": 293, "0.196": 1_173, "0.197": 587, "0.198": 1_175, "0.199": 2_351,
            "0.200": 147, "0.201": 1_177, "0.202": 589, "0.203": 1_179, "0.204": 2_359,
            "0.205": 295, "0.206": 1_181, "0.207": 591, "0.208": 1_183, "0.209": 37,
            "0.210": 2_369, "0.211": 1_185, "0.212": 593, "0.213": 1_187, "0.214": 297,
            "0.215": 2_377, "0.216": 1_189, "0.217": 595, "0.218": 1_191, "0.219": 149,
            "0.220": 1_193, "0.221": 2_387, "0.222": 597, "0.223": 1_195, "0.224": 299,
            "0.225": 1_197, "0.226": 599, "0.227": 2_397, "0.228": 1_199, "0.229": 75,
            "0.230": 1_201, "0.231": 601, "0.232": 1_203, "0.233": 2_407, "0.234": 301,
            "0.235": 1_205, "0.236": 603, "0.237": 1_207, "0.238": 151, "0.239": 2_417,
            "0.240": 1_209, "0.241": 605, "0.242": 1_211, "0.243": 303, "0.244": 1_213,
            "0.245": 2_427, "0.246": 607, "0.247": 1_215, "0.248": 19, "0.249": 1_217,
            "0.250": 609, "0.251": 1_219, "0.252": 2_439, "0.253": 305, "0.254": 1_221,
            "0.255": 611, "0.256": 1_223, "0.257": 153, "0.258": 2_449, "0.259": 1_225,
            "0.260": 613, "0.261": 1_227, "0.262": 307, "0.263": 1_229, "0.264": 615,
            "0.265": 2_461, "0.266": 1_231, "0.267": 77, "0.268": 1_233, "0.269": 617,
            "0.270": 1_235, "0.271": 309, "0.272": 2_473, "0.273": 1_237, "0.274": 619,
            "0.275": 1_239, "0.276": 155, "0.277": 1_241, "0.278": 621, "0.279": 2_485,
            "0.280": 1_243, "0.281": 311, "0.282": 1_245, "0.283": 623, "0.284": 1_247,
            "0.285": 39, "0.286": 2_497, "0.287": 1_249, "0.288": 625, "0.289": 1_251,
            "0.290": 313, "0.291": 1_253, "0.292": 627, "0.293": 1_255, "0.294": 2_511,
            "0.295": 157, "0.296": 1_257, "0.297": 629, "0.298": 1_259, "0.299": 315,
            "0.300": 1_261, "0.301": 631, "0.302": 2_525, "0.303": 1_263, "0.304": 79,
            "0.305": 1_265, "0.306": 633, "0.307": 1_267, "0.308": 317, "0.309": 1_269,
            "0.310": 2_539, "0.311": 635, "0.312": 1_271, "0.313": 159, "0.314": 1_273,
            "0.315": 637, "0.316": 1_275, "0.317": 319, "0.318": 2_553, "0.319": 1_277,
            "0.320": 639, "0.321": 1_279, "0.322": 5, "0.323": 1_281, "0.324": 641,
            "0.325": 1_283, "0.326": 321, "0.327": 2_569, "0.328": 1_285, "0.329": 643,
            "0.330": 1_287, "0.331": 161, "0.332": 1_289, "0.333": 645, "0.334": 1_291,
            "0.335": 323, "0.336": 2_585, "0.337": 1_293, "0.338": 647, "0.339": 1_295,
            "0.340": 81, "0.341": 1_297, "0.342": 649, "0.343": 1_299, "0.344": 325,
            "0.345": 1_301, "0.346": 2_603, "0.347": 651, "0.348": 1_303, "0.349": 163,
            "0.350": 1_305, "0.351": 653, "0.352": 1_307, "0.353": 327, "0.354": 1_309,
            "0.355": 655, "0.356": 1_311, "0.357": 2_623, "0.358": 41, "0.359": 1_313,
            "0.360": 657, "0.361": 1_315, "0.362": 329, "0.363": 1_317, "0.364": 659,
            "0.365": 1_319, "0.366": 165, "0.367": 1_321, "0.368": 2_643, "0.369": 661,
            "0.370": 1_323, "0.371": 331, "0.372": 1_325, "0.373": 663, "0.374": 1_327,
            "0.375": 83, "0.376": 1_329, "0.377": 665, "0.378": 1_331, "0.379": 333,
            "0.380": 1_333, "0.381": 2_667, "0.382": 667, "0.383": 1_335, "0.384": 167,
            "0.385": 1_337, "0.386": 669, "0.387": 1_339, "0.388": 335, "0.389": 1_341,
            "0.390": 671, "0.391": 1_343, "0.392": 21, "0.393": 1_345, "0.394": 673,
            "0.395": 2_693, "0.396": 1_347, "0.397": 337, "0.398": 1_349, "0.399": 675,
            "0.400": 1_351, "0.401": 169, "0.402": 1_353, "0.403": 677, "0.404": 1_355,
            "0.405": 339, "0.406": 1_357, "0.407": 679, "0.408": 1_359, "0.409": 85,
            "0.410": 1_361, "0.411": 2_723, "0.412": 681, "0.413": 1_363, "0.414": 341,
            "0.415": 1_365, "0.416": 683, "0.417": 1_367, "0.418": 171, "0.419": 1_369,
            "0.420": 685, "0.421": 1_371, "0.422": 343, "0.423": 1_373, "0.424": 687,
            "0.425": 1_375, "0.426": 43, "0.427": 1_377, "0.428": 689, "0.429": 1_379,
            "0.430": 345, "0.431": 1_381, "0.432": 2_763, "0.433": 691, "0.434": 1_383,
            "0.435": 173, "0.436": 1_385, "0.437": 693, "0.438": 1_387, "0.439": 347,
            "0.440": 1_389, "0.441": 695, "0.442": 1_391, "0.443": 87, "0.444": 1_393,
            "0.445": 697, "0.446": 1_395, "0.447": 349, "0.448": 1_397, "0.449": 699,
            "0.450": 1_399, "0.451": 175, "0.452": 1_401, "0.453": 701, "0.454": 1_403,
            "0.455": 351, "0.456": 1_405, "0.457": 703, "0.458": 1_407, "0.459": 11,
            "0.460": 1_409, "0.461": 705, "0.462": 2_821, "0.463": 1_411, "0.464": 353,
            "0.465": 1_413, "0.466": 707, "0.467": 1_415, "0.468": 177, "0.469": 1_417,
            "0.470": 709, "0.471": 1_419, "0.472": 355, "0.473": 1_421, "0.474": 711,
            "0.475": 1_423, "0.476": 89, "0.477": 1_425, "0.478": 713, "0.479": 1_427,
            "0.480": 357, "0.481": 1_429, "0.482": 715, "0.483": 1_431, "0.484": 179,
            "0.485": 1_433, "0.486": 717, "0.487": 1_435, "0.488": 359, "0.489": 1_437,
            "0.490": 719, "0.491": 1_439, "0.492": 45, "0.493": 1_441, "0.494": 721,
            "0.495": 1_443, "0.496": 361, "0.497": 1_445, "0.498": 723, "0.499": 1_447,
            "0.500": 181, "0.501": 1_449, "0.502": 725, "0.503": 1_451, "0.504": 363,
            "0.505": 1_453, "0.506": 727, "0.507": 1_455, "0.508": 91, "0.509": 1_457,
            "0.510": 729, "0.511": 1_459, "0.512": 365, "0.513": 1_461, "0.514": 731,
            "0.515": 1_463, "0.516": 183, "0.517": 1_465, "0.518": 733, "0.519": 1_467,
            "0.520": 367, "0.521": 1_469, "0.522": 735, "0.523": 1_471, "0.524": 23,
            "0.525": 1_473, "0.526": 737, "0.527": 369, "0.528": 1_477, "0.529": 739,
            "0.530": 1_479, "0.531": 185, "0.532": 1_481, "0.533": 741, "0.534": 1_483,
            "0.535": 371, "0.536": 1_485, "0.537": 743, "0.538": 1_487, "0.539": 93,
            "0.540": 1_489, "0.541": 745, "0.542": 1_491, "0.543": 373, "0.544": 1_493,
            "0.545": 747, "0.546": 1_495, "0.547": 187, "0.548": 1_497, "0.549": 749,
            "0.550": 1_499, "0.551": 375, "0.552": 1_501, "0.553": 751, "0.554": 1_503,
            "0.555": 47, "0.556": 1_505, "0.557": 753, "0.558": 377, "0.559": 1_509,
            "0.560": 755, "0.561": 1_511, "0.562": 189, "0.563": 1_513, "0.564": 757,
            "0.565": 1_515, "0.566": 379, "0.567": 1_517, "0.568": 759, "0.569": 1_519,
            "0.570": 95, "0.571": 1_521, "0.572": 761, "0.573": 1_523, "0.574": 381,
            "0.575": 1_525, "0.576": 763, "0.577": 191, "0.578": 1_529, "0.579": 765,
            "0.580": 1_531, "0.581": 383, "0.582": 1_533, "0.583": 767, "0.584": 1_535,
            "0.585": 3, "0.586": 1_537, "0.587": 769, "0.588": 1_539, "0.589": 385,
            "0.590": 1_541, "0.591": 771, "0.592": 193, "0.593": 1_545, "0.594": 773,
            "0.595": 1_547, "0.596": 387, "0.597": 1_549, "0.598": 775, "0.599": 1_551,
            "0.600": 97, "0.601": 1_553, "0.602": 777, "0.603": 1_555, "0.604": 389,
            "0.605": 779, "0.606": 1_559, "0.607": 195, "0.608": 1_561, "0.609": 781,
            "0.610": 1_563, "0.611": 391, "0.612": 1_565, "0.613": 783, "0.614": 1_567,
            "0.615": 49, "0.616": 1_569, "0.617": 785, "0.618": 393, "0.619": 1_573,
            "0.620": 787, "0.621": 1_575, "0.622": 197, "0.623": 1_577, "0.624": 789,
            "0.625": 1_579, "0.626": 395, "0.627": 1_581, "0.628": 791, "0.629": 99,
            "0.630": 1_585, "0.631": 793, "0.632": 1_587, "0.633": 397, "0.634": 1_589,
            "0.635": 795, "0.636": 1_591, "0.637": 199, "0.638": 797, "0.639": 1_595,
            "0.640": 399, "0.641": 1_597, "0.642": 799, "0.643": 1_599, "0.644": 25,
            "0.645": 1_601, "0.646": 801, "0.647": 401, "0.648": 1_605, "0.649": 803,
            "0.650": 1_607, "0.651": 201, "0.652": 1_609, "0.653": 805, "0.654": 1_611,
            "0.655": 403, "0.656": 807, "0.657": 1_615, "0.658": 101, "0.659": 1_617,
            "0.660": 809, "0.661": 1_619, "0.662": 405, "0.663": 1_621, "0.664": 811,
            "0.665": 203, "0.666": 1_625, "0.667": 813, "0.668": 1_627, "0.669": 407,
            "0.670": 1_629, "0.671": 815, "0.672": 51, "0.673": 1_633, "0.674": 817,
            "0.675": 1_635, "0.676": 409, "0.677": 1_637, "0.678": 819, "0.679": 205,
            "0.680": 1_641, "0.681": 821, "0.682": 1_643, "0.683": 411, "0.684": 1_645,
            "0.685": 823, "0.686": 1_647, "0.687": 103, "0.688": 825, "0.689": 1_651,
            "0.690": 413, "0.691": 1_653, "0.692": 827, "0.693": 207, "0.694": 1_657,
            "0.695": 829, "0.696": 1_659, "0.697": 415, "0.698": 1_661, "0.699": 831,
            "0.700": 13, "0.701": 1_665, "0.702": 833, "0.703": 1_667, "0.704": 417,
            "0.705": 1_669, "0.706": 835, "0.707": 209, "0.708": 1_673, "0.709": 837,
            "0.710": 1_675, "0.711": 419, "0.712": 1_677, "0.713": 839, "0.714": 105,
            "0.715": 1_681, "0.716": 841, "0.717": 1_683, "0.718": 421, "0.719": 843,
            "0.720": 1_687, "0.721": 211, "0.722": 1_689, "0.723": 845, "0.724": 1_691,
            "0.725": 423, "0.726": 847, "0.727": 1_695, "0.728": 53, "0.729": 1_697,
            "0.730": 849, "0.731": 425, "0.732": 1_701, "0.733": 851, "0.734": 1_703,
            "0.735": 213, "0.736": 853, "0.737": 1_707, "0.738": 427, "0.739": 1_709,
            "0.740": 855, "0.741": 107, "0.742": 1_713, "0.743": 857, "0.744": 1_715,
            "0.745": 429, "0.746": 1_717, "0.747": 859, "0.748": 215, "0.749": 1_721,
            "0.750": 861, "0.751": 1_723, "0.752": 431, "0.753": 863, "0.754": 1_727,
            "0.755": 27, "0.756": 1_729, "0.757": 865, "0.758": 433, "0.759": 1_733,
            "0.760": 867, "0.761": 1_735, "0.762": 217, "0.763": 869, "0.764": 1_739,
            "0.765": 435, "0.766": 1_741, "0.767": 871, "0.768": 109, "0.769": 1_745,
            "0.770": 873, "0.771": 437, "0.772": 1_749, "0.773": 875, "0.774": 1_751,
            "0.775": 219, "0.776": 877, "0.777": 1_755, "0.778": 439, "0.779": 1_757,
            "0.780": 879, "0.781": 55, "0.782": 1_761, "0.783": 881, "0.784": 1_763,
            "0.785": 441, "0.786": 883, "0.787": 1_767, "0.788": 221, "0.789": 1_769,
            "0.790": 885, "0.791": 443, "0.792": 1_773, "0.793": 887, "0.794": 111,
            "0.795": 1_777, "0.796": 889, "0.797": 1_779, "0.798": 445, "0.799": 891,
            "0.800": 1_783, "0.801": 223, "0.802": 1_785, "0.803": 893, "0.804": 447,
            "0.805": 1_789, "0.806": 895, "0.807": 7, "0.808": 1_793, "0.809": 897,
            "0.810": 1_795, "0.811": 449, "0.812": 899, "0.813": 1_799, "0.814": 225,
            "0.815": 901, "0.816": 1_803, "0.817": 451, "0.818": 1_805, "0.819": 903,
            "0.820": 113, "0.821": 1_809, "0.822": 905, "0.823": 453, "0.824": 1_813,
            "0.825": 907, "0.826": 1_815, "0.827": 227, "0.828": 909, "0.829": 1_819,
            "0.830": 455, "0.831": 911, "0.832": 1_823, "0.833": 57, "0.834": 913,
            "0.835": 1_827, "0.836": 457, "0.837": 1_829, "0.838": 915, "0.839": 229,
            "0.840": 1_833, "0.841": 917, "0.842": 459, "0.843": 1_837, "0.844": 919,
            "0.845": 115, "0.846": 1_841, "0.847": 921, "0.848": 1_843, "0.849": 461,
            "0.850": 923, "0.851": 1_847, "0.852": 231, "0.853": 925, "0.854": 1_851,
            "0.855": 463, "0.856": 927, "0.857": 1_855, "0.858": 29, "0.859": 1_857,
            "0.860": 929, "0.861": 465, "0.862": 1_861, "0.863": 931, "0.864": 233,
            "0.865": 1_865, "0.866": 933, "0.867": 467, "0.868": 1_869, "0.869": 935,
            "0.870": 117, "0.871": 1_873, "0.872": 937, "0.873": 469, "0.874": 1_877,
            "0.875": 939, "0.876": 1_879, "0.877": 235, "0.878": 941, "0.879": 1_883,
            "0.880": 471, "0.881": 943, "0.882": 1_887, "0.883": 59, "0.884": 945,
            "0.885": 1_891, "0.886": 473, "0.887": 947, "0.888": 1_895, "0.889": 237,
            "0.890": 949, "0.891": 1_899, "0.892": 475, "0.893": 951, "0.894": 1_903,
            "0.895": 119, "0.896": 953, "0.897": 1_907, "0.898": 477, "0.899": 955,
            "0.900": 1_911, "0.901": 239, "0.902": 957, "0.903": 1_915, "0.904": 479,
            "0.905": 959, "0.906": 1_919, "0.907": 15, "0.908": 961, "0.909": 1_923,
            "0.910": 481, "0.911": 963, "0.912": 1_927, "0.913": 241, "0.914": 965,
            "0.915": 1_931, "0.916": 483, "0.917": 967, "0.918": 1_935, "0.919": 121,
            "0.920": 969, "0.921": 1_939, "0.922": 485, "0.923": 971, "0.924": 1_943,
            "0.925": 243, "0.926": 973, "0.927": 1_947, "0.928": 487, "0.929": 975,
            "0.930": 1_951, "0.931": 61, "0.932": 977, "0.933": 1_955, "0.934": 489,
            "0.935": 979, "0.936": 1_959, "0.937": 245, "0.938": 981, "0.939": 1_963,
            "0.940": 491, "0.941": 983, "0.942": 1_967, "0.943": 123, "0.944": 985,
            "0.945": 493, "0.946": 1_973, "0.947": 987, "0.948": 247, "0.949": 1_977,
            "0.950": 989, "0.951": 495, "0.952": 1_981, "0.953": 991, "0.954": 31,
            "0.955": 1_985, "0.956": 993, "0.957": 497, "0.958": 1_989, "0.959": 995,
            "0.960": 249, "0.961": 997, "0.962": 1_995, "0.963": 499, "0.964": 999,
            "0.965": 1_999, "0.966": 125, "0.967": 1_001, "0.968": 2_003, "0.969": 501,
            "0.970": 1_003, "0.971": 2_007, "0.972": 251, "0.973": 1_005, "0.974": 503,
            "0.975": 2_013, "0.976": 1_007, "0.977": 63, "0.978": 2_017, "0.979": 1_009,
            "0.980": 505, "0.981": 2_021, "0.982": 1_011, "0.983": 253, "0.984": 1_013,
            "0.985": 2_027, "0.986": 507, "0.987": 1_015, "0.988": 2_031, "0.989": 127,
            "0.990": 1_017, "0.991": 2_035, "0.992": 509, "0.993": 1_019, "0.994": 255,
            "0.995": 2_041, "0.996": 1_021, "0.997": 511, "0.998": 2_045, "0.999": 1_023,
            "1.000": 1
        ]

        let dFms = "%.3f"
        let key = String(format: dFms, pitch)
        if let harmonic = harmonics[key] {
            return harmonic
        } else {
            AKLog("error approximating harmonic")
            return 1
        }
    }
}

/*
// mac os Playground code to create harmonics dictionary:
import Cocoa

var deDup = [String:Int]()
let upperLimit = 3072
let dFms = "%.3f" // 1000 unique values (manually append 1.0)

for i in 1...upperLimit {
    let p2p = log2(Double(i))
    let pFrac = p2p.truncatingRemainder(dividingBy: 1)
    let pFracS = String(format: dFms, pFrac)
 
    if deDup[pFracS] == nil { // simplest prime/composite is the only entry
        deDup[pFracS] = i
    }
}

let sortedKeys = deDup.keys.sorted()
for key in sortedKeys {
    if let i = deDup[key] {
        print("\"\(key)\" : \(i),")
    }
}
*/
