package util;

import java.util.Collections;
import java.util.List;
import java.util.Random;

public class ShuffleUtil {
	
	/**
	 * 打乱列表实现方法1
	 * @param list
	 */
    public static <T> void shuffle1(List<T> list) {
        int size = list.size();
        Random random = new Random();
        for(int i = 0; i < size; i++) {
            // 获取随机位置
            int randomPos = random.nextInt(size);
            // 当前元素与随机元素交换
            T temp = list.get(i);
            list.set(i, list.get(randomPos));
            list.set(randomPos, temp);
        }
    }
    
    /**
     * 打乱列表实现方法2
     * @param list
     */
    public static <T> void shuffle2(List<T> list) {
        int size = list.size();
        Random random = new Random();
        for(int i = 0; i < size; i++) {
            // 获取随机位置
            int randomPos = random.nextInt(size);
            // 当前元素与随机元素交换
            Collections.swap(list, i, randomPos);
        }
    }
    
    /**
     * 打乱列表实现方法3
     * @param list
     */// 打乱顺序
    public static <T> void shuffle3(List<T> list) {
        Collections.shuffle(list);
    }
    
    /**
     * 在[0,total)里生成一个长度为total的不重复的随机队列
     * @param total
     * @return
     */
    public static int[] GetRandomSequence(int total){

        int[] sequence = new int[total];
        int[] output = new int[total];

        for (int i = 0; i < total; i++){
            sequence[i] = i;
        }
        Random random = new Random();

        int end = total - 1;

        for (int i = 0; i < total; i++){
            int num = random.nextInt(end + 1);
            output[i] = sequence[num];
            sequence[num] = sequence[end];
            end--;
        }
        return output;
    }
    
    /**
     * 在[0,total)里生成一个长度为len的不重复的随机队列
     * @param total
     * @param len
     * @return
     */
    public static int[] GetRandomSequence2(int total, int len){
        int[] sequence = new int[total];
        int[] output = new int[len];

        for (int i = 0; i < total; i++){
            sequence[i] = i;
        }

        Random random = new Random();

        int end = total - 1;

        for (int i = 0; i < len; i++){
            int num = random.nextInt(end + 1);
            output[i] = sequence[num];
            sequence[num] = sequence[end];
            end--;
        }
        return output;
    }
    
    /**
     * 打印列表
     * @param list
     */
    public static <T> void print(List<T> list) {
        for(T t : list) {
            System.out.print(t + " ");
        }
        
        System.out.println("\n");
    }
    
}
