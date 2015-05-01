//
//  RecipeViewController.m
//  RecipeAppDo1
//
//  Created by Warren Goh on 4/29/15.
//  Copyright (c) 2015 WG. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecipesTableDataSource.h"
#import "DetailViewController.h"
#import "RARecipes.h"

static NSString *theId = @"cell";

@interface RecipeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic)UITableView *tableView;// declaring uitableview Property
@property (strong, nonatomic)RecipesTableDataSource *datasource;
@property (strong, nonatomic) UIScrollView *subViewScroller;

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"Recipes";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.datasource = [RecipesTableDataSource new];
    self.tableView.dataSource = self.datasource;
    
    self.tableView.delegate = self;
    
    
    [self.view addSubview: self.tableView];

}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return RARecipes.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSString *recipeTitle = [RARecipes titleAtIndex:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:theId];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:theId];
    }
    cell.textLabel.text = theId;
    return cell;
    
}

-(void)tableView: (UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *subViewRecipe = [DetailViewController new];
    
    subViewRecipe.view.backgroundColor = [UIColor whiteColor];
    subViewRecipe.title = [RARecipes titleAtIndex:indexPath.row];
    subViewRecipe.recipeIndex = indexPath.row;
    [self.navigationController pushViewController:subViewRecipe animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
