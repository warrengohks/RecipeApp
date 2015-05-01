//
//  RecipesTableDataSource.m
//  RecipeAppDo1
//
//  Created by Warren Goh on 4/29/15.
//  Copyright (c) 2015 WG. All rights reserved.
//

#import "RecipesTableDataSource.h"
#import "RARecipes.h"
#import "RecipeViewController.h"

static NSString *theId = @"cell";


@implementation RecipesTableDataSource

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section{
    
    return [RARecipes count];
}

- (UITableViewCell *) tableView: (UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: theId];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier: theId];
    
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
    cell.detailTextLabel.text = [RARecipes descriptionAtIndex:indexPath.row];
    cell.detailTextLabel.numberOfLines = 1;
    
    return cell;
    
    
    
}

- (void) registerTableView:(UITableView *)tableView
{
    
}


@end
