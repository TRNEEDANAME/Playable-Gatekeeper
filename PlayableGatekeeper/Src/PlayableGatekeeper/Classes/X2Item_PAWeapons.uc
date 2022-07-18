class X2Item_PAWeapons extends X2Item
	config(PlayableGateKeeper);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> ModWeapons;
	`log ("davea debug weapon-create-templates enter");
	ModWeapons.AddItem(CreateTemplate_PA_GatekeeperGun());

	`log ("davea debug weapon-create-templates done");
	
	return ModWeapons;
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
	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_CONVENTIONAL_RANGE;
	// Template.BaseDamage = class'X2Item_DefaultWeapons'.default.GATEKEEPERMP_WPN_BASEDAMAGE;
	Template.BaseDamage = class'X2Item_DefaultWeapons'.default.ANDROMEDON_WPN_BASEDAMAGE;
	Template.iClipSize = 1;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.iIdealRange = class'X2Item_DefaultWeapons'.default.GATEKEEPER_IDEALRANGE;
	Template.DamageTypeTemplateName = 'Heavy';
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	// added as class levels up: Template.Abilities.AddItem('Suppression');
	// added as class levels up: Template.Abilities.AddItem('Execute');
	Template.GameArchetype = "WP_Gatekeeper_Anima_Gate.WP_Gatekeeper_Anima_Gate";
	Template.iPhysicsImpulse = 5;
	Template.CanBeBuilt = false;
	Template.TradingPostValue = 30;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate CreateTemplate_GatePsiAmp()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'GatePsiAmp');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'PA_SpecterPsiCat';
	Template.WeaponTech = 'alien';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Psi_Amp";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer); //invalidates multiplayer availability

	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Psi';

	Template.Abilities.AddItem('PsiDimensionalRift');
	
	Template.ExtraDamage = class'X2Item_DefaultWeapons'.default.PSIAMPT3_ABILITYDAMAGE;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;

	Template.bInfiniteItem = true;

	return Template;
}