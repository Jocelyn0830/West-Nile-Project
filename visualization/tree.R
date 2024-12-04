# Load libraries
library(ggtree)
library(ape)
library(treeio)
library(dplyr)
library(ggplot2)
library(tidytree)
library(geiger)

offspring.tbl_tree_item <- utils::getFromNamespace(".offspring.tbl_tree_item", "tidytree")

# Load tree
tree <- read.tree("/Users/jocelynwang/Desktop/Princeton/West-Nile-Project/data/phylogeny/phylogeny_rooted_v2")
tree2 <- read.nhx("/Users/jocelynwang/Desktop/Princeton/West-Nile-Project/data/phylogeny/phylogeny_rooted_v2")

ggtree(tree,  layout="circular")
tree <- drop.tip(tree, tip = "KT934797")

econode1 <- getMRCA(tree, c("DQ080052", "DQ080053", "DQ164201", "DQ431702", "DQ431704", "DQ431711", "DQ666448", "DQ666449", "DQ666451", "JF415919", "JF957164", "JF957166", "JF957170", "JF957173", "KJ501108", "KJ501112", "KJ501113", "KJ501114", "KJ501335", "KJ501348", "KJ501358", "KJ501389", "KJ501398", "KJ501404", "KJ501416", "KJ501419", "KJ501420", "KJ501424", "KJ501431", "KJ501471", "KJ501478", "KJ501526", "KJ501529", "KR348928", "KR348932", "KR348933", "KR348934", "KR348979", "KX547387", "KX547510", "MG004533", "MG004537", "MG004540", "MH170226", "MH170232", "MH170239", "MH170241", "MH170244", "MH170251", "W008", "W009", "W010", "W014", "W015", "W016", "W060", "W061", "W062", "W065", "W067", "W073", "W074", "W075", "W077", "W078", "W082", "W085", "W086", "W090", "W0929", "W101", "W104", "W111", "W112", "W119", "W1452", "W1493", "W173", "W257", "W260", "W344", "W349", "W350", "W351", "W353", "W355", "W538", "W539", "W540", "W541", "W547", "W548", "W550", "W555", "W556", "W557", "W560", "W563", "W564", "W566", "W568", "W569", "W570", "W571", "W572", "W573", "W574", "W575", "W576", "W577", "W582", "W584", "W585", "W587", "W589"))
econode2 <- getMRCA(tree, c("GQ379159", "JF957161", "JF957162", "JF957163", "JF957165", "JF957167", "JF957168", "JF957171", "JF957172", "KJ501110", "KJ501111", "KJ501126", "KJ501168", "KR348930", "KR348931", "KR348946", "KR348955", "KR348978", "KR348985", "KR348987", "KR348988", "KR348991", "W0920", "W0921", "W0926", "W0933", "W0939", "W0940", "W0941", "W0944", "W0945", "W0947", "W0948", "W133", "W182", "W256", "W264", "W265", "W271", "W280", "W281", "W284", "W288", "W294", "W295", "W298", "W304", "W305", "W306", "W307", "W308", "W310", "W312", "W313", "W314", "W317", "W318", "W325", "W339", "W354", "W357", "W358", "W362", "W365", "W367", "W368", "W370", "W384", "W385", "W386", "W387", "W388", "W389", "W390", "W394", "W396", "W398", "W399", "W400", "W401", "W402", "W403", "W404", "W406", "W407", "W408", "W409", "W410", "W412", "W413", "W414", "W415", "W417", "W418", "W419", "W420", "W421", "W422", "W426", "W427", "W428", "W430", "W433", "W436", "W440", "W824", "W825", "W827", "W830"))
econode3 <- getMRCA(tree, c("HM756677", "JF703163", "JF957178", "KF704147", "KJ501106", "KJ501109", "KJ501236", "KR348926", "KR348929", "KR348937", "KR348938", "KR348940", "KR348941", "KR348942", "KR348944"))
econode4 <- getMRCA(tree, c("DQ431712", "JF957174", "JF957176", "KJ501099", "KJ501101", "KJ501102", "KJ501128", "KJ501409", "KJ501428", "KJ501485", "KJ501521", "KR348919", "KR348921", "KR348922", "KR348948", "KR348976", "KR348977", "KR348989", "KR348990", "KR348992", "KR349014", "KR349019", "W012", "W068", "W117", "W134", "W183", "W184", "W186", "W259", "W263", "W266", "W267", "W269", "W270", "W272", "W274", "W275", "W276", "W277", "W278", "W279", "W286", "W287", "W289", "W290", "W291", "W293", "W296", "W297", "W359", "W363", "W366", "W374", "W376", "W377", "W378", "W382", "W383", "W391", "W393", "W395", "W397", "W411", "W659", "W667", "W669", "W764", "W820", "W821"))
econode9 <- getMRCA(tree, c("DQ080063", "DQ080064", "DQ080065", "DQ080066", "DQ080067", "DQ080068", "DQ080069", "DQ080070", "HM488191", "HM488198", "HM488239", "JN183886", "KJ501253", "KJ501297", "KJ501323", "KJ501324", "KJ501349", "KJ501385", "KJ501462", "W1420", "W1432", "W1441", "W1464", "W1467", "W1470"))
econode10 <- getMRCA(tree, c("DQ431706", "DQ431707", "KJ501391", "MH170237", "W1438", "W1451", "W1469", "W1494"))
econode12 <- getMRCA(tree, c("DQ666452", "JF415921", "JF920751", "JF957175", "JQ700438", "KF704153", "KJ145832", "KJ501170", "KJ501250", "KJ501258", "KJ501295", "KJ501381", "KJ501392", "KJ501418", "KJ501518", "KX547187", "KX547197", "KX547318", "KX547462", "KX547544", "W1472", "W1474", "W1497"))
econode15 <- getMRCA(tree, c("DQ164203", "KJ501326", "KJ501354", "KJ501429", "KJ501430", "KJ501522", "KX547264", "KX547273", "KX547282", "KX547352", "KX547375", "KX547451", "KX547552", "KX547585", "MH170230", "W1475", "W1476", "W1479", "W1488"))
econode18 <- getMRCA(tree, c("AY712948", "DQ164191", "DQ164193", "DQ164196", "DQ164197", "DQ164200", "DQ431693", "DQ431695", "DQ431696", "DQ431701", "DQ431703", "GU828001", "GU828002", "GU828003", "GU828004", "HM488178", "HM488184", "HM488193", "HM488197", "HM488210", "HM488227", "HM488228", "HM488233", "HM488234", "HM488240", "HM488241", "HM756648", "HM756658", "HM756669", "HM756670", "HQ671693", "HQ671694", "HQ671725", "HQ705669", "HQ705677", "JF357960", "JF415929", "JF730043", "JN183891", "JN183892", "JN819323", "KJ501262", "KJ501266", "KJ501321", "KJ501322", "KJ501328", "KJ501351", "KJ501372", "KJ501377", "KJ501380", "KJ501384", "KJ501387", "KJ501405", "KJ501451", "KJ501453", "KJ501454", "KJ501458", "KJ501466", "KJ501469", "KJ501477", "KJ501503", "KJ501504", "KJ501509", "KJ501514", "KX547188", "KX547212", "KX547213", "KX547215", "KX547229", "KX547247", "KX547292", "KX547305", "KX547336", "KX547345", "KX547413", "KX547421", "KX547422", "KX547423", "KX547436", "KX547448", "KX547459", "KX547468", "KX547508", "KX547525", "KX547533", "KX547545", "KX547560", "KX547561", "KX547567", "KX547573", "KX547580", "KX547592", "KX547593", "KX547603", "KX547605", "KX547618", "MH170229", "MH170238", "MH170249", "MH170257", "MH170264", "W1388", "W1398", "W1413", "W1430", "W1431", "W1433", "W1436", "W1445", "W1459", "W1461", "W1484", "W1489", "W1502"))
econode19 <- getMRCA(tree, c("DQ164199", "GU827999", "GU828000", "HQ671721", "KJ501350", "KX547182", "KX547226", "KX547275", "KX547388", "KX547596", "MH166896", "W1443"))
econode20 <- getMRCA(tree, c("DQ164198", "DQ164205", "DQ431699", "DQ666450", "HM488144", "HM488145", "HM488146", "HM488159", "HM488160", "HM488161", "HM488163", "HM488164", "HM488172", "HM488173", "HM488177", "HM488188", "HM488204", "HM488217", "HM488220", "HM488223", "HM488224", "HM488242", "HM488251", "HM488254", "HM756649", "HM756650", "HM756676", "HQ671702", "HQ671703", "HQ705660", "JF415915", "JF415930", "JF730042", "JF920728", "JF920729", "JF920732", "JF920736", "JF920737", "JF920739", "JF920749", "JF920750", "JF972636", "JN819311", "KJ501261", "KJ501271", "KJ501303", "KJ501309", "KJ501312", "KJ501327", "KJ501331", "KJ501368", "KJ501396", "KJ501402", "KJ501411", "KJ501412", "KJ501415", "KJ501447", "KJ501461", "KJ501524", "KJ501527", "KX547164", "KX547175", "KX547191", "KX547207", "KX547208", "KX547219", "KX547225", "KX547241", "KX547265", "KX547287", "KX547289", "KX547294", "KX547311", "KX547362", "KX547365", "KX547370", "KX547401", "KX547440", "KX547447", "KX547453", "KX547463", "KX547476", "KX547498", "KX547505", "KX547506", "KX547512", "KX547530", "KX547541", "KX547549", "KX547550", "KX547568", "KX547588", "KX547609", "KX547611", "KX547615", "MH166884", "MH166921", "MH170231", "MH170252", "MH170270", "W1400", "W1429", "W1457", "W1465", "W1481", "W1492", "W1501"))
econode21 <- getMRCA(tree, c("HM488121", "HM488122", "HM488123", "HM488124", "HM488155", "HM488215", "HM756665", "HQ671728", "JN367277", "KJ501346", "KJ786935", "KX547166", "KX547202", "KX547259", "KX547263", "KX547586", "KX547620"))
econode23 <- getMRCA(tree, c("HM488230", "HQ671726", "JF920733", "JF920735", "KJ501257", "KX547349", "KX547360", "KX547446", "KX547599", "MH166883", "MH166885", "MH166902", "MH166905", "W1434", "W1455"))
econode24 <- getMRCA(tree, c("JN183885", "KJ501456", "KJ501457", "KX547312", "KX547363", "KX547606"))
econode25 <- getMRCA(tree, c("DQ005530", "DQ431694", "DQ431705", "EU155484", "HM488162", "HM488176", "HM488179", "HM488180", "HM488189", "HM488195", "HM488212", "HM488237", "HM488253", "HM756651", "HQ671730", "JF415924", "JF920746", "JF920756", "JF957169", "JF957181", "JF957182", "JN819319", "KJ501214", "KJ501217", "KJ501238", "KJ501254", "KJ501265", "KJ501284", "KJ501296", "KJ501298", "KJ501315", "KJ501316", "KJ501353", "KJ501369", "KJ501373", "KJ501390", "KJ501421", "KJ501444", "KJ501449", "KJ501459", "KJ501470", "KJ501474", "KJ501475", "KJ501482", "KJ501487", "KJ501507", "KJ501508", "KJ501511", "KJ501513", "KJ501523", "KT862843", "KT862844", "KX547168", "KX547183", "KX547231", "KX547258", "KX547260", "KX547270", "KX547276", "KX547354", "KX547355", "KX547367", "KX547379", "KX547397", "KX547426", "KX547472", "KX547523", "KX547546", "KX547569", "KX547578", "KX547608", "KX547614", "MH170233", "MH170245", "MH170246", "MH170248", "MH170250", "MH170255", "MH170266", "MH170267", "W1385", "W1389", "W1392", "W1393", "W1399", "W1408", "W1412", "W1415", "W1418", "W1423", "W1427", "W1428", "W1440", "W1442", "W1466"))
econode27 <- getMRCA(tree, c("DQ080054", "DQ431710", "GQ379157", "KJ501115", "KJ501116", "KJ501119", "KJ501127", "KJ501129", "KJ501131", "KJ501132", "KJ501135", "KJ501136", "KJ501137", "KJ501138", "KJ501140", "KJ501141", "KJ501142", "KJ501143", "KJ501342", "KR348935", "KR348936", "KR348939", "KR348947", "KR348949", "KR348951", "KR348952", "KR348956", "KR348957", "KR348958", "KR348959", "KR348961", "KR348962", "KR348963", "KR348964", "KR349022", "W005", "W114", "W115", "W132", "W147", "W176", "W177", "W179", "W180", "W255", "W356", "W816"))
econode28 <- getMRCA(tree, c("DQ431709", "GQ379158", "KJ501130", "KJ501133", "KJ501134", "KJ501139", "KJ501144", "KJ501146", "KJ501147", "KJ501148", "KJ501149", "KJ501150", "KR348950", "KR348953", "KR348954", "KR348960", "KR348965", "KR348967", "KR348968", "KR348969", "KR348970", "KR348971", "KR348972", "KR348973", "W001", "W002", "W003", "W004", "W011", "W017", "W018", "W019", "W020", "W022", "W026", "W028", "W029", "W030", "W033", "W034", "W036", "W037", "W038", "W039", "W041", "W042", "W043", "W044", "W045", "W047", "W048", "W049", "W050", "W051", "W058", "W089", "W097", "W102", "W110", "W127", "W129", "W143", "W145", "W158", "W164", "W168", "W187", "W195", "W208", "W209", "W210", "W221", "W502", "W505", "W506", "W507", "W508", "W509", "W510", "W512", "W513", "W514", "W515", "W516", "W518", "W521", "W522", "W523", "W524", "W525", "W526", "W527", "W528", "W529", "W530", "W531", "W532", "W533", "W534", "W536", "W537", "W542", "W544", "W586", "W592"))
econode29 <- getMRCA(tree, c("DQ080055", "DQ080056", "DQ431700", "DQ431708", "JF703161", "JF703162", "KJ501105", "KJ501123", "KJ501125", "KR348925", "KR348943", "KR348945", "KR349009", "KR349024", "W116"))
econode30 <- getMRCA(tree, c("DQ080060", "KJ501103", "KJ501104", "KJ501107", "KJ501186", "KR348923", "KR348924", "KR348927", "KR349008", "KR349010", "W113", "W253", "W364"))
econode31 <- getMRCA(tree, c("KJ501195", "KJ501206", "KJ501341", "KR348916", "KR348917", "KR348994", "KR348998", "KR349000", "KR349002", "KR349004", "KR349006", "KR349015", "KR349017", "KR349018", "KR349020", "KR349021", "KR349025", "KR349026", "W006", "W007", "W055", "W057", "W059", "W087", "W0942", "W0943", "W0946", "W096", "W120", "W122", "W126", "W130", "W152", "W159", "W166", "W169", "W201", "W202", "W204", "W211", "W212", "W233", "W235", "W240", "W244", "W299", "W342", "W485", "W493", "W637", "W651", "W653", "W654", "W656", "W657", "W658", "W660", "W661", "W679", "W680", "W684", "W685", "W688", "W692", "W693", "W694", "W698", "W699", "W700", "W704", "W705", "W707", "W712", "W715", "W727", "W729", "W734", "W737", "W738", "W739", "W742", "W743", "W744", "W746", "W749", "W750", "W752", "W753", "W754", "W755", "W756", "W757", "W762", "W763", "W765", "W770", "W772", "W782", "W784", "W791", "W792", "W799", "W800", "W807", "W812"))
econode32 <- getMRCA(tree, c("KR349013", "W125", "W131", "W135", "W138", "W144", "W148", "W150", "W151", "W268", "W650", "W672", "W728", "W730", "W803"))
econode33 <- getMRCA(tree, c("DQ080059", "KR348997", "KR348999", "KR349011", "KR349012", "W372", "W635", "W796", "W808"))
econode34 <- getMRCA(tree, c("JQ700441", "KJ501096", "KJ501098", "KJ501100", "KJ501267", "KR348915", "KR348918", "KR348920", "KR348966", "KR348980", "KR348982", "KR348984", "KR348995", "W013", "W092", "W093", "W094", "W095", "W098", "W100", "W123", "W128", "W139", "W140", "W146", "W149", "W154", "W161", "W172", "W185", "W188", "W192", "W193", "W198", "W199", "W214", "W217", "W220", "W223", "W224", "W225", "W226", "W228", "W229", "W230", "W234", "W242", "W243", "W245", "W246", "W249", "W250", "W319", "W405", "W423", "W429", "W431", "W432", "W437", "W594", "W643", "W655", "W668", "W670", "W675", "W676", "W677", "W678", "W681", "W682", "W686", "W690", "W691", "W701", "W708", "W709", "W710", "W711", "W713", "W714", "W716", "W717", "W718", "W719", "W720", "W722", "W723", "W724", "W725", "W726", "W731", "W732", "W733", "W736", "W740", "W745", "W748", "W751", "W758", "W760", "W766", "W767", "W768", "W771", "W773", "W774", "W775", "W778", "W779", "W780", "W781", "W785", "W788", "W789", "W795", "W797", "W810", "W818", "W823"))
econode44 <- getMRCA(tree, c("DQ164204", "KJ501300", "KJ501307", "KJ501329", "KJ501388", "KJ501520", "MH170254", "W1417", "W1435"))
econode46 <- getMRCA(tree, c("AY712945", "AY712946", "GU827998", "KJ501352", "KJ501356", "KJ501357", "KJ501501", "KX547522", "MH170227", "W1439"))
econode50 <- getMRCA(tree, c("HM756652", "HM756660", "HM756668", "JF488095", "JF920744", "JF920754", "JF920759", "KC736487", "KC736488", "KC736489", "KC736491", "KC736499", "KC736501", "KC736502", "KJ501230", "KJ501241", "KJ501285", "KJ501340", "KJ501533", "KX547169", "KX547171", "KX547174", "KX547186", "KX547190", "KX547200", "KX547201", "KX547235", "KX547254", "KX547293", "KX547306", "KX547315", "KX547333", "KX547337", "KX547377", "KX547406", "KX547430", "KX547450", "KX547465", "KX547477", "KX547481", "KX547482", "KX547491", "KX547515", "KX547520", "KX547526", "KX547531", "KX547555", "KX547582", "KX547589", "KX547610", "KX547612", "KX547621", "KY216153", "KY229070", "KY229073", "KY229074", "MH166893", "MH166897", "MH166909", "MH166916", "MH166918", "MH166920", "MH170240", "ON994910", "W0865", "W0952", "W0963", "W0972", "W0978", "W0981", "W0982", "W0986", "W0987", "W1301", "W1305", "W1326", "W1336", "W1353", "W1369", "W1374", "W1517", "W1630", "W1633", "W1638", "W1647", "W1648", "W1656", "W1755", "W1759", "W1782", "W1785", "W1791", "W1792", "W1796", "W1812", "W1833", "W1836", "W1894", "W1922", "W1925", "W1944", "W1953", "W1966", "W2012"))
econode52 <- getMRCA(tree, c("HQ671700", "JF488086", "JF488087", "JF488089", "JF488090", "JF488092", "JF920745", "JF920760", "KJ501498", "KX547217", "KX547256", "KX547262", "KX547267", "KX547303", "KX547307", "KX547308", "KX547332", "KX547366", "KX547392", "KX547396", "KX547455", "KX547471", "KX547486", "KX547496", "KX547521", "KX547553", "KX547590", "KX547597", "KX547613", "MH166888", "MH166889", "MH166890", "MH166891", "MH166894", "MH166895", "MH166898", "MH166907", "MH166908", "MH166910", "MH166917", "MH166919", "MH170269"))
econode53 <- getMRCA(tree, c("HM488143", "HM488185", "HM488225", "HM488226", "HM488229", "HM756654", "KJ501280", "KJ501287", "KJ501292", "KJ501337", "KJ501339", "KJ501472", "KX547238", "KX547245", "KX547246", "KX547310", "KX547314", "KX547331", "KX547341", "KX547429", "KX547432", "KX547513", "MH166915", "MH170274", "W1383"))
econode54 <- getMRCA(tree, c("HM488137", "HM488138", "HM488211", "HM488235", "HQ671698", "HQ671699", "JN819320", "KJ501361", "KX547288"))
econode55 <- getMRCA(tree, c("HM488208", "HQ671704", "KJ501301", "KJ501311", "KJ501463", "KJ501481", "MH166911"))
econode56 <- getMRCA(tree, c("HM488114", "HM488139", "HM488141", "HQ705659", "JN819307", "KX547271", "KX547304", "KX547394", "KX547420"))
econode57 <- getMRCA(tree, c("HM488192", "JF415920", "KX547300", "W1456", "W1483", "W1491"))
econode58 <- getMRCA(tree, c("KJ501224", "KJ501229", "KJ501308", "KJ501437", "KJ501531", "KJ501532", "KJ501537", "KJ786936", "KR868734", "KX547185", "KX547198", "KX547214", "KX547222", "KX547418", "KX547443", "KX547445", "KX547497", "KX547559", "KX547575", "KY216149", "KY216150", "KY229068", "KY229071", "W083", "W088", "W099", "W103", "W1339", "W163", "W165", "W174", "W1764", "W1772", "W1788", "W1799", "W1801", "W1803", "W1805", "W1819", "W1825", "W1920", "W1987", "W2007", "W2011", "W247", "W248", "W553"))
econode59 <- getMRCA(tree, c("KC711059", "KC736486", "KC736490", "KC736492", "KC736493", "KC736494", "KC736495", "KC736496", "KC736497", "KC736498", "KC736500", "KJ501220", "KJ501225", "KJ501226", "KJ501432", "KJ501434", "KX547206", "KX547221", "KX547323", "KX547324", "KX547328", "KX547330", "KX547334", "KX547343", "KX547410", "KX547514", "KX547556", "KX547579", "KY216155", "KY229072", "MG004528", "MG004530", "MG004531", "MG004532", "MG004534", "MG004536", "MG004538", "MG004541", "OK631659", "OK631661", "W0842", "W0856", "W0861", "W0891", "W0953", "W0971", "W0975", "W1356", "W1364", "W1525", "W1540", "W1564", "W1580", "W1586", "W1668", "W1751", "W1752", "W1753", "W1754", "W1756", "W1757", "W1760", "W1761", "W1763", "W1767", "W1768", "W1769", "W1770", "W1773", "W1774", "W1775", "W1776", "W1777", "W1781", "W1783", "W1784", "W1789", "W1793", "W1794", "W1795", "W1804", "W1806", "W1807", "W1808", "W1809", "W1810", "W1811", "W1817", "W1820", "W1823", "W1826", "W1828", "W1866", "W1958", "W1959", "W1960", "W1963", "W1968", "W1974", "W1975", "W1981", "W1989", "W2009", "W2013", "W2021", "W558", "W578", "W579"))
econode60 <- getMRCA(tree, c("JQ700439", "KF367469", "KX547184", "KX547286", "KX547344", "KX547391", "KX547456", "KX547467", "KX547524", "KX547548", "KX547551", "MK352483", "OK631660", "OL741623", "OR605719", "OR605720", "W0831", "W0860", "W0870", "W0899", "W0902", "W0918", "W0957", "W0958", "W0960", "W0962", "W0970", "W0984", "W0990", "W1306", "W1330", "W1375", "W1378", "W1537", "W1538", "W1614", "W1702", "W1705", "W1762", "W1827", "W1831", "W1841", "W1856", "W1863", "W1890", "W1893", "W1900", "W1905", "W1915", "W1945", "W1948", "W1950", "W1951", "W1957", "W1973", "W1988", "W2001"))
econode61 <- getMRCA(tree, c("KX547167", "KX547196", "KX547269", "KX547485", "KX547565", "ON994909", "W0951", "W0964", "W0967", "W0968", "W0969", "W0973", "W0980", "W1338", "W1505", "W1947", "W1954", "W1993", "W1996", "W2002", "W2023"))
econode62 <- getMRCA(tree, c("KJ501530", "KX547460", "KX547473", "KX547604", "KY216151", "KY229069", "W0835", "W0836", "W0901", "W0955", "W0966", "W0985", "W0988", "W1335", "W1507", "W1529", "W1530", "W1568", "W1685", "W1816", "W1886", "W1888", "W1918", "W1962", "W1972", "W1976", "W1979", "W1983", "W1984", "W1998", "W2006", "W2010", "W2014", "W2016", "W2017", "W2018", "W2022", "W2026"))
econode64 <- getMRCA(tree, c("KX547274", "KX547280", "KX547283", "KX547291", "KX547356", "KX547376", "KX547483", "KX547547", "KX547576", "KY216152", "W0959", "W0976", "W0977", "W0989", "W1324", "W1327", "W1329", "W1332", "W1334", "W1337", "W1342", "W1344", "W1907", "W1917"))
econode71 <- getMRCA(tree, c("HM488206", "KJ501535", "KJ501536", "KX547195", "KX547279", "KX547295", "KX547431", "KX547537"))
econode73 <- getMRCA(tree, c("JF920731", "JQ700442", "KJ501441", "KJ501534", "KJ501538", "KJ501539", "KX547216", "KX547242", "KX547368", "KX547369", "KX547380", "KX547417", "KX547464", "KX547495", "KX547562", "KX547574", "KX547598", "KX547607", "MH170259"))
econode75 <- getMRCA(tree, c("HM488203", "JF957179", "KJ501242", "KX547257", "KX547335", "KX547424"))
econode78 <- getMRCA(tree, c("HM488205", "JF415922", "JF415923", "JF415925", "JF415926", "JF415927", "JF415928", "JF957180", "KJ501330", "KJ501406", "KJ501407", "KJ501408", "KX547284", "MH166914"))
econode80 <- getMRCA(tree, c("JF920753", "JF957183", "KJ501500", "KX547220", "KX547243", "KX547325", "KX547389", "KX547438"))
econode82 <- getMRCA(tree, c("DQ164189", "DQ431698", "HM488115", "HM488116", "HM488117", "HM488118", "HM488119", "HM488120", "HM488148", "HM488149", "HM488151", "HM488152", "HM488153", "HM488154", "HM488156", "HM488157", "HM488158", "HM488171", "HM488183", "HM488190", "HM488213", "HM488221", "HM488244", "HM488250", "HM756656", "HM756657", "HM756667", "JF488091", "JF920306", "JF920740", "JF920742", "JF920748", "JF920755", "JN183887", "JN183888", "JN183890", "JN819309", "JN819310", "JN819312", "JN819313", "JN819318", "JN819324", "KJ145799", "KJ501256", "KJ501272", "KJ501281", "KJ501314", "KJ501334", "KJ501365", "KJ501397", "KJ501425", "KJ501460", "KJ501467", "KJ501484", "KJ501488", "KJ501499", "KJ501506", "KJ501525", "KJ501528", "KX547172", "KX547178", "KX547181", "KX547211", "KX547232", "KX547277", "KX547290", "KX547327", "KX547381", "KX547384", "KX547399", "KX547403", "KX547404", "KX547442", "KX547449", "KX547488", "KX547489", "KX547500", "KX547529", "KX547535", "KX547543", "KX547566", "MH166892", "MH166900", "MH166906", "MH166912", "MH166913", "MH170261", "MH170262", "MH170271", "MZ595324", "MZ595325", "MZ595326", "MZ595327", "MZ595329", "MZ595331", "MZ595334", "MZ595335", "MZ595336", "MZ595339", "W1386", "W1391", "W1401", "W1424", "W1447", "W1448", "W1449", "W1453", "W1454", "W1458", "W1460", "W1462", "W1471", "W1490", "W1531", "W1670", "W1800", "W1824"))
econode83 <- getMRCA(tree, c("DQ080061", "DQ164186", "DQ164190", "HM488140", "HM488174", "HM488186", "HM488200", "HM488219", "HM756671", "HM756672", "HQ671723", "HQ671724", "JF488088", "JF488094", "JF920743", "JF920752", "JF920757", "JF957184", "JF957185", "JF957186", "JN183889", "JQ700437", "JQ700440", "KF704158", "KJ145827", "KJ501218", "KJ501286", "KJ501302", "KJ501305", "KJ501338", "KJ501359", "KJ501367", "KJ501371", "KJ501382", "KJ501383", "KJ501399", "KJ501400", "KJ501438", "KJ501442", "KJ501446", "KJ501479", "KJ501495", "KX547165", "KX547192", "KX547205", "KX547223", "KX547236", "KX547237", "KX547248", "KX547249", "KX547250", "KX547255", "KX547278", "KX547281", "KX547317", "KX547321", "KX547326", "KX547338", "KX547359", "KX547374", "KX547383", "KX547398", "KX547400", "KX547416", "KX547419", "KX547437", "KX547469", "KX547470", "KX547499", "KX547507", "KX547536", "KX547540", "KX547570", "KX547581", "KX547591", "KX547594", "KX547600", "MG004529", "MG004539", "MH170247", "MH170253", "MH170275", "W0961", "W0965", "W1397", "W1426", "W1463", "W1485", "W1499", "W1911"))
econode84 <- getMRCA(tree, c("HM488165", "HM488166", "HM488167", "HM488168", "HM488169", "HM488170", "HM488182", "HM488194", "HM488199", "HM488214", "HM488216", "HM488243", "HM756666", "HM756678", "HQ671729", "JF488096", "JF488097", "JF920730", "JF920758", "KC711057", "KJ145828", "KJ501260", "KJ501360", "KJ501370", "KJ501413", "KJ501464", "KX547199", "KX547218", "KX547230", "KX547297", "KX547309", "KX547313", "KX547319", "KX547340", "KX547364", "KX547371", "KX547408", "KX547409", "KX547427", "KX547439", "KX547494", "KX547517", "KX547518", "KX547577", "MH170260", "W0950", "W1387", "W1395", "W1396", "W1411", "W1414", "W1421"))
econode85 <- getMRCA(tree, c("HM488252", "JF488093", "JF899529", "KJ501283", "KJ501336", "KJ501364", "KX547193", "KX547244", "KX547296", "KX547351", "KX547441", "KX547461", "KX547479", "KX547487", "KX547501", "KX547502", "KX547503", "KX547511", "KX547532", "MH170265"))
econode86 <- getMRCA(tree, c("AY646354", "AY795965", "DQ164206", "HM488142", "HM488147", "HM488209", "HM488222", "HM488231", "HM488232", "HM756659", "HM756673", "HQ671692", "HQ671695", "HQ671722", "HQ705678", "JF899528", "JF920734", "JF920741", "JN819305", "JN819306", "KJ501243", "KJ501244", "KJ501245", "KJ501246", "KJ501247", "KJ501248", "KJ501249", "KJ501263", "KJ501274", "KJ501291", "KJ501294", "KJ501306", "KJ501310", "KJ501333", "KJ501355", "KJ501366", "KJ501401", "KJ501414", "KJ501422", "KJ501426", "KJ501439", "KJ501448", "KJ501452", "KJ501476", "KJ501483", "KJ501490", "KJ501491", "KJ501496", "KJ501497", "KJ501505", "KJ501517", "KJ501519", "KX547170", "KX547176", "KX547180", "KX547189", "KX547204", "KX547209", "KX547224", "KX547233", "KX547239", "KX547240", "KX547299", "KX547329", "KX547342", "KX547350", "KX547382", "KX547385", "KX547402", "KX547405", "KX547415", "KX547435", "KX547444", "KX547454", "KX547458", "KX547474", "KX547493", "KX547527", "KX547587", "KX547616", "KX547617", "MH170228", "MH170234", "MH170236", "MH170243", "W1409", "W1495", "W1500"))
econode88 <- getMRCA(tree, c("HM488202", "HM488207", "HM488245", "HQ671742", "JF415918", "KJ501211", "KJ501239", "KJ501240", "KJ501255", "KX547268", "KX547285", "KX547298", "KX547339", "KX547348", "KX547434", "KX547452", "KX547504", "KX547558", "KX547601", "MH170258", "MH170268"))
econode90 <- getMRCA(tree, c("AY712947", "HQ671701", "HQ671705", "JN819321", "KX547480", "KX547542", "KX547583", "KX547619"))
econode91 <- getMRCA(tree, c("AF404755", "AY660002", "DQ080062", "DQ080071", "DQ080072", "DQ164202", "DQ431697", "GQ379156", "HM488218", "HM488236", "KJ501233", "KJ501234", "KJ501235", "KJ501264", "KJ501268", "KJ501275", "KJ501276", "KJ501282", "KJ501317", "KJ501320", "KJ501332", "KJ501362", "KJ501363", "KJ501379", "KJ501393", "KJ501394", "KJ501395", "KJ501443", "KJ501455", "KJ501468", "KJ501473", "KJ501489", "KJ501492", "KJ501512", "KJ501516", "KX547252", "KX547253", "KX547301", "KX547322", "KX547414", "KX547428", "MH166886", "MH166887", "MH166899", "MH170242", "MH170263", "MH170273", "MH170276", "MH643887", "MT905060"))
econode96 <- getMRCA(tree, c("AF202541", "DQ164194", "FJ151394", "HQ671709", "HQ671712", "HQ671713", "KX547353", "MH166903"))
econode97 <- getMRCA(tree, c("AF206518", "AF533540", "AY289214", "AY842931", "AY848695", "AY848696", "AY848697", "DQ066423", "EF571854", "FJ527738", "GQ379160", "GQ379161", "HM488125", "HM488126", "HM488127", "HM488128", "HM488132", "HM488133", "HM488134", "HM488135", "HM488136", "HQ671696", "HQ671697", "HQ671706", "HQ671707", "HQ671708", "HQ671710", "HQ671714", "HQ671716", "HQ671717", "HQ671719", "JF920307", "KC407666", "KC407667", "KJ501279", "KJ501288", "KJ501289", "KJ501290", "KJ501299", "KJ501318", "KJ501343", "KJ501344", "KJ501494", "KJ786934", "KM083619", "KX547203", "KX547210", "KX547228", "KX547272", "KX547316", "KX547320", "KX547395", "KX547478", "KX547492", "KX547519", "KX547564", "KX547584", "KX547602", "MN849176", "MW420987", "MW420988", "MW420989", "MZ605381"))
econode98 <- getMRCA(tree, c("AF404753", "AF404754", "DQ164187", "DQ164192", "FJ411043", "HM488129", "HQ671715", "HQ671718", "JN819315", "JN819316", "KJ501293", "KJ501313", "KJ501480", "KX547378", "KX547393", "MH166882", "MH166901", "MH166904"))
econode99 <- getMRCA(tree, c("AF404756", "DQ164188", "EF530047", "EF657887", "HM488130", "HM488175", "HM488246", "HM488247", "HM488248", "HM488249", "HM756653", "HM756661", "HM756662", "HM756663", "HM756664", "HQ671668", "HQ671669", "HQ671670", "HQ671671", "HQ671672", "HQ671673", "HQ671676", "HQ671677", "HQ671678", "HQ671679", "HQ671681", "HQ671682", "HQ671683", "HQ671685", "HQ671686", "HQ671687", "HQ671688", "HQ671689", "HQ671690", "HQ671691", "HQ671711", "HQ671731", "HQ671732", "HQ705663", "HQ705670", "HQ705672", "HQ705673", "HQ705674", "HQ705675", "HQ705676", "HQ891012", "JF357958", "JF357959", "JF730040", "JF730041", "JF784158", "JF899530", "JF899531", "JF899533", "JF899534", "JF899535", "JF899536", "JF899537", "JN183893", "JN183894", "JN183895", "JN183896", "JN183897", "JN819317", "KJ501269", "KJ501270", "KJ501277", "KJ501278", "KJ501374", "KJ501375", "KJ501378", "KJ501445", "KJ501450", "KJ501465", "KJ501486", "KJ501493", "KJ501515", "KX547179", "KX547194", "KX547251", "KX547261", "KX547484", "KX547490", "KX547509", "KX547538", "KX547554"))
econode103 <- getMRCA(tree, c("AY278441", "DQ374650", "DQ374651", "DQ374652", "DQ374653", "DQ377178", "DQ377179", "DQ377180", "DQ411029", "DQ411030", "DQ411031", "DQ411032", "DQ411033", "DQ411034", "DQ411035", "JX041634", "JX442279", "KC601756"))
econode105 <- getMRCA(tree, c("AF260969", "AF317203", "AF404757", "AJ965626", "AJ965628", "AY262283", "AY268132", "AY277252", "AY278442", "AY701412", "AY701413", "DQ786572", "FJ483548", "FJ483549", "FJ766331", "FJ766332", "GU011992", "JF719065", "JF719066", "JF719067", "JF719068", "JF719069", "JN858069", "JQ928174", "JQ928175", "JX556213", "KC954092", "KF234080", "KF647253", "KU588135", "LC817237", "MF797870", "MN149538", "MT863559", "MW915462", "OP009520", "OP009521", "OP009522", "OP009523", "OP009524", "OP009525", "OP609790", "OP609791", "OP609792", "OP609793", "OP609794", "OP609795", "OP609796", "OP609797", "OP609798", "OP609799", "OP609800", "OP609801", "OP609802", "OP609803", "OP609804", "OP609805", "OP609806", "OP609807", "OP609808", "OP609809", "OP609810", "OP609811", "OP609812", "OP609813", "OP609814", "OP609815", "OP617270", "OQ357819", "OQ357820", "OQ357821", "OQ357822", "OQ689696", "OQ689697", "PP104379", "PP104380", "PP104381", "PP104382"))
econode107 <- getMRCA(tree, c("AM404308", "AY490240", "AY603654", "EU081844", "EU249803", "HM051416", "JX041628", "JX041629", "JX041630", "JX070655", "KT163243"))

# Visualize the tree in circular form. Do not display branch length info
# branch.length="none", 
ggtree(tree, layout="circular") + 
  geom_hilight(node=econode1, fill="lightskyblue") +
  geom_cladelab(node=econode1, label="PE1", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T) +
  geom_hilight(node=econode2, fill="lightpink") +
  geom_cladelab(node=econode2, label="PE2", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T) +
  geom_hilight(node=econode3, fill="lightskyblue") +
  geom_cladelab(node=econode3, label="PE3", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T) +
  geom_hilight(node=econode4, fill="lightpink") +
  geom_cladelab(node=econode4, label="PE4", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T) +
  geom_hilight(node=econode9, fill="lightpink")+
  geom_cladelab(node=econode9, label="PE9", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode10, fill="lightskyblue")+
  geom_cladelab(node=econode10, label="PE10", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode12, fill="lightpink")+
  geom_cladelab(node=econode12, label="PE12", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode15, fill="lightskyblue")+
  geom_cladelab(node=econode15, label="PE15", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode18, fill="lightpink")+
  geom_cladelab(node=econode18, label="PE18", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode19, fill="lightskyblue")+
  geom_cladelab(node=econode19, label="PE19", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode20, fill="lightpink")+
  geom_cladelab(node=econode20, label="PE20", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode21, fill="lightskyblue")+
  geom_cladelab(node=econode21, label="PE21", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode23, fill="lightpink")+
  geom_cladelab(node=econode23, label="PE23", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode24, fill="lightskyblue")+
  geom_cladelab(node=econode24, label="PE24", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode25, fill="lightskyblue")+
  geom_cladelab(node=econode25, label="PE25", 
                offset=0.0001, angle=0, vjust=1.1, hjust = .5,
                fontsize=12, align=T)+
  geom_hilight(node=econode27, fill="lightskyblue")+
  geom_cladelab(node=econode27, label="PE27", 
                offset=0.0001, angle=0,hjust=0,vjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode28, fill="lightpink")+
  geom_cladelab(node=econode28, label="PE28", 
                offset=0.0001, angle=0,hjust=0,vjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode29, fill="lightpink")+
  geom_cladelab(node=econode29, label="PE29", 
                offset=0.0001, angle=0,hjust=0,vjust=1.0,
                fontsize=12, align=T)+
  geom_hilight(node=econode30, fill="lightskyblue")+
  geom_cladelab(node=econode30, label="PE30", 
                offset=0.0001, angle=0,hjust=0,vjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode31, fill="lightskyblue")+
  geom_cladelab(node=econode31, label="PE31", 
                offset=0.0001, angle=0,hjust=0,vjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode32, fill="lightpink")+
  geom_cladelab(node=econode32, label="PE32", 
                offset=0.0001, angle=0,hjust=0,vjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode33, fill="lightskyblue")+
  geom_cladelab(node=econode33, label="PE33", 
                offset=0.0001, angle=0,hjust=0,vjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode34, fill="lightpink")+
  geom_cladelab(node=econode34, label="PE34", 
                offset=0.0001, angle=0,hjust=0,vjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode44, fill="lightpink")+
  geom_cladelab(node=econode44, label="PE44", 
                offset=0.0001, angle=0,hjust=-0.2,vjust=1.0,
                fontsize=12, align=T)+
  geom_hilight(node=econode46, fill="lightskyblue")+
  geom_cladelab(node=econode46, label="PE46", 
                offset=0.0001, angle=0,hjust=0.2,vjust=1.5,
                fontsize=12, align=T)+
  geom_hilight(node=econode50, fill="lightpink")+
  geom_cladelab(node=econode50, label="PE50", 
                offset=0.0001, angle=0,hjust=0,vjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode52, fill="lightpink")+
  geom_cladelab(node=econode52, label="PE52", 
                offset=0.0001, angle=0,hjust=0,vjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode53, fill="lightpink")+
  geom_cladelab(node=econode53, label="PE53", 
                offset=0.0001, angle=0,hjust=0.4,vjust=1.3,
                fontsize=12, align=T)+
  geom_hilight(node=econode54, fill="lightskyblue")+
  geom_cladelab(node=econode54, label="PE54", 
                offset=0.0001, angle=0,hjust=0.8,vjust=1.3,
                fontsize=12, align=T)+
  geom_hilight(node=econode55, fill="lightpink")+
  geom_cladelab(node=econode55, label="PE55", 
                offset=0.0001, angle=0, hjust=1.1,vjust=-0.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode56, fill="lightskyblue")+
  geom_cladelab(node=econode56, label="PE56", 
                offset=0.0001, angle=0, hjust=1.1, vjust=-0.3,
                fontsize=12, align=T)+
  geom_hilight(node=econode57, fill="lightpink")+
  geom_cladelab(node=econode57, label="PE57", 
                offset=0.0001, angle=0, hjust=0.2, vjust=-0.2,
                fontsize=12, align=T)+
  geom_hilight(node=econode58, fill="lightskyblue")+
  geom_cladelab(node=econode58, label="PE58", 
                offset=0.0001, angle=0, hjust=0.9, vjust=-1,
                fontsize=12, align=T)+
  geom_hilight(node=econode59, fill="lightpink")+
  geom_cladelab(node=econode59, label="PE59", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode60, fill="lightskyblue")+
  geom_cladelab(node=econode60, label="PE60", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode61, fill="lightpink")+
  geom_cladelab(node=econode61, label="PE61", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode62, fill="lightskyblue")+
  geom_cladelab(node=econode62, label="PE62", 
                offset=0.0001, angle=0, hjust=1.1, vjust=-0.2,
                fontsize=12, align=T)+
  geom_hilight(node=econode64, fill="lightpink")+
  geom_cladelab(node=econode64, label="PE64", 
                offset=0.0001, angle=0, hjust=1.1, vjust=-0.3,
                fontsize=12, align=T)+
  geom_hilight(node=econode71, fill="lightpink")+
  geom_cladelab(node=econode71, label="PE71", 
                offset=0.0001, angle=0, hjust=1, vjust=-2,
                fontsize=12, align=T)+
  geom_hilight(node=econode73, fill="lightskyblue")+
  geom_cladelab(node=econode73, label="PE73", 
                offset=0.0001, angle=0, hjust=0.5, vjust=-0.1,
                fontsize=12, align=T)+
  geom_hilight(node=econode75, fill="lightpink")+
  geom_cladelab(node=econode75, label="PE75", 
                offset=0.0001, angle=0, hjust=0.4, vjust=-1.8,
                fontsize=12, align=T)+
  geom_hilight(node=econode78, fill="lightskyblue")+
  geom_cladelab(node=econode78, label="PE78", 
                offset=0.0001, angle=0, hjust=0.4, vjust=0.2,
                fontsize=12, align=T)+
  geom_hilight(node=econode80, fill="lightskyblue")+
  geom_cladelab(node=econode80, label="PE80", 
                offset=0.0001, angle=0, hjust=0.4, vjust=-0.8,
                fontsize=12, align=T)+
  geom_hilight(node=econode82, fill="lightpink")+
  geom_cladelab(node=econode82, label="PE82", 
                offset=0.0001, angle=0, hjust=0.4, vjust=-0.8,
                fontsize=12, align=T)+
  geom_hilight(node=econode83, fill="lightskyblue")+
  geom_cladelab(node=econode83, label="PE83", 
                offset=0.0001, angle=0, hjust=0.4, vjust=-0.8,
                fontsize=12, align=T)+
  geom_hilight(node=econode84, fill="lightpink")+
  geom_cladelab(node=econode84, label="PE84", 
                offset=0.0001, angle=0, hjust=0.4, vjust=-0.8,
                fontsize=12, align=T)+
  geom_hilight(node=econode85, fill="lightskyblue")+
  geom_cladelab(node=econode85, label="PE85", 
                offset=0.0001, angle=0, hjust=0.4, vjust=-0.8,
                fontsize=12, align=T)+
  geom_hilight(node=econode86, fill="lightpink")+
  geom_cladelab(node=econode86, label="PE86", 
                offset=0.0001, angle=0, hjust=0.4, vjust=-0.8,
                fontsize=12, align=T)+
  geom_hilight(node=econode88, fill="lightskyblue")+
  geom_cladelab(node=econode88, label="PE88", 
                offset=0.0001, angle=0, hjust=0.4, vjust=-0.8,
                fontsize=12, align=T)+
  geom_hilight(node=econode90, fill="lightpink")+
  geom_cladelab(node=econode90, label="PE90", 
                offset=0.0001, angle=0, hjust=-0.1, vjust=-0.5,
                fontsize=12, align=T)+
  geom_hilight(node=econode91, fill="lightskyblue")+
  geom_cladelab(node=econode91, label="PE91", 
                offset=0.0001, angle=0, hjust=-0.1, vjust=-0.5,
                fontsize=12, align=T)+
  geom_hilight(node=econode96, fill="lightpink")+
  geom_cladelab(node=econode96, label="PE96", 
                offset=0.0001, angle=0, hjust=-0.1, vjust=-0.5,
                fontsize=12, align=T)+
  geom_hilight(node=econode97, fill="lightskyblue")+
  geom_cladelab(node=econode97, label="PE97", 
                offset=0.0001, angle=0, hjust=-0.1, vjust=-0.5,
                fontsize=12, align=T)+
  geom_hilight(node=econode98, fill="lightpink")+
  geom_cladelab(node=econode98, label="PE98", 
                offset=0.0001, angle=0, hjust=-0.1, vjust=-0.5,
                fontsize=12, align=T)+
  geom_hilight(node=econode99, fill="lightskyblue")+
  geom_cladelab(node=econode99, label="PE99", 
                offset=0.0001, angle=0, hjust=-0.1, vjust=-0.5,
                fontsize=12, align=T)+
  geom_hilight(node=econode103, fill="lightpink")+
  geom_cladelab(node=econode103, label="PE103", 
                offset=0.0001, angle=0, hjust=-0.1, vjust=-0.5,
                fontsize=12, align=T)+
  geom_hilight(node=econode105, fill="lightskyblue")+
  geom_cladelab(node=econode105, label="PE105", 
                offset=0.0001, angle=0, hjust=-0.1, vjust=-0.5,
                fontsize=12, align=T)+
  geom_hilight(node=econode107, fill="lightpink")+
  geom_cladelab(node=econode107, label="PE107", 
                offset=0.0001, angle=0, hjust=-0.1, vjust=0.8,
                fontsize=12, align=T)+ 
  geom_point2(aes(subset=(node %in% c(list21_combined_node,
                                      list3_combined_node,
                                      list5_combined_node,
                                      list17_combined_node,
                                      list22_combined_node,
                                      list25_combined_node,
                                      list28_combined_node,
                                      list42_combined_node, 
                                      list43_combined_node,
                                      list1393_combined_node, 
                                      list1585_combined_node, 
                                      list1593_combined_node, 
                                      list1599_combined_node))), 
              shape=21, size=12, fill='red')



table <- read.table("clade.csv", header = FALSE, sep = ",", fill = TRUE)
table <- data.frame(table[,-1], row.names=table[,1])

#### node 3
list3_0 <- as.character(as.vector(table[1,]))
list3_0 <- list3_0[nzchar(list3_0)]
list3_0_node <- getMRCA(tree, list3_0)

list3_1 <- as.character(as.vector(table[2,]))
list3_1 <- list3_1[nzchar(list3_1)]
list3_1_node <- getMRCA(tree, list3_1)

list3_combined <- as.character(as.vector(table[3,]))
list3_combined <- list3_combined[nzchar(list3_combined)]
list3_combined_node <- getMRCA(tree, list3_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list3_0_node, fill="lavender")+
  geom_hilight(node=list3_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==2571)), shape=21, size=18, fill='red')+
  geom_cladelab(node=econode105, label="PE105", 
                offset=0.0001, angle=0, hjust=-0.1, vjust=-0.5,
                fontsize=24, align=T)

# PE105 is the same as the group 1 here
# node 3 separates PE 105 and other strains
econode105 == list3_1_node

#### node 5
list5_0 <- as.character(as.vector(table[4,]))
list5_0 <- list5_0[nzchar(list5_0)]
list5_0_node <- getMRCA(tree, list5_0)

list5_1 <- as.character(as.vector(table[5,]))
list5_1 <- list5_1[nzchar(list5_1)]
list5_1_node <- getMRCA(tree, list5_1)

list5_combined <- as.character(as.vector(table[6,]))
list5_combined <- list5_combined[nzchar(list5_combined)]
list5_combined_node <- getMRCA(tree, list5_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list5_0_node, fill="lavender")+
  geom_hilight(node=list5_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==list5_combined_node)), shape=21, size=18, fill='red')+
  geom_cladelab(node=econode103, label="PE103", 
                offset=0.0001, angle=0, hjust=-0.1, vjust=-0.5,
                fontsize=24, align=T)

# PE103 is the same as the group 1 here
# node 5 separates PE 103 and other strains
econode103 == list5_1_node

#### node 17
list17_0 <- as.character(as.vector(table[7,]))
list17_0 <- list17_0[nzchar(list17_0)]
list17_0_node <- getMRCA(tree, list17_0)

list17_1 <- as.character(as.vector(table[8,]))
list17_1 <- list17_1[nzchar(list17_1)]
list17_1_node <- getMRCA(tree, list17_1)

list17_combined <- as.character(as.vector(table[9,]))
list17_combined <- list17_combined[nzchar(list17_combined)]
list17_combined_node <- getMRCA(tree, list17_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list17_0_node, fill="lavender")+
  geom_hilight(node=list17_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==list17_combined_node)), shape=21, size=18, fill='red')+
  geom_cladelab(node=econode91, label="PE91", 
                offset=0.0001, angle=0, hjust=-0.1, vjust=-0.5,
                fontsize=24, align=T)

# PE91 is the same as the group 1 here
# node 17 separates PE 91 and other strains except PE96, PE97, PE98, PE99, PE103, PE105, PE107
econode91 == list17_1_node

#### node 21
list21_0 <- as.character(as.vector(table[10,]))
list21_0 <- list21_0[nzchar(list21_0)]
list21_0_node <- getMRCA(tree, list21_0)

list21_1 <- as.character(as.vector(table[11,]))
list21_1 <- list21_1[nzchar(list21_1)]
list21_1_node <- getMRCA(tree, list21_1)

list21_combined <- as.character(as.vector(table[12,]))
list21_combined <- list21_combined[nzchar(list21_combined)]
list21_combined_node <- getMRCA(tree, list21_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list21_0_node, fill="lightskyblue")+
  geom_hilight(node=list21_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==list21_combined_node)), shape=21, size=18, fill='red')

#### node 22
list22_0 <- as.character(as.vector(table[13,]))
list22_0 <- list22_0[nzchar(list22_0)]
list22_0_node <- getMRCA(tree, list22_0)

list22_1 <- as.character(as.vector(table[14,]))
list22_1 <- list22_1[nzchar(list22_1)]
list22_1_node <- getMRCA(tree, list22_1)

list22_combined <- as.character(as.vector(table[15,]))
list22_combined <- list22_combined[nzchar(list22_combined)]
list22_combined_node <- getMRCA(tree, list22_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list22_0_node, fill="lightskyblue")+
  geom_hilight(node=list22_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==list22_combined_node)), shape=21, size=18, fill='red')

#### node 25
list25_0 <- as.character(as.vector(table[16,]))
list25_0 <- list25_0[nzchar(list25_0)]
list25_0_node <- getMRCA(tree, list25_0)

list25_1 <- as.character(as.vector(table[17,]))
list25_1 <- list25_1[nzchar(list25_1)]
list25_1_node <- getMRCA(tree, list25_1)

list25_combined <- as.character(as.vector(table[18,]))
list25_combined <- list25_combined[nzchar(list25_combined)]
list25_combined_node <- getMRCA(tree, list25_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list25_0_node, fill="lightskyblue")+
  geom_hilight(node=list25_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==list25_combined_node)), shape=21, size=18, fill='red')


#### node 28
list28_0 <- as.character(as.vector(table[19,]))
list28_0 <- list28_0[nzchar(list28_0)]
list28_0_node <- getMRCA(tree, list28_0)

list28_1 <- as.character(as.vector(table[20,]))
list28_1 <- list28_1[nzchar(list28_1)]
list28_1_node <- getMRCA(tree, list28_1)

list28_combined <- as.character(as.vector(table[21,]))
list28_combined <- list28_combined[nzchar(list28_combined)]
list28_combined_node <- getMRCA(tree, list28_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list28_0_node, fill="lightskyblue")+
  geom_hilight(node=list28_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==list28_combined_node)), shape=21, size=18, fill='red')


#### node 42
list42_0 <- as.character(as.vector(table[22,]))
list42_0 <- list42_0[nzchar(list42_0)]
list42_0_node <- getMRCA(tree, list42_0)

list42_1 <- as.character(as.vector(table[23,]))
list42_1 <- list42_1[nzchar(list42_1)]
list42_1_node <- getMRCA(tree, list42_1)

list42_combined <- as.character(as.vector(table[24,]))
list42_combined <- list42_combined[nzchar(list42_combined)]
list42_combined_node <- getMRCA(tree, list42_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list42_0_node, fill="lightskyblue")+
  geom_hilight(node=list42_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==list42_combined_node)), shape=21, size=18, fill='red')


#### node 43
list43_0 <- as.character(as.vector(table[25,]))
list43_0 <- list43_0[nzchar(list43_0)]
list43_0_node <- getMRCA(tree, list43_0)

list43_1 <- as.character(as.vector(table[26,]))
list43_1 <- list43_1[nzchar(list43_1)]
list43_1_node <- getMRCA(tree, list43_1)

list43_combined <- as.character(as.vector(table[27,]))
list43_combined <- list43_combined[nzchar(list43_combined)]
list43_combined_node <- getMRCA(tree, list43_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list43_0_node, fill="thistle")+
  geom_hilight(node=list43_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==list43_combined_node)), shape=21, size=18, fill='red')+
  geom_cladelab(node=econode1, label="PE1", 
                offset=0.0001, angle=0, hjust=1.1,
                fontsize=24, align=T)

# node 43 separates two different groups within PE 1
list43_combined_node == econode1


#### node 1393
list1393_0 <- as.character(as.vector(table[28,]))
list1393_0 <- list1393_0[nzchar(list1393_0)]
list1393_0_node <- getMRCA(tree, list1393_0)

list1393_1 <- as.character(as.vector(table[29,]))
list1393_1 <- list1393_1[nzchar(list1393_1)]
list1393_1_node <- getMRCA(tree, list1393_1)

list1393_combined <- as.character(as.vector(table[30,]))
list1393_combined <- list1393_combined[nzchar(list1393_combined)]
list1393_combined_node <- getMRCA(tree, list1393_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list1393_0_node, fill="lightskyblue")+
  geom_hilight(node=list1393_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==list1393_combined_node)), shape=21, size=18, fill='red')


#### node 1585
list1585_0 <- as.character(as.vector(table[31,]))
list1585_0 <- list1585_0[nzchar(list1585_0)]
list1585_0_node <- getMRCA(tree, list1585_0)

list1585_1 <- as.character(as.vector(table[32,]))
list1585_1 <- list1585_1[nzchar(list1585_1)]
list1585_1_node <- getMRCA(tree, list1585_1)

list1585_combined <- as.character(as.vector(table[33,]))
list1585_combined <- list1585_combined[nzchar(list1585_combined)]
list1585_combined_node <- getMRCA(tree, list1585_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list1585_0_node, fill="lightskyblue")+
  geom_hilight(node=list1585_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==list1585_combined_node)), shape=21, size=18, fill='red')


#### node 1593
list1593_0 <- as.character(as.vector(table[34,]))
list1593_0 <- list1593_0[nzchar(list1593_0)]
list1593_0_node <- getMRCA(tree, list1593_0)

list1593_1 <- as.character(as.vector(table[35,]))
list1593_1 <- list1593_1[nzchar(list1593_1)]
list1593_1_node <- getMRCA(tree, list1593_1)

list1593_combined <- as.character(as.vector(table[36,]))
list1593_combined <- list1593_combined[nzchar(list1593_combined)]
list1593_combined_node <- getMRCA(tree, list1593_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list1593_0_node, fill="lightskyblue")+
  geom_hilight(node=list1593_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==list1593_combined_node)), shape=21, size=18, fill='red')


#### node 1599
list1599_0 <- as.character(as.vector(table[37,]))
list1599_0 <- list1599_0[nzchar(list1599_0)]
list1599_0_node <- getMRCA(tree, list1599_0)

list1599_1 <- as.character(as.vector(table[38,]))
list1599_1 <- list1599_1[nzchar(list1599_1)]
list1599_1_node <- getMRCA(tree, list1599_1)

list1599_combined <- as.character(as.vector(table[39,]))
list1599_combined <- list1599_combined[nzchar(list1599_combined)]
list1599_combined_node <- getMRCA(tree, list1599_combined)

ggtree(tree, layout="circular") + 
  geom_hilight(node=list1599_0_node, fill="lightskyblue")+
  geom_hilight(node=list1599_1_node, fill="lightpink")+
  geom_point2(aes(subset=(node==list1599_combined_node)), shape=21, size=18, fill='red')



ggtree(tree, layout="circular") + 
  geom_point2(aes(subset=(node %in% c(list21_combined_node,
                                      list3_combined_node,
                                      list5_combined_node,
                                      list17_combined_node,
                                      list22_combined_node,
                                      list25_combined_node,
                                      list28_combined_node,
                                      list42_combined_node, 
                                      list43_combined_node,
                                      list1393_combined_node, 
                                      list1585_combined_node, 
                                      list1593_combined_node, 
                                      list1599_combined_node))), 
              shape=21, size=18, fill='red')
