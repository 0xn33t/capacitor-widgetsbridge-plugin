export interface WidgetsBridgePluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
