class X2PA_GatekeeperAbility extends X2Ability config (GameData_AbilityData);

var name PA_OpenAbilityName;		// Ability name referenced in code/script
var name PA_ToggledOpenCloseUnitValue;	// Unit value name referenced in code/script
var name PA_ClosedEffectName;			// Closed effect name referenced in code/script

var config StatCheck RETRACT_CHECK;


// ================================================================
// Initial State ability 
// ================================================================

//* Initial State ability boolean

var config bool PA_Gatekeeper_InitialStateDontDisplayInAbilitySummary;


// ================================================================
// Open ability
// ================================================================

//* ----------- Open ability int -----------
var config int PA_Gatekeeper_OpenAbilityCost;
var config int PA_Gatekeeper_OpenCooldown;

//* ----------- Open ability boolean -----------
var config bool PA_Gatekeeper_PA_IsOpenAbilityFreeCost;

//* ----------- Open ability const -----------
const PA_Gatekeeper_Closed_Value=0;
const PA_Gatekeeper_Open_Value=1;

//* ----------- Open ability name -----------
var private name PA_OpenedEffectName;


// ================================================================
// Close ability
// ================================================================

//* ----------- Close ability int ----------- 
var config int PA_Gatekeeper_CloseAbilityCost;
var config int PA_Gatekeeper_CloseCooldown;

var config int PA_Gatekeeper_ClosedArmor_Adjust;
var config int PA_Gatekeeper_ClosedArmorChance_Adjust;
var config int PA_Gatekeeper_ClosedSight_Adjust;
var config int PA_Gatekeeper_ClosedDefense_Adjust;

//* ----------- Close ability boolean ----------- 
var config bool PA_Gatekeeper_CloseMoveBegin_DontDisplayInAbilitySummary;
var config bool PA_Gatekeeper_IsCloseAbilityFreeCost;


// ================================================================
// Anima Inversion ability
// ================================================================

//* ----------- Anima Inversion ability damage -----------

var config WeaponDamageValue PA_Gatekeeper_AnimaInversion_Damage;

//* ----------- Anima Inversion int ----------- 
var config int PA_Gatekeeper_AnimaInversion_ActionPointCost;
var config int PA_Gatekeeper_AnimaInversion_Cooldown;
var config int PA_Gatekeeper_AnimaInversion_Radius;
var config int PA_Gatekeeper_AnimaInversion_AbilityRange;

//* ----------- FX value ----------- 
var config int PA_Gatekeeper_AnimaInversion_StartAnimationMinDelaySec;
var config int PA_Gatekeeper_AnimaInversion_StartAnimationMaxDelaySec;

//* ----------- Anima Inversion boolean ----------- 
var config bool PA_Gatekeeper_DoesAnimaInversion_ConsumeAllPoints;
var config bool PA_Gatekeeper_DoesAnimaInversion_IgnoreBlockingCover;
var config bool PA_Gatekeeper_DoesAnimaInversion_RestrictToSquadsightRange;
var config bool PA_Gatekeeper_DoesAnimaInversion_IgnoreArmor;
var config bool PA_Gatekeeper_DoesAnimaInversion_AlwaysKillsCivilians;
var config bool PA_Gatekeeper_AnimaInversionDontDisplayInAbilitySummary;

//* ----------- Anima Inversion Exclude rules ----------- 
var config bool PA_Gatekeeper_DoesAnimaInversion_ExcludeDead;
var config bool PA_Gatekeeper_DoesAnimaInversion_ExcludeAlive;
var config bool PA_Gatekeeper_DoesAnimaInversion_ExcludeFriendlyToSource;
var config bool PA_Gatekeeper_DoesAnimaInversion_ExcludeHostileToSource;
var config bool PA_Gatekeeper_DoesAnimaInversion_ExcludeRobotic;
var config bool PA_Gatekeeper_DoesAnimaInversion_ExcludeOrganic;
var config bool PA_Gatekeeper_DoesAnimaInversion_ExcludeAlien;
var config bool PA_Gatekeeper_DoesAnimaInversion_ExcludeCivilian;


// ================================================================
// Anima Consume ability
// ================================================================

//* ----------- Anima Consume int ----------- 

var config int PA_Gatekeeper_AnimaConsume_ActionPoints;
var config int PA_Gatekeeper_AnimaConsume_LifeStealMultiplier;
var config int PA_Gatekeeper_AnimaConsume_Cooldown;
var config int PA_Gatekeeper_AnimaConsume_WithinRange;

//* ----------- Anima Consume boolean ----------- 
var config bool PA_Gatekeeper_DoesAnimaConsume_ConsumeAllPoints;
var config bool PA_Gatekeeper_AnimaConsume_RequireWithinRange;
var config bool PA_Gatekeeper_AnimaConsume_FailOnNonUnits;
var config bool PA_Gatekeeper_AnimaConsumeDontDisplayInAbilitySummary;


//* ----------- Anima Consume Exlude rules ----------- 
var config bool PA_Gatekeeper_AnimaConsume_ExcludeDead;
var config bool PA_Gatekeeper_AnimaConsume_ExcludeFriendlyToSource;
var config bool PA_Gatekeeper_AnimaConsume_ExcludeHostileToSource;
var config bool PA_Gatekeeper_AnimaConsume_ExcludeRobotic;
var config bool PA_Gatekeeper_AnimaConsume_ExcludeAlive;
var config bool PA_Gatekeeper_AnimaConsume_ExcludeOrganic;
var config bool PA_Gatekeeper_AnimaConsume_ExcludeAlien;
var config bool PA_Gatekeeper_AnimaConsume_ExcludeCivilian;


// ================================================================
// Anima Gate ability
// ================================================================

//* ----------- Anima Gate int ----------- 
var config int PA_Gatekeeper_AnimaGate_ActionPointCost;
var config int PA_Gatekeeper_AnimaGateCooldown;

//* ----------- Anima Gate boolean ----------- 
var config bool PA_Gatekeeper_AnimaGateDontDisplayInAbilitySummary;
var config bool PA_Gatekeeper_DoesAnimaGateAllowSquadsight;
var config bool PA_Gatekeeper_DoesAnimaGate_ConsumeAllPoints;

// ================================================================
// Domination ability
// ================================================================

//* ----------- Domination int -----------
var config int PA_Domination_ActionPointCost;
var config int PA_Domination_InitialCharges;
var config int PA_Domination_NumChargesCost;
var config int PA_Domination_Cooldown;
var config int PA_Domination_TargetRadius;

//* ----------- Domination boolean -----------
var config bool PA_Domination_DontDisplayInAbilitySummary;
var config bool PA_Domination_ConsumeAllPoints;
var config bool PA_Domination_DoNotApplyCooldownOnHit;
var config bool PA_Domination_OnlyOnHitCost;
var config bool PA_Gatekeeper_DoesDomination_ExcludeRobotic;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreatePA_Domination());

	return Templates;
}

static function X2AbilityTemplate CreatePA_Domination()
{
	local X2AbilityTemplate             Template;
	local X2AbilityCost_ActionPoints    ActionPointCost;
	local X2AbilityMultiTarget_Radius 	RadiusMultiTarget;
	local X2Condition_UnitProperty      UnitPropertyCondition;
	local X2Effect_MindControl          MindControlEffect;
	local X2Effect_StunRecover			StunRecoverEffect;
	local X2Condition_UnitEffects       EffectCondition;
	local X2AbilityCharges              Charges;
	local X2AbilityCost_Charges         ChargeCost;
	local X2AbilityCooldown             Cooldown;
	local X2Condition_UnitImmunities	UnitImmunityCondition;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;
	local X2Condition_UnitValue	PA_IsOpen;
	local X2AbilityTarget_Cursor CursorTarget;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_Domination');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_domination";
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_MAJOR_PRIORITY;
	Template.Hostility = eHostility_Offensive;
	Template.bDontDisplayInAbilitySummary = default.PA_Domination_DontDisplayInAbilitySummary;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_Domination_ActionPointCost;
	ActionPointCost.bConsumeAllPoints = default.PA_Domination_ConsumeAllPoints;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.PA_Domination_InitialCharges;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = default.PA_Domination_NumChargesCost;
	ChargeCost.bOnlyOnHit = default.PA_Domination_OnlyOnHitCost;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_Domination_Cooldown;
	Cooldown.bDoNotApplyOnHit = default.PA_Domination_DoNotApplyCooldownOnHit;
	Template.AbilityCooldown = Cooldown;
	
	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.BaseValue = 50;
	Template.AbilityToHitCalc = StatCheck;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = true;
	UnitPropertyCondition.ExcludeRobotic = default.PA_Gatekeeper_DoesDomination_ExcludeRobotic;
	UnitPropertyCondition.FailOnNonUnits = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);	

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.PA_Domination_TargetRadius;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	// Only available if the Gatekeeper is Open
	PA_IsOpen = new class'X2Condition_UnitValue';
	PA_IsOpen.AddCheckValue(default.PA_OpenAbilityName, PA_Gatekeeper_Open_Value, eCheck_Exact, , , 'AA_GatekeeperClosed');
	Template.AbilityShooterConditions.AddItem(PA_IsOpen);
	
	EffectCondition = new class'X2Condition_UnitEffects';
	EffectCondition.AddExcludeEffect(class'X2Effect_MindControl'.default.EffectName, 'AA_UnitIsMindControlled');
	Template.AbilityTargetConditions.AddItem(EffectCondition);

	UnitImmunityCondition = new class'X2Condition_UnitImmunities';
	UnitImmunityCondition.AddExcludeDamageType('Mental');
	UnitImmunityCondition.bOnlyOnCharacterTemplate = true;
	Template.AbilityTargetConditions.AddItem(UnitImmunityCondition);

	//  mind control target
	MindControlEffect = class'X2StatusEffects'.static.CreateMindControlStatusEffect(1, false, true);
	Template.AddTargetEffect(MindControlEffect);

	StunRecoverEffect = class'X2StatusEffects'.static.CreateStunRecoverEffect();
	Template.AddTargetEffect(StunRecoverEffect);

	Template.AddTargetEffect(class'X2StatusEffects'.static.CreateMindControlRemoveEffects());

	Template.AbilityTargetStyle = CursorTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.ActivationSpeech = 'Domination';
	Template.SourceMissSpeech = 'SoldierFailsControl';

	Template.CustomFireAnim = 'HL_Psi_MindControl';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.CinescriptCameraType = "Psionic_FireAtUnit";

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'Domination'
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
//END AUTOGENERATED CODE: Template Overrides 'Domination'
	
	return Template;
}


DefaultProperties
{
	PA_OpenAbilityName="Open/ClosedState"
	PA_ToggledOpenCloseUnitValue="PA_ToggledOpenCloseUnitValue"
	PA_ClosedEffectName="GatekeeperClosedEffect"
	PA_OpenedEffectName="GatekeeperOpenEffect"
}
