class X2PA_GatekeeperAbility extends X2Ability config (GameData_AbilityData);

// ================================================================
// Domination ability
// ================================================================

//* ----------- Domination int -----------
var config int PA_Domination_ActionPointCost;
var config int PA_Domination_InitialCharges;
var config int PA_Domination_NumChargesCost;
var config int PA_Domination_Cooldown;
var config int PA_Domination_TargetRadius;
var config int PA_Domination_Range;

//* ----------- Domination boolean -----------
var config bool PA_Domination_DontDisplayInAbilitySummary;
var config bool PA_Domination_ConsumeAllPoints;
var config bool PA_Domination_DoNotApplyCooldownOnHit;
var config bool PA_Domination_OnlyOnHitCost;
var config bool PA_Gatekeeper_DoesDomination_ExcludeRobotic;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(Create_PA_Domination());

	return Templates;
}

	static function X2AbilityTemplate Create_PA_Domination()
{
	local X2AbilityTemplate                       Template;
	local X2AbilityCost_ActionPoints              ActionPointCost;
	local X2AbilityMultiTarget_Radius 	          RadiusMultiTarget;
	local X2Condition_UnitProperty                UnitPropertyCondition;
	local X2Effect_MindControl                    MindControlEffect;
	local X2Effect_StunRecover		    	          StunRecoverEffect;
	local X2Condition_UnitEffects                 EffectCondition;
	local X2AbilityCharges                        Charges;
	local X2AbilityCost_Charges                   ChargeCost;
	local X2AbilityCooldown                       Cooldown;
	local X2Condition_UnitImmunities	            UnitImmunityCondition;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;
	local X2Condition_UnitValue	                  PA_IsOpen;
	local X2AbilityTarget_Cursor                  CursorTarget;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_Domination');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_domination";
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_MAJOR_PRIORITY;
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_Domination_ActionPointCost;
	ActionPointCost.bConsumeAllPoints = default.PA_Domination_ConsumeAllPoints;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.PA_Domination_InitialCharges;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = default.PA_Domination_NumChargesCost;
	ChargeCost.bOnlyOnHit = true;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_Domination_Cooldown;
	Cooldown.bDoNotApplyOnHit = true;
	Template.AbilityCooldown = Cooldown;
	
	StatCheck = new class'X2AbilityToHitCalc_StatCheck_UnitVsUnit';
	StatCheck.BaseValue = 50;
	Template.AbilityToHitCalc = StatCheck;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.PA_Domination_TargetRadius;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	RadiusMultiTarget.bAllowDeadMultiTargetUnits = true;
	RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToSquadsightRange = true;
	CursorTarget.FixedAbilityRange = default.PA_Domination_Range;
	Template.AbilityTargetStyle = CursorTarget;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.TargetingMethod = class'X2TargetingMethod_MassPsiReanimation';

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);	
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

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

	Template.AbilityTargetStyle = default.SimpleSingleTarget;
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
	PA_ToggledOpenCloseUnitValue="ToggledOpenCloseUnitValue"
	PA_ClosedEffectName="GatekeeperClosedEffect"
	PA_OpenedEffectName="GatekeeperOpenEffect"
}
