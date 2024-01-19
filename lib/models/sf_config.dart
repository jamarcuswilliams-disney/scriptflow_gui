class SFConfig {
  SFConfig({
    required this.flowDir,
    required this.flowCommandDir,
    required this.flowFileName,
    required this.defaultFlowActionPath,
    required this.terminalProfile,
    required this.initialized,
  });

  final String flowDir;
  final String flowCommandDir;
  final String flowFileName;
  final String defaultFlowActionPath;
  final String terminalProfile;
  final bool initialized;

  /// copyWith
  SFConfig copyWith({
    String? flowDir,
    String? flowCommandDir,
    String? flowFileName,
    String? defaultFlowActionPath,
    String? terminalProfile,
    bool? initialized,
  }) {
    return SFConfig(
      flowDir: flowDir ?? this.flowDir,
      flowCommandDir: flowCommandDir ?? this.flowCommandDir,
      flowFileName: flowFileName ?? this.flowFileName,
      defaultFlowActionPath:
          defaultFlowActionPath ?? this.defaultFlowActionPath,
      terminalProfile: terminalProfile ?? this.terminalProfile,
      initialized: initialized ?? this.initialized,
    );
  }

  /// default
  static SFConfig get defaultConfig => SFConfig(
        flowDir: '\$USER_HOME/.flows',
        flowCommandDir: '\$USER_HOME/.flows/commands',
        flowFileName: 'flows.json',
        defaultFlowActionPath: '.',
        terminalProfile: 'bash',
        initialized: false,
      );

  /// fromJson
  factory SFConfig.fromJson(Map<String, dynamic> json) => SFConfig(
        flowDir: json['flowDir'] as String,
        flowCommandDir: json['flowCommandDir'] as String,
        flowFileName: json['flowFileName'] as String,
        defaultFlowActionPath: json['defaultFlowActionPath'] as String,
        terminalProfile: json['terminalProfile'] as String,
        initialized: json['initialized'] as bool,
      );
}
