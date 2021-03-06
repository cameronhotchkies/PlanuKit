//
//  NuMessage.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/20/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef enum
{
    kNuMessageTypeOutbound          =  0,
    kNuMessageTypeSystem            =  1,
    kNuMessageTypeTerraforming      =  2,
    kNuMessageTypeMinelaying        =  3,
    kNuMessageTypeMineSweep         =  4,
    kNuMessageTypeColony            =  5,
    kNuMessageTypeCombat            =  6,
    kNuMessageTypeFleet             =  7,
    kNuMessageTypeShip              =  8,
    kNuMessageTypeEnemyDistressCall =  9,
    kNuMessageTypeExplosion         = 10,
    kNuMessageTypeStarbase          = 11,
    kNuMessageTypeWebMines          = 12,
    kNuMessageTypeMeteors           = 13,
    kNuMessageTypeSensorSweep       = 14,
    kNuMessageTypeBioScan           = 15,
    kNuMessageTypeDistressCall      = 16,
    kNuMessageTypePlayer            = 17,
    kNuMessageTypeDiplomacy         = 18,
    kNuMessageTypeMineScan          = 19,
    kNuMessageTypeDarkSense         = 20,
    kNuMessageTypeHiss              = 21
} NuMessageType;

@class NuTurn;

@interface NuMessage : NSManagedObject

@property (nonatomic, strong) NSString * body;
@property (nonatomic, strong) NSString * headline;
@property (nonatomic) int32_t messageId;
@property (nonatomic) int16_t messageType;
@property (nonatomic) int32_t ownerId;
@property (nonatomic) int32_t target;
@property (nonatomic) int32_t turnNumber;
@property (nonatomic) int16_t x;
@property (nonatomic) int16_t y;
@property (nonatomic) BOOL isPlayerMessage;
@property (nonatomic, strong) NuTurn *turn;

+ (NuMessage*)messageFromJson:(NSDictionary*)input 
                  withContext:(NSManagedObjectContext*)context;

@end
