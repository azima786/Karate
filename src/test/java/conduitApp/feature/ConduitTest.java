package conduitApp.feature;


import static org.junit.jupiter.api.Assertions.*;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.*;
//import com.intuit.karate.junit5.Karate;
//import com.intuit.karate.junit5.Karate.Test;

@KarateOptions( tags = {"debug", "@regression"})
class ConduitTest {
    
    //@Karate.Test
    //Karate testAll() {
    //    return Karate.run().relativeTo(getClass());
    //}

	//@Karate.Test
    //Karate testTags() {
    //    return Karate.run().tags("@debug").relativeTo(getClass());
    //}
	@Test
	void testParallel() {
        Results results = Runner.parallel(getClass(), 5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }



}
