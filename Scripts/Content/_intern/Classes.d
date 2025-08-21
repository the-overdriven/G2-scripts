//////////////////////////////////////
// 	class - Definitions
//	Global Instances
//	Phoenix V0.76
//////////////////////////////////////

const int MAX_CHAPTER = 5;
const int MAX_MISSIONS = 5;
const int MAX_HITCHANCE = 5;

class C_NPC
{
	var int id;
	var string name [5];
	var string slot;
	var string effect;
	var int npcType;
	var int flags;
	var int attribute [ATR_INDEX_MAX];
	var int HitChance [MAX_HITCHANCE];
	var int protection [PROT_INDEX_MAX];
	var int damage [DAM_INDEX_MAX];
	var int damagetype;
	var int guild, level;

	var func mission [MAX_MISSIONS];
	var int fight_tactic;
	var int weapon;

	var int voice;
	var int voicePitch;
	var int bodymass;

	var func daily_routine; // daily routine
	var func start_aistate; // State-controlled

	// **********************
	// Spawn
	// **********************
	var string spawnPoint; // When you die, where do you respawn?
	var int spawnDelay; // With delay in (real-time) seconds

	// **********************
	// SENSES
	// **********************
	var int senses; // Senses
	var int senses_range; // Range of senses in cm

	// **********************
	// Feel free to use
	// **********************
	var int aivar [100];
	var string wp;

	// **********************
	// Experience dependant
	// **********************
	var int exp; // Experience Points
	var int exp_next; // Experience Points needed to advance to next level
	var int lp; // Learn Points

	// if this is set to TRUE, the NPC can't be interrupted in any action (e.g. BS_FLAG_INTERRUPTABLE for anis is being ignored)
	var int bodyStateInterruptableOverride;
	// if "noFocus" is set to TRUE, the focus name and health bar will not be drawn of this nsc (hi, stefan!)
	var int noFocus;
};

class C_Mission
{
	var string name;
	var string description;
	var int duration; // Maximum duration in daytime hours
	var int important;

	var func offerConditions;
	var func offer;
	var func successConditions;
	var func success;
	var func failureConditions;
	var func failure;
	var func obsoleteConditions;
	var func obsolete;
	var func running;
};

class C_Item
{
	// For all items
	var int id;
	var string name, nameID;
	var int hp, hp_max;

	var int mainflag, flags;
	var int weight, value;

	// For weapons
	var int damageType;
	var int damageTotal;
	var int damage [DAM_INDEX_MAX];

	// For Armor
	var int wear;
	var int protection [PROT_INDEX_MAX];

	// For food
	var int nutrition; // HP restoration from food

	// Attributes required for using the item
	var int cond_atr [3];
	var int cond_value [3];

	// Attributes that are changed when the item is created
	var int change_atr [3];
	var int change_value [3];

	// Parser functions
	var func magic; // Parser function for “magic header”
	var func on_equip; // Parser function when item is equipped.
	var func on_unequip; // Parser function when item is unequipped.
	var func on_state [4];

	// Owner
	var func owner; // Owner's instance name
	var int ownerGuild;
	var int disguiseGuild; // Guild displayed through costumes

	// The 3DS file
	var string visual;

	// Change to the NSC mesh when equipping this item
	var string visual_change; // ASC file
	var string effect; // Effect's instance

	var int visual_skin;

	var string scemeName;
	var int material;
	var int munition; // Ammunition's instance

	var int spell;
	var int range;

	var int mag_circle;

	var string description;
	var string text [ITM_TEXT_MAX];
	var int count [ITM_TEXT_MAX];

	// Inventory display history, only used if different from 0.
	var int inv_zbias; // How far has the item been moved in the inventory towards the far plane (integer scale 100=1)?
	var int inv_rotx; // How many degrees around the x-axis is the item rotated in the inventory?
	var int inv_roty; // How many degrees around the y-axis is the item rotated in the inventory?
	var int inv_rotz; // How many degrees around the z-axis is the item rotated in the inventory?
	var int inv_animate; // Should the item be rotated in inventory?
};

class C_Focus
{
	/// for NPC
	var float npc_longrange; // calling distance ( 20 m )
	var float npc_range1, npc_range2; // range
	var float npc_azi; // Azimuth ( side angle )
	var float npc_elevdo, npc_elevup; // Elevation
	var int npc_prio; // Priority

	/// for items
	var float item_range1, item_range2;
	var float item_azi;
	var float item_elevdo, item_elevup;
	var int item_prio;

	/// for mobs
	var float mob_range1, mob_range2;
	var float mob_azi;
	var float mob_elevdo, mob_elevup;
	var int mob_prio;
};

class C_INFO
{
	var int npc;
	var int nr;
	var int important;
	var func condition;
	var func information;
	var string description;
	var int trade;
	var int permanent;
};

class C_ITEMREACT
{
	var int npc;
	var int trade_item;
	var int trade_amount;
	var int requested_cat;
	var int requested_item;
	var int requested_amount;
	var func reaction;
};

class C_Spell
{
	var float time_per_mana; // Time per mana point invested (ms)
	var int damage_per_level; // Damage per level
	var int damageType; // CAN BE ONLY ONE DAMAGE TYPE
	var int spellType; // Good, Neutral or Bad
	var int canTurnDuringInvest;
	var int canChangeTargetDuringInvest;
	var int isMultiEffect; // Effect class is oCVisFX_MultiTarget if set to 1 (e.g. the effect can have multiple trajectories (massdeath)
	var int targetCollectAlgo;
	var int targetCollectType;
	var int targetCollectRange;
	var int targetCollectAzi;
	var int targetCollectElev;
};

// ************************************************************
// Global class instances
// ************************************************************

// Current NPC, or player
instance self, other(C_NPC);

// Victims of "witness" campaigns (?)
instance victim(C_NPC);

// Current item
instance item(C_Item);

// Global player instance
instance hero(C_NPC);
