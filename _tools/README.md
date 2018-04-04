# KP Liberation builder

## Requirements

nodejs version >=7.

## Usage

```bash
# Install dependencies
npm install

# Run mission build
npm run build


# Run task with local gulp via npx
npx gulp <task_name>

# With gulp-cli and gulp 4 installed globally
gulp <task_name>

```
| Task        | Desc                                           |
| ----------- | ---------------------------------------------- |
| clean       | removes `build/` dir                           |
| build       | assembles missionfolder and sets config values |
| pbo         | packs missionfolders into PBOs                 |
| zip         | creates release ZIPs                           |
| __default__ | runs _build_, _pbo_ and _zip_                  |

Build files will be outputted to `build/` dir.

## Configuration

### presets.json

This file should contain an JSON __array__ of `Presets`, for every preset one mission file will be built.

Every `Preset` entry should have following structure:
```javascript
{
    // Source folder with mission.sqm, relative to <missionsFolder>
    // If mission.sqm is in root of <missionsFolder> should be set to empty string
    "sourceFolder": "kp_liberation.Altis", 

    // Name and map is used to build output directory: <missionName>.<map>
    // Name different than source allows to build multiple version of mission on same map
    // Combination of <missionName> and <map> should be unique for every preset
    "missionName": "kp_liberation",
    "map": "Altis",

    // Keys of <variables> object represent variables in <configFile>.
    // These variables values will be set to corresponding value in <variables>
    "configFile": "kp_liberation_config.sqf",
    "variables": {
        "KP_liberation_preset_blufor": 0,
        "KP_liberation_preset_opfor": 0,
        "KP_liberation_preset_resistance": 0,
        "KP_liberation_preset_civilians": 0,
        "KP_liberation_arsenal": 0
    }
}
```

### gulpfile.ts

`paths` variable in _gulpfile_ holds filesystem paths required to build missions.

```typescript
/** 
 * Mission folders configuration
*/
const paths: FolderStructureInfo = {
    // Folder with mission scripts
    frameworkFolder: resolve('..', 'Missionframework'),

    // Folder with base mission.sqm folders
    missionsFolder: resolve('..', 'Missionbasefiles'),

    // Output directory
    workDir: resolve("./build")
};
```