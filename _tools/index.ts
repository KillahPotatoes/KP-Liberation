import { resolve } from "path";

import { Preset, FolderStructureInfo } from "./src";
import { BuilderConfiguration } from "./src";
import { buildMission } from "./src";


const presets: Preset[] = require('./_presets.json');

const builderConf: BuilderConfiguration = {
    outputDir: resolve("../build"),
    async: false,
    verbose: true,
    zip: true,
    pbo: true
};

const paths: FolderStructureInfo = {
    frameworkFolder: resolve('..', 'Missionframework'),
    missionsFolder: resolve('..', 'Missionbasefiles', 'kp_liberation.'),
    missionConfigFile: 'kp_liberation_config.sqf',
    workDir: resolve(builderConf.outputDir)
};

buildMission(presets, paths, builderConf);

console.log();