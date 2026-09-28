# muGame.rb

$count

class String
    
    
    
    
    def lastChar
        
        result = self[self.size - 1 ]
        
        return result
        
    end
    
    
    
    def ruleOne
        
        
        if ( self.lastChar.eql?("I") )
            
            result = self + "U"
            
        else
            
            result = self

        end
        
        
        
        
        return result
        
    end
    
    
    
    def ruleTwo
        

        
        len = self.size
        
        if ( self[0] == "M" )
        
            
        
            x = self[ ( 1 .. len ) ]
            
            result = "M" + x + x
            
        else
            
            result = self
            
            
        end
        
        
        
        
        
        return result
        
    end
    
    
    
    
    def ruleThree

        
        if ( self.include?("III" ) ) 

            result = self.sub("III" , "U" )
            
        else
            
            result = self
            
        end
        
        
        
        
        return result
        
    end
    
    
       
    
    def ruleFour

        
        if ( self.include?("UU" ) ) 
            
            result = self.sub("UU" , "" )
            
        else
            
            result = self
            
        end
        
        
        
        
        return result
        
    end
    
    
    
    def applyRules
        
        resultString = ""
        
        valueList = self.split(",")
        
        valueList.each do
            |item|
            
            resultString = resultString + item.ruleOne + "," + item.ruleTwo + "," + item.ruleThree + "," +  item.ruleFour
        
        end

        return resultString
        
    end
    
    
    
    
        
    def removeDuplicates
    
        cleanString = ""
        
        valueList = self.split(",")
        
        pre = valueList.size
    
        valueList.tally.each do
        |value|

        cleanString = cleanString + value[0] + ","
    
        end

        cleanList = cleanString.split(",") # removes trailing comma
        
        cleanString = cleanList.join(",")
        
        post = cleanList.size
        
        #print " ",pre," ",post

        return cleanString
    
    end

    
     
    def checkForTarget(target)
    
        result = false
        
        valueList = self.split(",")
        
    
        valueList.each do
            |item|
        
            if ( item.eql?(target) )
            
                result = true
            
            end
        
        
        end
    
    
        return result
    end
    
    
    
end # of class String



def cycle(valueString)
    
    valueString = valueString.applyRules
    
    #print "\nDEBUG: valueString is = ",valueString
    
    valueString = valueString.removeDuplicates
    
    #print "\nDEBUG: valueString is = ",valueString
    
    $count = $count + 1
    
    return valueString
    
end




#######################################################################
#######################################################################
#######################################################################
#######################################################################
#######################################################################


valueString = "MI"

$count = 0


stop = false

begin

    valueString = cycle(valueString)

    #print "\n[",$count,"] valueString is = ",valueString
    
    stop = valueString.checkForTarget("MU")
    
    depth = valueString.split(",").size
    
    print "\n",$count," ",stop," ",depth
    
end while ( ( stop == false ) && ( $count < 100 )  )


