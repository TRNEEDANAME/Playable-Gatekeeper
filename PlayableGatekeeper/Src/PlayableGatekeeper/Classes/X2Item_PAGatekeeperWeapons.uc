class X2Item_PAGatekeeperWeapons extends X2Item config(GameData_WeaponsData);

// Gatekeeper Gun
var config array <WeaponDamageValue> PA_GatekeeperBaseDamage;
var config array<int> PA_GatekeeperRangeAccuracy;
var config int PA_GatekeeperClipSize;
var config int PA_GatekeeperSoundRange;
var config int PA_GatekeeperEnvDamage;
var config int PA_GatekeeperIdealRange;

// Gatekeeper Psi damage
var config array <WeaponDamageValue> PA_GatekeeperPsiExtraDamage;


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	// Gatekeeper Weapon

	Weapons.AddItem(CreateTemplate_PA_GatekeeperGun());
	Weapons.AddItem(CreateTemplate_GatekeeperPsiAmp());

	return Weapons;
}


static function X2DataTemplate CreateTemplate_PA_GatekeeperGun()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_GatekeeperGun');

	Template.WeaponPanelImage = "_ConventionalRifle";
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_GatekeeperGunCat';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.GatekeeperEyeball";
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer);

	Template.RangeAccuracy = default.PA_GatekeeperRangeAccuracy;
	Template.BaseDamage = default.PA_GatekeeperBaseDamage;
	Template.iClipSize = default.PA_GatekeeperClipSize;
	Template.iSoundRange = default.PA_GatekeeperSoundRange;
	Template.iEnvironmentDamage = default.PA_GatekeeperEnvDamage;
	Template.iIdealRange = default.PA_GatekeeperIdealRange;
	Template.DamageTypeTemplateName = 'Heavy';

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');

	Template.GameArchetype = "WP_Gatekeeper_Anima_Gate.WP_Gatekeeper_Anima_Gate";
	Template.iPhysicsImpulse = 5;
	Template.CanBeBuilt = false;
	Template.TradingPostValue = 30;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate CreateTemplate_GatekeeperPsiAmp()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'PA_GatekeeperPsiAmp');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_GatekeeperPsiAmpCat';
	Template.WeaponTech = 'alien';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Psi_Amp";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Psi';

	Template.Abilities.AddItem('PsiDimensionalRift');
	
	Template.ExtraDamage = default.PA_GatekeeperPsiExtraDamage; 

	// PsiAmpT3_AbilityDamage = (Damage=7, Spread = 1, PlusOne = 0, Crit = 0, Pierce = 0, Tag = "Soulfire", DamageType="Psi")
	// PsiAmpT3_AbilityDamage = (Damage=4, Spread = 1, PlusOne = 75, Crit = 0, Pierce = 0, Tag = "VoidRift", DamageType="Psi")
	// PsiAmpT3_AbilityDamage = (Damage=11, Spread = 2, PlusOne = 68, Crit = 0, Pierce = 0, Tag = "NullLance", DamageType="Psi")

	Template.StartingItem = true;
	Template.CanBeBuilt = false;

	Template.bInfiniteItem = true;

	return Template;
}