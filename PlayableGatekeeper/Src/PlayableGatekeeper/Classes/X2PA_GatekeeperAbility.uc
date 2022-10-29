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

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(PurePassive('PA_ProtectiveShell', "img:///UILibrary_PerkIcons.UIPerk_gatekeeper_armoredshell"));
    Templates.AddItem(PurePassive('PA_GatekeeperDeathExplosion', "img:///UILibrary_PerkIcons.UIPerk_gatekeeper_deathexplosion"));

	Templates.AddItem(CreatePA_InitialStateAbility());
	Templates.AddItem(CreatePA_GatekeeperOpenAbility());
	Templates.AddItem(CreatePA_GatekeeperCloseAbility());
	Templates.AddItem(CreatePA_GatekeeperCloseMoveBeginAbility());
	Templates.AddItem(CreatePA_RetractDamageListenerAbility());
	Templates.AddItem(CreatePA_RetractAbility());
	Templates.AddItem(CreatePA_MassPsiReanimationAbility());
	Templates.AddItem(CreatePA_Gatekeeper_AnimaConsumeAbility());
	Templates.AddItem(CreatePA_AnimaGateAbility());
	Templates.AddItem(CreatePA_Domination());

	return Templates;
}

// Add initial ability on PostBeginPlay to initialize Gatekeeper with Closed effects.
static function X2AbilityTemplate CreatePA_InitialStateAbility()
{
	local X2AbilityTemplate					Template;
	local X2AbilityTrigger_UnitPostBeginPlay Trigger;
	local X2Effect_PersistentStatChange		CloseGatekeeperEffect;
	local X2Effect_SetUnitValue				SetClosedValue;
	local X2Effect_DamageImmunity           DamageImmunity;
	local X2Effect_OverrideDeathAction      DeathActionEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_GatekeeperInitialState');

	Template.bDontDisplayInAbilitySummary = default.PA_Gatekeeper_InitialStateDontDisplayInAbilitySummary;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AdditionalAbilities.AddItem('PA_GatekeeperOpen');
	Template.AdditionalAbilities.AddItem('PA_GatekeeperClose');
	Template.AdditionalAbilities.AddItem('PA_GatekeeperCloseMoveBegin');
	Template.AdditionalAbilities.AddItem('PA_ProtectiveShell');
	Template.AdditionalAbilities.AddItem('PA_GateKeeperDeathExplosion');

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	// Set initial effect - Closed persistent effect.
	CloseGatekeeperEffect = class'X2StatusEffect_PA_Gatekeeper'.static.CreatePA_GatekeeperClosedEffect();
	Template.AddTargetEffect(CloseGatekeeperEffect);

	// Set initial effect - Closed value.
	SetClosedValue = new class'X2Effect_SetUnitValue';
	SetClosedValue.UnitName = default.PA_OpenAbilityName;
	SetClosedValue.NewValueToSet = PA_Gatekeeper_Closed_Value;
	SetClosedValue.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(SetClosedValue);

	// Build the immunities
	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.BuildPersistentEffect(1, true, true, true);
	DamageImmunity.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.KnockbackDamageType);
	DamageImmunity.ImmuneTypes.AddItem('Fire');
	DamageImmunity.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
	DamageImmunity.EffectName = 'PA_GatekeeperDamageImmunityEffect';
	Template.AddTargetEffect(DamageImmunity);

	DeathActionEffect = new class'X2Effect_OverrideDeathAction';
	DeathActionEffect.DeathActionClass = class'X2Action_ExplodingUnitDeathAction';
	DeathActionEffect.EffectName = 'PA_GatekeeperDeathActionEffect';
	Template.AddTargetEffect(DeathActionEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate CreatePA_GatekeeperOpenAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
    local X2AbilityCooldown                 Cooldown;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2Effect_SetUnitValue				SetOpenValue, SetToggledValue;
	local X2Condition_UnitValue				IsClosed;
	local X2Effect_RemoveEffects            RemoveClosedEffect;
	local X2Effect_PerkAttachForFX       	OpenGatekeeperEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_GatekeeperOpen');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_gatekeeper_open"; // TODO: This needs to be changed
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Neutral;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_Gatekeeper_OpenAbilityCost;
	ActionPointCost.bFreeCost = default.PA_Gatekeeper_PA_IsOpenAbilityFreeCost;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	// Cooldown on the ability
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_Gatekeeper_OpenCooldown;
	Template.AbilityCooldown = Cooldown;
	
	// Set up conditions for Closed check.
	IsClosed = new class'X2Condition_UnitValue';
	IsClosed.AddCheckValue(default.PA_OpenAbilityName, PA_Gatekeeper_Closed_Value, eCheck_Exact);
	Template.AbilityShooterConditions.AddItem( IsClosed );
	Template.AbilityShooterConditions.AddItem( default.LivingShooterProperty );

	// ------------
	// Open effects.  Requires condition IsClosed.
	// 1. Remove Closed Effect.
	RemoveClosedEffect = new class'X2Effect_RemoveEffects';
	RemoveClosedEffect.EffectNamesToRemove.AddItem(default.PA_ClosedEffectName);
	Template.AddTargetEffect(RemoveClosedEffect);
	// 2. Set value to Open.
	SetOpenValue = new class'X2Effect_SetUnitValue';
	SetOpenValue.UnitName = default.PA_OpenAbilityName;
	SetOpenValue.NewValueToSet = PA_Gatekeeper_Open_Value;
	SetOpenValue.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(SetOpenValue);
	// 3. Set value toggled value.
	SetToggledValue = new class'X2Effect_SetUnitValue';
	SetToggledValue.UnitName = default.PA_ToggledOpenCloseUnitValue;
	SetToggledValue.NewValueToSet = 1;
	SetToggledValue.CleanupType = eCleanup_BeginTurn;
	Template.AddTargetEffect(SetToggledValue);
	// 4. Set Open effect.
	OpenGatekeeperEffect = new class'X2Effect_PerkAttachForFX';
	OpenGatekeeperEffect.EffectName = default.PA_OpenedEffectName;
	Template.AddTargetEffect(OpenGatekeeperEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = PA_GatekeeperOpenClose_BuildVisualization;
	Template.bSkipFireAction = true;
	Template.CinescriptCameraType = "Gatekeeper_Open";

	return Template;
}

static function X2AbilityTemplate CreatePA_GatekeeperCloseAbility(optional Name AbilityName = 'GatekeeperClose')
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCooldown                 Cooldown;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2Effect_SetUnitValue				SetClosedValue, SetToggledValue;
	local X2Condition_UnitValue				PA_IsOpen;
	local X2Effect_PersistentStatChange		PA_CloseGatekeeperEffect;
	local X2Effect_RemoveEffects            RemoveOpenedEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_gatekepper_shut"; // TODO: This needs to be changed
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.Hostility = eHostility_Neutral;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_Gatekeeper_CloseAbilityCost;
	ActionPointCost.bFreeCost = default.PA_Gatekeeper_IsCloseAbilityFreeCost;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	// Set up conditions for Open check.
	PA_IsOpen = new class'X2Condition_UnitValue';
	PA_IsOpen.AddCheckValue(default.PA_OpenAbilityName, PA_Gatekeeper_Open_Value, eCheck_Exact);
	Template.AbilityShooterConditions.AddItem(PA_IsOpen);

	Template.AbilityShooterConditions.AddItem( default.LivingShooterProperty );

	// Cooldown on the ability
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_Gatekeeper_CloseCooldown;
	Template.AbilityCooldown = Cooldown;

	// ------------
	// Closed effects.  Requires condition PA_IsOpen

	// 1. Set Closed effect.
	PA_CloseGatekeeperEffect = class'X2StatusEffect_PA_Gatekeeper'.static.CreatePA_GatekeeperClosedEffect();
	Template.AddTargetEffect(PA_CloseGatekeeperEffect);

	// 2. Set value to Closed.
	SetClosedValue = new class'X2Effect_SetUnitValue';
	SetClosedValue.UnitName = default.PA_OpenAbilityName;
	SetClosedValue.NewValueToSet = PA_Gatekeeper_Closed_Value;
	SetClosedValue.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(SetClosedValue);

	// 3. Set value toggled value.
	SetToggledValue = new class'X2Effect_SetUnitValue';
	SetToggledValue.UnitName = default.PA_ToggledOpenCloseUnitValue;
	SetToggledValue.NewValueToSet = 1;
	SetToggledValue.CleanupType = eCleanup_BeginTurn;
	Template.AddTargetEffect(SetToggledValue);

	// 4. Remove Opened Effect.
	RemoveOpenedEffect = new class'X2Effect_RemoveEffects';
	RemoveOpenedEffect.EffectNamesToRemove.AddItem(default.PA_OpenedEffectName);
	Template.AddTargetEffect(RemoveOpenedEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = PA_GatekeeperOpenClose_BuildVisualization;
	Template.bSkipFireAction = true;
	Template.CinescriptCameraType = "Gatekeeper_Close";

	return Template;
}

// This is a special ability that interrupts movement to force a close if the Gatekeeper is open

static function X2AbilityTemplate CreatePA_GatekeeperCloseMoveBeginAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTrigger_EventListener    EventListener;

	Template = CreatePA_GatekeeperCloseAbility('GatekeeperCloseMoveBegin');
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;

	Template.bDontDisplayInAbilitySummary = default.PA_Gatekeeper_CloseMoveBegin_DontDisplayInAbilitySummary;
	Template.AbilityCosts.Length = 0;

	Template.AbilityTriggers.Length = 0;

	// At the start of a move, if the unit is open, have it close
	EventListener = new class'X2AbilityTrigger_EventListener';
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventID = 'ObjectMoved';
	EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_InterruptSelf;
	EventListener.ListenerData.Filter = eFilter_Unit;
	Template.AbilityTriggers.AddItem(EventListener);

	Template.CustomFireAnim = '';
	Template.BuildVisualizationFn = none;
	Template.bSkipFireAction = true;

	return Template;
}

simulated function PA_GatekeeperOpenClose_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateContext_Ability  Context;
	local StateObjectReference          UnitRef;
	local X2Action_AnimSetTransition	GatekeeperTransition;
	local XComGameState_Unit			Gatekeeper;
	local UnitValue						OpenClosedValue;

	local VisualizationActionMetadata        EmptyTrack;
	local VisualizationActionMetadata        ActionMetadata;
	local XComGameStateHistory		History;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());

	if( Context.IsResultContextHit() )
	{
		History = `XCOMHISTORY;	
		UnitRef = Context.InputContext.SourceObject;

		//Configure the visualization track for the shooter
		//****************************************************************************************
		ActionMetadata = EmptyTrack;
		ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(UnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
		ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(UnitRef.ObjectID);
		ActionMetadata.VisualizeActor = History.GetVisualizer(UnitRef.ObjectID);
		Gatekeeper = XComGameState_Unit(ActionMetadata.StateObject_NewState);

		GatekeeperTransition = X2Action_AnimSetTransition(class'X2Action_AnimSetTransition'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
		GatekeeperTransition.Params.AnimName = 'NO_Close'; // Closed by default.

		if(Gatekeeper.GetUnitValue(PA_OpenAbilityName, OpenClosedValue) )
		{
			if( OpenClosedValue.fValue == PA_Gatekeeper_Open_Value )
			{
				GatekeeperTransition.Params.AnimName = 'NO_Open';
			}
		}

			}
	//****************************************************************************************
}

static function X2AbilityTemplate CreatePA_RetractDamageListenerAbility()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_EventListener EventListener;
	local X2Effect_RunBehaviorTree RetractBehaviorEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_RetractDamageListener');
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.bDontDisplayInAbilitySummary = true;

	// This ability fires when the unit takes damage
	EventListener = new class'X2AbilityTrigger_EventListener';
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventID = 'UnitTakeEffectDamage';
	EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	EventListener.ListenerData.Filter = eFilter_Unit;
	Template.AbilityTriggers.AddItem(EventListener);

	Template.AbilityTargetStyle = default.SelfTarget;

	RetractBehaviorEffect = new class'X2Effect_RunBehaviorTree';
	RetractBehaviorEffect.BehaviorTreeName = 'TryRetract';
	Template.AddTargetEffect(RetractBehaviorEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

// Retract has a chance to close based on a stat contest btwn damage amount and PA_Gatekeeper will.
static function X2AbilityTemplate CreatePA_RetractAbility()
{
	local X2AbilityTemplate Template;
	local X2Condition_UnitValue				PA_IsOpen;
	local X2Effect_SetUnitValue				SetClosedValue;
	local X2Effect_PersistentStatChange		ClosePA_GatekeeperEffect;
	local X2Effect_RemoveEffects            RemoveOpenedEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_Retract');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_PA_Gatekeeper_retract";

	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Defensive;

	Template.AdditionalAbilities.AddItem('PA_RetractDamageListener');

	PA_IsOpen = new class'X2Condition_UnitValue';
	PA_IsOpen.AddCheckValue(default.PA_OpenAbilityName, PA_Gatekeeper_Open_Value, eCheck_Exact);

	Template.AbilityShooterConditions.AddItem(PA_IsOpen);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_Placeholder');
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	// 1. Set Closed effect.  
	ClosePA_GatekeeperEffect = class'X2StatusEffect_PA_Gatekeeper'.static.CreatePA_GatekeeperClosedEffect();
	Template.AddTargetEffect(ClosePA_GatekeeperEffect);
	// 2. Set value to Closed.
	SetClosedValue = new class'X2Effect_SetUnitValue';
	SetClosedValue.UnitName = default.PA_OpenAbilityName;
	SetClosedValue.NewValueToSet = PA_Gatekeeper_Closed_Value;
	SetClosedValue.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(SetClosedValue);
	// 4. Remove Opened Effect.
	RemoveOpenedEffect = new class'X2Effect_RemoveEffects';
	RemoveOpenedEffect.EffectNamesToRemove.AddItem(default.PA_OpenedEffectName);
	Template.AddTargetEffect(RemoveOpenedEffect);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = PA_GatekeeperOpenClose_BuildVisualization;

	return Template;
}

static function X2AbilityTemplate CreatePA_MassPsiReanimationAbility()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints ActionPointCost;
	local X2AbilityCooldown Cooldown;
	local X2AbilityMultiTarget_Radius RadiusMultiTarget;
	local X2AbilityTarget_Cursor CursorTarget;
	local X2Effect_Knockback KnockbackEffect;
	local X2Effect_ApplyWeaponDamage PsiDamageEffect;
	local X2Condition_UnitProperty UnitPropertyCondition;
	local X2Condition_UnitValue UnitValue;
	local X2Effect_SpawnPsiZombie SpawnZombieEffect;
	local X2Condition_UnitValue	PA_IsOpen;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_AnimaInversion');

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_gatekeeper_animainversion";
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.bShowActivation = true;

	Template.bDontDisplayInAbilitySummary = default.PA_Gatekeeper_AnimaInversionDontDisplayInAbilitySummary;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_Gatekeeper_AnimaInversion_ActionPointCost;
	ActionPointCost.bConsumeAllPoints = default.PA_Gatekeeper_DoesAnimaInversion_ConsumeAllPoints;
	Template.AbilityCosts.AddItem(ActionPointCost);

	// Cooldown on the ability.
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_Gatekeeper_AnimaInversion_Cooldown;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	// Only available if the Gatekeeper is Open
	PA_IsOpen = new class'X2Condition_UnitValue';
	PA_IsOpen.AddCheckValue(default.PA_OpenAbilityName, PA_Gatekeeper_Open_Value, eCheck_Exact, , , 'AA_GatekeeperClosed');
	Template.AbilityShooterConditions.AddItem(PA_IsOpen);

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.PA_Gatekeeper_AnimaInversion_Radius;
	RadiusMultiTarget.bIgnoreBlockingCover = default.PA_Gatekeeper_DoesAnimaInversion_IgnoreBlockingCover;
	RadiusMultiTarget.bAllowDeadMultiTargetUnits = true;
	RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToSquadsightRange = default.PA_Gatekeeper_DoesAnimaInversion_RestrictToSquadsightRange;
	CursorTarget.FixedAbilityRange = default.PA_Gatekeeper_AnimaInversion_AbilityRange;
	Template.AbilityTargetStyle = CursorTarget;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.TargetingMethod = class'X2TargetingMethod_MassPsiReanimation';

	// Everything in the blast radius receives psi damage
	PsiDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	PsiDamageEffect.EffectDamageValue = default.PA_Gatekeeper_AnimaInversion_Damage;
	PsiDamageEffect.EffectDamageValue.DamageType = 'Psi';
	PsiDamageEffect.bIgnoreArmor = default.PA_Gatekeeper_DoesAnimaInversion_IgnoreArmor;
	PsiDamageEffect.bAlwaysKillsCivilians = default.PA_Gatekeeper_DoesAnimaInversion_AlwaysKillsCivilians;

	// Targets for damage must be alive
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeAlive = false;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeHostileToSource = false;
	PsiDamageEffect.TargetConditions.AddItem(UnitPropertyCondition);

	Template.AddMultiTargetEffect(PsiDamageEffect);

	// DO NOT CHANGE THE ORDER OF THE DAMAGE AND THIS EFFECT
	// Everything in the blast radius receives the knockback
	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 2;
	KnockbackEffect.OverrideRagdollFinishTimerSec = 2.0f;

	// Targets for knockback could have just died must be alive
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = default.PA_Gatekeeper_DoesAnimaInversion_ExcludeDead;
	UnitPropertyCondition.ExcludeAlive = default.PA_Gatekeeper_DoesAnimaInversion_ExcludeAlive;
	UnitPropertyCondition.ExcludeFriendlyToSource = default.PA_Gatekeeper_DoesAnimaInversion_ExcludeFriendlyToSource;
	UnitPropertyCondition.ExcludeHostileToSource = default.PA_Gatekeeper_DoesAnimaInversion_ExcludeHostileToSource;
	UnitPropertyCondition.FailOnNonUnits = true;
	KnockbackEffect.TargetConditions.AddItem(UnitPropertyCondition);

	Template.AddMultiTargetEffect(KnockbackEffect);
	// DO NOT CHANGE THE ORDER OF THE DAMAGE AND THIS EFFECT

	// DO NOT CHANGE THE ORDER OF THE DAMAGE AND THIS EFFECT
	// Apply this effect to any units that are dead. This will include units
	// killed by the X2Effect_ApplyWeaponDamage above.
	SpawnZombieEffect = new class'X2Effect_SpawnPsiZombie';
	SpawnZombieEffect.AnimationName = 'HL_GetUp_Multi';
	SpawnZombieEffect.BuildPersistentEffect(1);
	SpawnZombieEffect.DamageTypes.AddItem('psi');
	SpawnZombieEffect.StartAnimationMinDelaySec = default.PA_Gatekeeper_AnimaInversion_StartAnimationMinDelaySec;
	SpawnZombieEffect.StartAnimationMaxDelaySec = default.PA_Gatekeeper_AnimaInversion_StartAnimationMaxDelaySec;

	// The unit must be organic, dead, and not an alien
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = default.PA_Gatekeeper_DoesAnimaInversion_ExcludeDead;
	UnitPropertyCondition.ExcludeAlive = default.PA_Gatekeeper_DoesAnimaInversion_ExcludeAlive;
	UnitPropertyCondition.ExcludeRobotic = default.PA_Gatekeeper_DoesAnimaInversion_ExcludeRobotic;
	UnitPropertyCondition.ExcludeOrganic = default.PA_Gatekeeper_DoesAnimaInversion_ExcludeOrganic;
	UnitPropertyCondition.ExcludeAlien = default.PA_Gatekeeper_DoesAnimaInversion_ExcludeAlien;
	UnitPropertyCondition.ExcludeCivilian = default.PA_Gatekeeper_DoesAnimaInversion_ExcludeCivilian;
	UnitPropertyCondition.ExcludeCosmetic = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = default.PA_Gatekeeper_DoesAnimaInversion_ExcludeFriendlyToSource;
	UnitPropertyCondition.ExcludeHostileToSource = default.PA_Gatekeeper_DoesAnimaInversion_ExcludeHostileToSource;
	UnitPropertyCondition.FailOnNonUnits = true;
	SpawnZombieEffect.TargetConditions.AddItem(UnitPropertyCondition);

	// This effect is only valid if the target has not yet been turned into a zombie
	UnitValue = new class'X2Condition_UnitValue';
	UnitValue.AddCheckValue(class'X2Effect_SpawnPsiZombie'.default.TurnedZombieName, 1, eCheck_LessThan);
	SpawnZombieEffect.TargetConditions.AddItem(UnitValue);

	Template.AddMultiTargetEffect(SpawnZombieEffect);
	// DO NOT CHANGE THE ORDER OF THE DAMAGE AND THIS EFFECT

	Template.bSkipPerkActivationActions = true;
	Template.bSkipPerkActivationActionsSync = false;
	Template.CustomFireAnim = 'NO_AnimaInversion';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = PA_AnimaInversion_BuildVisualization;
	Template.CinescriptCameraType = "Gatekeeper_AnimaInversion";
//BEGIN AUTOGENERATED CODE: Template Overrides 'AnimaInversion'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'AnimaInversion'

	return Template;
}

simulated function PA_AnimaInversion_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability Context;
	local StateObjectReference InteractingUnitRef;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata GatekeeperTrack, ActionMetadata, ZombieTrack;
	local XComGameState_Unit SpawnedUnit, DeadUnit;
	local UnitValue SpawnedUnitValue;
	local X2Effect_SpawnPsiZombie SpawnPsiZombieEffect;
	local int i, j;
	local name SpawnPsiZombieEffectResult;
	local X2VisualizerInterface TargetVisualizerInterface;
	local X2Action ExitCoverAction;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	GatekeeperTrack = EmptyTrack;
	GatekeeperTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	GatekeeperTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	GatekeeperTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	class'X2Action_AbilityPerkStart'.static.AddToVisualizationTree(GatekeeperTrack, Context);
	ExitCoverAction = class'X2Action_ExitCover'.static.AddToVisualizationTree(GatekeeperTrack, Context);

	//If we were interrupted, insert a marker node for the interrupting visualization code to use. In the move path version above, it is expected for interrupts to be 
	//done during the move.
	if (Context.InterruptionStatus != eInterruptionStatus_None)
	{
		//Insert markers for the subsequent interrupt to insert into
		class'X2Action'.static.AddInterruptMarkerPair(GatekeeperTrack, Context, ExitCoverAction);
	}

	class'X2Action_Fire'.static.AddToVisualizationTree(GatekeeperTrack, Context);
	class'X2Action_EnterCover'.static.AddToVisualizationTree(GatekeeperTrack, Context);
	class'X2Action_AbilityPerkEnd'.static.AddToVisualizationTree(GatekeeperTrack, Context);

	// Configure the visualization track for the multi targets
	//******************************************************************************************
	for( i = 0; i < Context.InputContext.MultiTargets.Length; ++i )
	{
		InteractingUnitRef = Context.InputContext.MultiTargets[i];
		ActionMetadata = EmptyTrack;
		ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
		ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
		ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);

		for( j = 0; j < Context.ResultContext.MultiTargetEffectResults[i].Effects.Length; ++j )
		{
			SpawnPsiZombieEffect = X2Effect_SpawnPsiZombie(Context.ResultContext.MultiTargetEffectResults[i].Effects[j]);
			SpawnPsiZombieEffectResult = 'AA_UnknownError';

			if( SpawnPsiZombieEffect != none )
			{
				SpawnPsiZombieEffectResult = Context.ResultContext.MultiTargetEffectResults[i].ApplyResults[j];
			}
			else
			{
				Context.ResultContext.MultiTargetEffectResults[i].Effects[j].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, Context.ResultContext.MultiTargetEffectResults[i].ApplyResults[j]);
			}
		}

		TargetVisualizerInterface = X2VisualizerInterface(ActionMetadata.VisualizeActor);
		if( TargetVisualizerInterface != none )
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
		}

		if( SpawnPsiZombieEffectResult == 'AA_Success' )
		{
			DeadUnit = XComGameState_Unit(VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID));
			`assert(DeadUnit != none);
			DeadUnit.GetUnitValue(class'X2Effect_SpawnUnit'.default.SpawnedUnitValueName, SpawnedUnitValue);

			ZombieTrack = EmptyTrack;
			ZombieTrack.StateObject_OldState = History.GetGameStateForObjectID(SpawnedUnitValue.fValue, eReturnType_Reference, VisualizeGameState.HistoryIndex);
			ZombieTrack.StateObject_NewState = ZombieTrack.StateObject_OldState;
			SpawnedUnit = XComGameState_Unit(ZombieTrack.StateObject_NewState);
			`assert(SpawnedUnit != none);
			ZombieTrack.VisualizeActor = History.GetVisualizer(SpawnedUnit.ObjectID);

			SpawnPsiZombieEffect.AddSpawnVisualizationsToTracks(Context, SpawnedUnit, ZombieTrack, DeadUnit, ActionMetadata);
		}
	}

	TypicalAbility_AddEffectRedirects(VisualizeGameState, GatekeeperTrack);
}

static function X2AbilityTemplate CreatePA_Gatekeeper_AnimaConsumeAbility()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints ActionPointCost;
	local X2AbilityCooldown Cooldown;
	local X2Condition_UnitValue	PA_IsOpen;
	local X2Condition_UnitProperty TargetPropertyCondition;
	local X2Effect_ApplyWeaponDamage WeaponDamageEffect;
	local X2Effect_LifeSteal LifeStealEffect;
	local X2Effect_SpawnPsiZombie SpawnZombieEffect;
	local X2Condition_UnitValue UnitValue;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_AnimaConsume');

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_gatekeeper_animaconsume";

	Template.bDontDisplayInAbilitySummary = default.PA_Gatekeeper_AnimaConsumeDontDisplayInAbilitySummary;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_Gatekeeper_AnimaConsume_ActionPoints;
	ActionPointCost.bConsumeAllPoints = default.PA_Gatekeeper_DoesAnimaConsume_ConsumeAllPoints;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = new class'X2AbilityToHitCalc_StandardMelee';

	Template.AbilityTargetStyle = default.SimpleSingleMeleeTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// Shooter Conditions
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	// Cooldown on the ability
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_Gatekeeper_AnimaConsume_Cooldown;
	Template.AbilityCooldown = Cooldown;

	// Set up conditions for Open check.
	PA_IsOpen = new class'X2Condition_UnitValue';
	PA_IsOpen.AddCheckValue(default.PA_OpenAbilityName, PA_Gatekeeper_Open_Value, eCheck_Exact, , , 'AA_GatekeeperClosed');
	Template.AbilityShooterConditions.AddItem(PA_IsOpen);

	// Target Conditions
	// This may target friendly or hostile units within melee range
	TargetPropertyCondition = new class'X2Condition_UnitProperty';
	TargetPropertyCondition.ExcludeDead = default.PA_Gatekeeper_AnimaConsume_ExcludeDead;
	TargetPropertyCondition.ExcludeFriendlyToSource = default.PA_Gatekeeper_AnimaConsume_ExcludeFriendlyToSource;
	TargetPropertyCondition.ExcludeHostileToSource = default.PA_Gatekeeper_AnimaConsume_ExcludeHostileToSource;
	TargetPropertyCondition.FailOnNonUnits = true;
	TargetPropertyCondition.RequireWithinRange = default.PA_Gatekeeper_AnimaConsume_RequireWithinRange;
	TargetPropertyCondition.WithinRange = default.PA_Gatekeeper_AnimaConsume_WithinRange;

	Template.AbilityTargetConditions.AddItem(TargetPropertyCondition);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AddShooterEffectExclusions();

	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.EffectDamageValue = class'X2Item_DefaultWeapons'.default.Gatekeeper_AnimaConsume_BaseDamage;
	Template.AddTargetEffect(WeaponDamageEffect);

	// Life Steal Effect - Same as damage target but must be organic
	TargetPropertyCondition = new class'X2Condition_UnitProperty';
	TargetPropertyCondition.ExcludeDead = default.PA_Gatekeeper_AnimaConsume_ExcludeDead;
	TargetPropertyCondition.ExcludeFriendlyToSource = default.PA_Gatekeeper_AnimaConsume_ExcludeFriendlyToSource;
	TargetPropertyCondition.ExcludeHostileToSource = default.PA_Gatekeeper_AnimaConsume_ExcludeHostileToSource;
	TargetPropertyCondition.FailOnNonUnits = default.PA_Gatekeeper_AnimaConsume_FailOnNonUnits;
	TargetPropertyCondition.ExcludeRobotic = default.PA_Gatekeeper_AnimaConsume_ExcludeRobotic;

	LifeStealEffect = new class'X2Effect_LifeSteal';
	LifeStealEffect.LifeAmountMultiplier = default.PA_Gatekeeper_AnimaConsume_LifeStealMultiplier;
	LifeStealEffect.TargetConditions.AddItem(TargetPropertyCondition);
	LifeStealEffect.DamageTypes.AddItem('psi');
	Template.AddTargetEffect(LifeStealEffect);

	// DO NOT CHANGE THE ORDER OF THE DAMAGE AND THIS EFFECT
	// Apply this effect to the target if it died
	SpawnZombieEffect = new class'X2Effect_SpawnPsiZombie';
	SpawnZombieEffect.BuildPersistentEffect(1);
	SpawnZombieEffect.DamageTypes.AddItem('psi');

	// The unit must be organic, dead, and not an alien
	TargetPropertyCondition = new class'X2Condition_UnitProperty';
	TargetPropertyCondition.ExcludeDead = default.PA_Gatekeeper_AnimaConsume_ExcludeDead;
	TargetPropertyCondition.ExcludeAlive = default.PA_Gatekeeper_AnimaConsume_ExcludeAlive;
	TargetPropertyCondition.ExcludeRobotic = default.PA_Gatekeeper_AnimaConsume_ExcludeRobotic;
	TargetPropertyCondition.ExcludeOrganic = default.PA_Gatekeeper_AnimaConsume_ExcludeOrganic;
	TargetPropertyCondition.ExcludeAlien = default.PA_Gatekeeper_AnimaConsume_ExcludeAlien;
	TargetPropertyCondition.ExcludeCivilian = default.PA_Gatekeeper_AnimaConsume_ExcludeCivilian;
	TargetPropertyCondition.ExcludeCosmetic = true;
	TargetPropertyCondition.ExcludeFriendlyToSource = default.PA_Gatekeeper_AnimaConsume_ExcludeFriendlyToSource;
	TargetPropertyCondition.ExcludeHostileToSource = default.PA_Gatekeeper_AnimaConsume_ExcludeHostileToSource;
	TargetPropertyCondition.FailOnNonUnits = default.PA_Gatekeeper_AnimaConsume_FailOnNonUnits;
	SpawnZombieEffect.TargetConditions.AddItem(TargetPropertyCondition);

	// This effect is only valid if the target has not yet been turned into a zombie
	UnitValue = new class'X2Condition_UnitValue';
	UnitValue.AddCheckValue(class'X2Effect_SpawnPsiZombie'.default.TurnedZombieName, 1, eCheck_LessThan);
	SpawnZombieEffect.TargetConditions.AddItem(UnitValue);

	Template.AddTargetEffect(SpawnZombieEffect);
	// DO NOT CHANGE THE ORDER OF THE DAMAGE AND THIS EFFECT

	Template.CustomFireAnim = 'NO_AnimaConsume';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = PA_Gatekeeper_AnimaConsume_BuildVisualization;
	Template.CinescriptCameraType = "Gatekeeper_Probe";

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'AnimaConsume'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'AnimaConsume'

	return Template;
}

simulated function PA_Gatekeeper_AnimaConsume_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability Context;
	local StateObjectReference InteractingUnitRef;

	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata SourceTrack, ActionMetadata, ZombieTrack;
	local XComGameState_Unit SpawnedUnit, DeadUnit;
	local UnitValue SpawnedUnitValue;
	local X2Effect_SpawnPsiZombie SpawnPsiZombieEffect;
	local X2Action ExitCoverAction;
	local int j;
	local name SpawnPsiZombieEffectResult;
	local X2VisualizerInterface TargetVisualizerInterface;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	SourceTrack = EmptyTrack;
	SourceTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	SourceTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	SourceTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	ExitCoverAction = class'X2Action_ExitCover'.static.AddToVisualizationTree(SourceTrack, Context);

	if (Context.InterruptionStatus != eInterruptionStatus_None)
	{
		//Insert markers for the subsequent interrupt to insert into
		class'X2Action'.static.AddInterruptMarkerPair(SourceTrack, Context, ExitCoverAction);
	}

	class'X2Action_Fire'.static.AddToVisualizationTree(SourceTrack, Context);
	class'X2Action_EnterCover'.static.AddToVisualizationTree(SourceTrack, Context);

	// Configure the visualization track for the psi zombie
	//******************************************************************************************
	InteractingUnitRef = Context.InputContext.PrimaryTarget;
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);

	for( j = 0; j < Context.ResultContext.TargetEffectResults.Effects.Length; ++j )
	{
		SpawnPsiZombieEffect = X2Effect_SpawnPsiZombie(Context.ResultContext.TargetEffectResults.Effects[j]);
		SpawnPsiZombieEffectResult = 'AA_UnknownError';

		if( SpawnPsiZombieEffect != none )
		{
			SpawnPsiZombieEffectResult = Context.ResultContext.TargetEffectResults.ApplyResults[j];
		}
		else
		{
			// Target effect visualization
			Context.ResultContext.TargetEffectResults.Effects[j].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, Context.ResultContext.TargetEffectResults.ApplyResults[j]);

			// Source effect visualization
			Context.ResultContext.TargetEffectResults.Effects[j].AddX2ActionsForVisualizationSource(VisualizeGameState, SourceTrack, Context.ResultContext.TargetEffectResults.ApplyResults[j]);
		}
	}

	TargetVisualizerInterface = X2VisualizerInterface(ActionMetadata.VisualizeActor);
	if( TargetVisualizerInterface != none )
	{
		//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
		TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
	}

	if( SpawnPsiZombieEffectResult == 'AA_Success' )
	{
		DeadUnit = XComGameState_Unit(VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID));
		`assert(DeadUnit != none);
		DeadUnit.GetUnitValue(class'X2Effect_SpawnUnit'.default.SpawnedUnitValueName, SpawnedUnitValue);

		ZombieTrack = EmptyTrack;
		ZombieTrack.StateObject_OldState = History.GetGameStateForObjectID(SpawnedUnitValue.fValue, eReturnType_Reference, VisualizeGameState.HistoryIndex);
		ZombieTrack.StateObject_NewState = ZombieTrack.StateObject_OldState;
		SpawnedUnit = XComGameState_Unit(ZombieTrack.StateObject_NewState);
		`assert(SpawnedUnit != none);
		ZombieTrack.VisualizeActor = History.GetVisualizer(SpawnedUnit.ObjectID);

		SpawnPsiZombieEffect.AddSpawnVisualizationsToTracks(Context, SpawnedUnit, ZombieTrack, DeadUnit, ActionMetadata);
	}
}

static function X2AbilityTemplate CreatePA_AnimaGateAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCooldown 			   Cooldown;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local array<name>                       SkipExclusions;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2Condition_UnitValue				IsClosed;

	// Macro to do localisation and stuffs
	`CREATE_X2ABILITY_TEMPLATE(Template, 'PA_AnimaGate');

	// Icon Properties
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_SHOT_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.DisplayTargetHitChance = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';                                       // color of the icon
	// Activated by a button press; additionally, tells the AI this is an activatable
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.bDontDisplayInAbilitySummary = default.PA_Gatekeeper_AnimaGateDontDisplayInAbilitySummary;

	// Cooldown on the ability
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PA_Gatekeeper_AnimaGateCooldown;
	Template.AbilityCooldown = Cooldown;

	// *** VALIDITY CHECKS *** //
	//  Normal effect restrictions (except disoriented)
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// Set up conditions for Closed check.
	IsClosed = new class'X2Condition_UnitValue';
	IsClosed.AddCheckValue(default.PA_OpenAbilityName, PA_Gatekeeper_Closed_Value, eCheck_Exact, , , 'AA_GatekeeperOpened');
	Template.AbilityShooterConditions.AddItem( IsClosed );

	// Targeting Details
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bAllowSquadsight = default.PA_Gatekeeper_DoesAnimaGateAllowSquadsight;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	// Can only shoot visible enemies
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	// Can't target dead; Can't target friendlies
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	// Can't shoot while dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	// Only at single targets that are in range.
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	
	// Action Point
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.PA_Gatekeeper_AnimaGate_ActionPointCost;
	ActionPointCost.bConsumeAllPoints = default.PA_Gatekeeper_DoesAnimaGate_ConsumeAllPoints;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.EffectDamageValue = class'X2Item_DefaultWeapons'.default.GATEKEEPER_WPN_BASEDAMAGE;
	Template.AddTargetEffect(WeaponDamageEffect);

	// Hit Calculation (Different weapons now have different calculations for range)
	Template.AbilityToHitCalc = default.SimpleStandardAim;
	Template.AbilityToHitOwnerOnMissCalc = default.SimpleStandardAim;
		
	// Targeting Method
	Template.TargetingMethod = class'X2TargetingMethod_OverTheShoulder';
	Template.bUsesFiringCamera = true;

	Template.AssociatedPassives.AddItem('HoloTargeting');

	// MAKE IT LIVE!
	Template.CustomFireAnim = 'FF_AnimaGate';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "StandardGunFiring";

	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'AnimaGate'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'AnimaGate'

	return Template;	
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
	local X2AbilityTarget_Cursor 	CursorTarget;
	local X2AbilityCooldown             Cooldown;
	local X2Condition_UnitImmunities	UnitImmunityCondition;
	local X2AbilityToHitCalc_StatCheck_UnitVsUnit StatCheck;
	local X2Condition_UnitValue	PA_IsOpen;


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
	UnitPropertyCondition.ExcludeRobotic = true;
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
