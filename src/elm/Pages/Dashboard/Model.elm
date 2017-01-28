module Pages.Dashboard.Model exposing (..)


type Msg
    = DiscardReason Reason
    | DiscardSuspect Suspect
    | DiscardWeapon Weapon


type alias Model =
    { suspects : List Suspect
    , weapons : List Weapon
    , locations : List Location
    }


type alias Suspect =
    { name : String
    , discarded : Bool
    , possibleReasons : List Reason
    }


type alias Reason =
    { name : String
    , kind : ReasonType
    , discarded : Bool
    }


type ReasonType
    = Blackmail
    | Passional
    | Economic
    | Revenge
    | Resentment
    | Reckoning


type alias Weapon =
    { name : String
    , kind : WeaponType
    , symptoms : ( Symptom, Symptom )
    , discarded : Bool
    }


type WeaponType
    = Gun
    | Knife
    | Poison
    | Suffocating
    | Forceful


type Symptom
    = DeffensiveWounds
    | Blood
    | AttackedFromBehind
    | Bruise
    | Dirt
    | Fight
    | Oil
    | DarkPowder
    | Burns
    | StrongSmells


type alias Location =
    { name : String
    , weapons : List Weapon
    , numberOfPeople : Maybe Int
    , peopleOnIt : List Suspect
    }


type ItemType
    = ReasonType
    | SuspectType
    | WeaponType



--type Presence suspect
--= WasHere suspect
--| WasNotHere suspect
--| NotConfirmed suspect


emptyGame : Model
emptyGame =
    Model suspects weapons locations


suspects : List Suspect
suspects =
    [ Suspect
        "Angelica Albinson"
        False
        [ Reason "Poisoned present" Resentment False
        , Reason "Radical thinking" Passional False
        , Reason "Fatal charge" Economic False
        ]
    , Suspect
        "Greg Gaffney"
        False
        [ Reason "Stolen tradition" Reckoning False
        , Reason "Discovered cheating" Blackmail False
        , Reason "Animal cruelty" Resentment False
        ]
    , Suspect
        "Claudette Cazelar"
        False
        [ Reason "Unmasked farse" Blackmail False
        , Reason "Fatal disappointment" Passional False
        , Reason "Unsuspected business" Reckoning False
        ]
    , Suspect
        "Stanley Smithe"
        True
        [ Reason "Macabre bets" Economic False
        , Reason "University bullying" Revenge False
        , Reason "Unmasked misery" Blackmail False
        ]
    , Suspect
        "Berwick sisters"
        False
        [ Reason "Family vendetta" Revenge False
        , Reason "Intellectual offense" Resentment False
        , Reason "Unlimited ambition" Economic False
        ]
    , Suspect
        "Mortimer M. Mollow"
        False
        [ Reason "Broken longins" Passional False
        , Reason "Stolen idea" Reckoning False
        , Reason "Unattended parenting" Revenge False
        ]
    ]


wrench : Weapon
wrench =
    Weapon "Wrench" Forceful ( Oil, StrongSmells ) False


shovel : Weapon
shovel =
    Weapon "Shovel" Forceful ( Bruise, Dirt ) False


pan : Weapon
pan =
    Weapon "Frying pan" Forceful ( Oil, DarkPowder ) False


cue : Weapon
cue =
    Weapon "Cue" Forceful ( DeffensiveWounds, DarkPowder ) False


shotgun : Weapon
shotgun =
    Weapon "Hunting shotgun" Gun ( Fight, Burns ) False


revolver : Weapon
revolver =
    Weapon "Revolver" Gun ( Blood, StrongSmells ) False


deringer : Weapon
deringer =
    Weapon "Deringer" Gun ( DeffensiveWounds, Burns ) False


gun : Weapon
gun =
    Weapon "Big Gun" Gun ( AttackedFromBehind, DarkPowder ) False


knife : Weapon
knife =
    Weapon "Kitchen Knife" Knife ( DeffensiveWounds, Blood ) False


machete : Weapon
machete =
    Weapon "Machete" Knife ( AttackedFromBehind, Dirt ) False


letterOpener : Weapon
letterOpener =
    Weapon "Letter opener" Knife ( AttackedFromBehind, Bruise ) False


sabre : Weapon
sabre =
    Weapon "Sabre" Knife ( Blood, Fight ) False


antifreeze : Weapon
antifreeze =
    Weapon "Antifreeze" Poison ( Bruise, Oil ) False


pesticide : Weapon
pesticide =
    Weapon "Pesticide" Poison ( Burns, StrongSmells ) False


ratPoison : Weapon
ratPoison =
    Weapon "Rat poison" Poison ( Oil, DarkPowder ) False


plant : Weapon
plant =
    Weapon "Poisoning plant" Poison ( Dirt, Oil ) False


belt : Weapon
belt =
    Weapon "Leather belt" Suffocating ( AttackedFromBehind, StrongSmells ) False


rope : Weapon
rope =
    Weapon "Rope" Suffocating ( Dirt, Burns ) False


pillow : Weapon
pillow =
    Weapon "Pillow" Suffocating ( Bruise, Fight ) False


cord : Weapon
cord =
    Weapon "Curtain cord" Suffocating ( DeffensiveWounds, Fight ) False


weapons : List Weapon
weapons =
    [ wrench
    , shovel
    , pan
    , cue
    , shotgun
    , revolver
    , deringer
    , gun
    , knife
    , machete
    , letterOpener
    , sabre
    , antifreeze
    , pesticide
    , ratPoison
    , plant
    , belt
    , rope
    , pillow
    , cord
    ]


locations : List Location
locations =
    [ Location "Garage" [ wrench, antifreeze, belt ] Nothing []
    , Location "Hunting pavilion" [ shotgun, machete, deringer ] Nothing []
    , Location "Billiard room" [ cue ] Nothing []
    , Location "Bedroom" [ pillow, revolver, letterOpener, plant ] Nothing []
    , Location "Hall" [ sabre ] Nothing []
    , Location "Office" [] Nothing []
    , Location "Kitchen" [ pan, knife, ratPoison ] Nothing []
    , Location "Shed" [ shovel, pesticide, rope ] Nothing []
    , Location "Living room" [ gun ] Nothing []
    , Location "Library" [ cord ] Nothing []
    ]
