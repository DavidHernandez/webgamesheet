module Pages.Dashboard.Model exposing (..)


type Msg
    = NoOp


type alias Model =
    { suspects : List Suspect
    , weapons : List Weapon
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


emptyGame : Model
emptyGame =
    Model suspects weapons


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


weapons : List Weapon
weapons =
    [ Weapon "Wrench" Forceful ( Oil, StrongSmells ) False
    , Weapon "Shovel" Forceful ( Bruise, Dirt ) False
    , Weapon "Frying pan" Forceful ( Oil, DarkPowder ) False
    , Weapon "Cue" Forceful ( DeffensiveWounds, DarkPowder ) False
    , Weapon "Hunting shotgun" Gun ( Fight, Burns ) False
    , Weapon "Revolver" Gun ( Blood, StrongSmells ) False
    , Weapon "Deringer" Gun ( DeffensiveWounds, Burns ) False
    , Weapon "Big Gun" Gun ( AttackedFromBehind, DarkPowder ) False
    , Weapon "Kitchen Knife" Knife ( DeffensiveWounds, Blood ) False
    , Weapon "Machete" Knife ( AttackedFromBehind, Dirt ) False
    , Weapon "Letter opener" Knife ( AttackedFromBehind, Bruise ) False
    , Weapon "Sabre" Knife ( Blood, Fight ) False
    , Weapon "Antifreeze" Poison ( Bruise, Oil ) False
    , Weapon "Pesticide" Poison ( Burns, StrongSmells ) False
    , Weapon "Rat poison" Poison ( Oil, DarkPowder ) False
    , Weapon "Poisoning plant" Poison ( Dirt, Oil ) False
    , Weapon "Leather belt" Suffocating ( AttackedFromBehind, StrongSmells ) False
    , Weapon "Rope" Suffocating ( Dirt, Burns ) False
    , Weapon "Pillow" Suffocating ( Bruise, Fight ) False
    , Weapon "Curtain cord" Suffocating ( DeffensiveWounds, Fight ) False
    ]
