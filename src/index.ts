import { registerPlugin } from '@capacitor/core';

import type { WidgetsBridgePluginPlugin } from './definitions';

const WidgetsBridgePlugin = registerPlugin<WidgetsBridgePluginPlugin>('WidgetsBridgePlugin');

export * from './definitions';
export { WidgetsBridgePlugin };
