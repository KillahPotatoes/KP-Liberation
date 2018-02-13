import { Preset, FolderStructureInfo } from './Config';
import * as path from "path";

export class MissionPaths {

    static readonly missionSQM = 'mission.sqm';

    private preset: Preset;

    private folderStructure: FolderStructureInfo;

    constructor(preset: Preset, folderStructure: FolderStructureInfo) {
        this.preset = preset;
        this.folderStructure = folderStructure;
    }

    public getMap(): string {
        return this.preset.map;
    }

    public getName(): string {
        return this.preset.missionName;
    }

    public getFullName(): string {
        return [this.getName(), this.getMap()].join('.');
    }

    public getWorkDir(): string {
        return this.folderStructure.workDir;
    }

    /**
     * Get path to source mission.sqm file
     */
    public getMissionSqmPath(): string {
        return path.resolve(
            this.folderStructure.missionsFolder,
            this.preset.sourceFolder,
            'mission.sqm'
        );
    }

    /**
     * Get path to folder with mission framework files.
     */
    public getFrameworkPath(): string {
        return path.resolve(this.folderStructure.frameworkFolder);
    }

    /** 
     * Get path to folder containing mission files 
     */
    public getOutputDir(): string {
        return path.resolve(
            this.folderStructure.workDir,
            this.getFullName()
        );
    }

    /** 
     * Get path to file with mission configuration.
     * As defined in preset.
     */
    public getMissionConfigFilePath(): string {
        return path.resolve(
            this.getOutputDir(),
            this.preset.configFile
        );
    }

}
