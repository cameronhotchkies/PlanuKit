//
//  NuTurn.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/23/11.
//  Copyright 2011 Roboboogie Studios. All rights reserved.
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

#import "NuTurn.h"
#import "NuPlanet.h"
#import "NuStarbase.h"
#import "NuIonStorm.h"
#import "NuShip.h"

@implementation NuTurn

@synthesize planetList, gameSettings, player, ionStorms, ships;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(BOOL)loadFromDict:(NSDictionary*)input
{
    NSDictionary* settingsDict = [input objectForKey:@"settings"];
    
    NuGameSettings* settings = [[[NuGameSettings alloc] init] autorelease];
    
    [settings loadFromDict:settingsDict];
    self.gameSettings = settings;
    
    NSMutableArray* pl = [NSMutableArray array];
    
    for (NSDictionary* planetDict in [input objectForKey:@"planets"])
    {
        NuPlanet* planet = [[NuPlanet alloc] init];
        
        [planet loadFromDict:planetDict];
        
        [pl addObject:planet];
        
        [planet release];
    }
    
    self.planetList = pl;
    
    self.player = [[[NuPlayer alloc] init] autorelease];
    [self.player loadFromDict:[input objectForKey:@"player"]];
    
    // Load starbases
    NSArray* starbases = [input objectForKey:@"starbases"];
    
    for (NSDictionary* sbDict in starbases)
    {
        NuStarbase* sb = [[[NuStarbase alloc] init] autorelease];
        
        [sb loadFromDict:sbDict];
        
        for (NuPlanet* sbp in self.planetList)
        {
            if (sb.planetId == sbp.planetId)
            {
                sbp.starbase = sb;
            }
        }
    }
    
    // Load Ion Storms
    NSMutableArray* ions = [NSMutableArray array];
    
    for (NSDictionary* stormDict in [input objectForKey:@"ionstorms"])
    {
        NuIonStorm* storm = [[[NuIonStorm alloc] init] autorelease];
        
        [storm loadFromDict:stormDict];
        [ions addObject:storm];
    }
    
    self.ionStorms = ions;
    
    // Load Ships
    NSMutableArray* starships = [NSMutableArray array];
    
    for (NSDictionary* shipDict in [input objectForKey:@"ships"])
    {
        NuShip* ship = [[[NuShip alloc] init] autorelease];
        
        [ship loadFromDict:shipDict];
        [starships addObject:ship];
    }
    
    self.ships = starships;
    
    return NO;
}

@end