function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %TODO
  B = double(rgb2gray(imread(image_path)));
  B = reshape(B, size(B,1)*size(B,2), 1);
  B = B - m;
  pr_img_test = eigenfaces' * B;
  
  min_dist = [];
  for i = 1 : 10
    val = norm(pr_img_test - pr_img(:,i));
    min_dist(:,i) = val;
  endfor
  
  [min_dist output_img_index] = min(min_dist);
  end