//
//  DetailViewController.m
//  RecipeAppDo1
//
//  Created by Warren Goh on 4/30/15.
//  Copyright (c) 2015 WG. All rights reserved.
//

#import "DetailViewController.h"
#import "RARecipes.h"
#import "RecipeViewController.h"
#import "RecipesTableDataSource.h"

CGFloat heightHolder;

@interface DetailViewController ()


@end
static CGFloat margin = 20;
static CGFloat marginVertical = 30;


@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [RARecipes titleAtIndex:self.recipeIndex];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //creating scrollview and initaiting scroll view.
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:scrollView];
    
   // where description will begin
    CGFloat topMargin = 20;
    
    
    topMargin += 10;
    
    CGFloat heightForDescription = [self heightForDescription:[RARecipes descriptionAtIndex:self.recipeIndex]];
    
    UILabel *descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(margin, topMargin, self.view.frame.size.width - 2 * margin, heightForDescription)];
    descriptionLabel.text = [RARecipes descriptionAtIndex:self.recipeIndex];
    descriptionLabel.numberOfLines = 0;
    [scrollView addSubview:descriptionLabel];
    
    CGFloat top = topMargin + heightForDescription + marginVertical;
    
    UILabel *ingredientsLabel = [[UILabel alloc]initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
    ingredientsLabel.text = @"Ingredients:";
    ingredientsLabel.font = [UIFont systemFontOfSize:17];
    [scrollView addSubview:ingredientsLabel];
    
    //create for loop to loop through the various records and declare the counter to run through the records. 
    for (int i = 0; i<[RARecipes ingredientCountAtIndex:self.recipeIndex]; i++) {
        top += marginVertical - 5;
        
        ingredientsLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2.5, top, self.view.frame.size.width - 2 * margin, 20)];
        
        ingredientsLabel.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [scrollView addSubview:ingredientsLabel];
        
        UILabel *volumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + 15, top, self.view.frame.size.width - 2 * margin, 20)];
        volumeLabel.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [scrollView addSubview:volumeLabel];
    }
    
    top += marginVertical + 20;
    
    UILabel *directionLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
    directionLabel.text = @"Directions:";
    directionLabel.font = [UIFont systemFontOfSize:17];
    [scrollView addSubview:directionLabel];
    
    top += marginVertical;
    
    NSArray *directions = [RARecipes directionsAtIndex:self.recipeIndex];
    
    for (int i = 0; i<[directions count]; i++) {
        CGFloat heightForDirections = [self heightForDirections:[directions objectAtIndex:i]];
        
        directionLabel = [[UILabel alloc]initWithFrame:CGRectMake(margin + 15, top, self.view.frame.size.width - 2 * margin - 15, heightForDirections)];
        
        directionLabel.numberOfLines = 0;
        directionLabel.font =[UIFont systemFontOfSize:17];
        directionLabel.text = [directions objectAtIndex:i];
        
        
        [scrollView addSubview:directionLabel];
        
        top += marginVertical / 2.0 + heightForDirections;
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top);
}

-(CGFloat)heightForDescription:(NSString *)description{
    
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return bounding.size.height;
}

-(CGFloat)heightForDirections:(NSString *)description{
    
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin - 15, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return bounding.size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end