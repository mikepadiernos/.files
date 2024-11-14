/**
 * Extend to add your own settings tabs
 */
export declare abstract class SettingsTabProvider {
    id: string;
    icon: string;
    title: string;
    weight: number;
    prioritized: boolean;
    getComponentType(): any;
}
